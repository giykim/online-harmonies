//
//  CreateGameSessionPlayers.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/31/26.
//

import Fluent

struct CreateGameSessionPlayers: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(GameSessionPlayer.schema)
            .id()
            .field("game_session_id", .uuid, .required, .references(GameSession.schema, "id"))
            .field("player_id", .uuid, .required, .references(Player.schema, "id"))
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(GameSessionPlayer.schema).delete()
    }
}
