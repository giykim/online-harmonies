//
//  PersonalBoardSpace.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent
import Foundation

final class PersonalBoardSpace: Model, @unchecked Sendable {
    static let schema = "personal_board_spaces"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "row")
    var row: Int
    
    @Field(key: "column")
    var column: Int
    
    @Field(key: "player_id")
    var playerId: UUID
    
    init() { }
    
    init(id: UUID? = nil, row: Int, column: Int, playerId: UUID) {
        self.id = id
        self.row = row
        self.column = column
        self.playerId = playerId
    }
}
