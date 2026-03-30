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
            .field("space_type", .string)
            .field("space_id", .uuid)
            .create()
        
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
                let token = Token(color: color)
                try await token.save(on: database)
            }
        }
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("tokens").delete()
    }
}
