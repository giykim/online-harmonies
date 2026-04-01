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
        let player = Player()
        
        try await player.save(on: req.db)
        
        return player
    }
}
