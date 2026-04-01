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
}
