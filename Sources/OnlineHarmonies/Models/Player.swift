//
//  Player.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/30/26.
//

import Fluent
import Vapor

final class Player: Model, Content, @unchecked Sendable {
    static let schema = "players"
    
    @ID(key: .id)
    var id: UUID?
    
    init() { }
    
    init(id: UUID? = nil) {
        self.id = id
    }
}
