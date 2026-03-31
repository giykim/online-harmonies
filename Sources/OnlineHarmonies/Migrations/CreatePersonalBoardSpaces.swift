//
//  CreatePersonalBoardSpaces.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent
import Foundation

struct CreatePersonalBoardSpaces: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("personal_board_spaces")
            .id()
            .field("row", .int8, .required)
            .field("column", .int8, .required)
            .field("player_id", .uuid, .required)
            .create()
        
        for row in 1...5 {
            let num_columns = row % 2 == 0 ? 5 : 4
            for column in 1...num_columns {
                let space = PersonalBoardSpace(row: row, column: column, player_id: UUID())
                try await space.save(on: database)
            }
        }
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("personal_board_spaces").delete()
    }
}
