//
//  CreatePlayers.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/30/26.
//

import Fluent

struct CreatePlayers: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(Player.schema)
            .id()
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(Player.schema).delete()
    }
}
