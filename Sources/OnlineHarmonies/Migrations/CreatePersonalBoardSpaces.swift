//
//  CreatePersonalBoardSpaces.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent

struct CreatePersonalBoardSpaces: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("personal_board_spaces")
            .id()
            .field("column", .int8, .required)
            .field("row", .int8, .required)
            .field("player_id", .uuid, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("personal_board_spaces").delete()
    }
}
