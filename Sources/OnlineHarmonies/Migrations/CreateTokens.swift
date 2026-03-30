//
//  CreateTokens.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent

struct CreateTokens: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("tokens")
            .id()
            .field("color", .string, .required)
            .field("space_type", .string, .required)
            .field("space_id", .uuid, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("tokens").delete()
    }
}
