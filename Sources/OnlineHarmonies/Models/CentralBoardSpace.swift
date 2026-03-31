//
//  CentralBoardSpace.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent
import Foundation

final class CentralBoardSpace: Model, @unchecked Sendable {
    static let schema = "central_board_spaces"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "slot")
    var slot: Int
    
    init() { }
    
    init(id: UUID? = nil, slot: Int) {
        self.id = id
        self.slot = slot
    }
}
