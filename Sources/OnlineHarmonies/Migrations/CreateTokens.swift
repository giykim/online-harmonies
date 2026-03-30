//
//  CreateTokens.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent

struct CreateTokens: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("tokens")
            .id()
            .field("color", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("tokens").delete()
    }
}
