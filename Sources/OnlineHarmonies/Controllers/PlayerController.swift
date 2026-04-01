//
//  PlayerController.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/31/26.
//

import Fluent
import Vapor

struct PlayerController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let players = routes.grouped("players")
        players.post("create", use: createPlayer)
    }
    
    func createPlayer(req: Request) async throws -> Player {
        let input = try req.content.decode(CreatePlayerDTO.self)
        let username = input.username
        
        let player = Player()
        player.username = username
        try await player.save(on: req.db)
        
        req.session.data["playerId"] = player.id?.uuidString
        
        return player
    }
}
