//
//  CentralBoardSpaces.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent

struct CreateCentralBoardSpaces: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("central_board_spaces")
            .id()
            .field("slot", .int8, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("central_board_spaces").delete()
    }
}
