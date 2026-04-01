//
//  GameSessionController.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/31/26.
//

import Fluent
import Vapor

struct GameSessionController: RouteCollection {
    func boot(routes: any RoutesBuilder) {
        let sessions = routes.grouped("sessions")
        sessions.post("create", use: createSession)
        
        let games = routes.grouped("games")
        games.get(":sessionId", use: getGame)
        games.post(":sessionId", "join", use: joinSession)
        games.webSocket(":sessionId", "ws", onUpgrade: handleWebSocket)
    }
    
    func createSession(req: Request) async throws -> GameSession {
        let database = req.db
        
        let gameSessionId = UUID()
        let gameSession = GameSession(id: gameSessionId, isActive: false)
        try await gameSession.save(on: database)
        
        try await createTokens(database: database, gameSessionId: gameSessionId)
        
        return gameSession
    }
    
    func createTokens(database: any Database, gameSessionId: UUID) async throws {
        let tokenCounts: [TokenColor: Int] = [
            .blue: 23,
            .gray: 23,
            .brown: 21,
            .green: 19,
            .yellow: 19,
            .red: 15
        ]
        
        for (color, count) in tokenCounts {
            for _ in 1...count {
                let token = Token(gameSessionId: gameSessionId, color: color)
                try await token.save(on: database)
            }
        }
    }
    
    func getGame(req: Request) async throws -> View {
        let sessionId = req.parameters.get("sessionId")!
        
        let context = [
            "sessionId": sessionId
        ]
        
        return try await req.view.render("game", context)
    }
    
    func handleWebSocket(req: Request, ws: WebSocket) async {
        guard let sessionId = req.parameters.get("sessionId", as: UUID.self) else {
            try? await ws.close()
            return
        }
        
        await GameRoomManager.shared.add(ws, to: sessionId)
        
        ws.onClose.whenComplete { _ in
            Task {
                await GameRoomManager.shared.remove(ws, from: sessionId)
            }
        }
    }
    
    func joinSession(req: Request) async throws -> HTTPStatus {
        guard let sessionId = req.parameters.get("sessionId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let playerIdString = req.session.data["playerId"],
              let playerId = UUID(playerIdString) else {
            throw Abort(.unauthorized)
        }
        
        let sessionPlayer = GameSessionPlayer(gameSessionId: sessionId, playerId: playerId)
        try await sessionPlayer.save(on: req.db)
        
        let sessionPlayers = try await GameSessionPlayer.query(on: req.db)
            .filter(\.$gameSession.$id == sessionId)
            .with(\.$player)
            .all()
        
        struct PlayersMessage: Encodable {
            let type: String
            let players: [String]
        }
        
        let usernames = sessionPlayers.map { $0.player.username }
        let message = try JSONEncoder().encode(PlayersMessage(type: "players", players: usernames))
        await GameRoomManager.shared.broadcast(String(data: message, encoding: .utf8) ?? "", to: sessionId)
        
        return .ok
    }
}
