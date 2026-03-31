//
//  CentralBoardSpaces.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent

struct CreateCentralBoardSpaces: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(CentralBoardSpace.schema)
            .id()
            .field("slot", .int8, .required)
            .create()
        
        for slot in 1...5 {
            let space = CentralBoardSpace(slot: slot)
            try await space.save(on: database)
        }
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(CentralBoardSpace.schema).delete()
    }
}
