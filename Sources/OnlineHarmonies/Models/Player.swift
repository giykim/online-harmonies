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
    
    @Field(key: "username")
    var username: String
    
    init() { }
    
    init(id: UUID? = nil, username: String) {
        self.id = id
        self.username = username
    }
}
