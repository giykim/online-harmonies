//
//  CreateGameSessions.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/31/26.
//

import Fluent

struct CreateGameSessions: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(GameSession.schema)
            .id()
            .field("is_active", .bool, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(GameSession.schema).delete()
    }
}
