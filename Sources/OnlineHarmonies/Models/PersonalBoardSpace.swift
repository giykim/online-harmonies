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
    
    @Field(key: "column")
    var column: Int8
    
    @Field(key: "row")
    var row: Int8
    
    @Field(key: "player_id")
    var player_id: UUID
    
    init() { }
    
    init(id: UUID? = nil, column: Int8, row: Int8, player_id: UUID) {
        self.id = id
        self.column = column
        self.row = row
        self.player_id = player_id
    }
}
