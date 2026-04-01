//
//  CreateTokens.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent

struct CreateTokens: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(Token.schema)
            .id()
            .field("game_session_id", .uuid, .required)
            .field("color", .string, .required)
            .field("space_type", .string)
            .field("space_id", .uuid)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(Token.schema).delete()
    }
}
