//
//  GameSession.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/30/26.
//

import Fluent
import Vapor

final class GameSession: Model, Content, @unchecked Sendable {
    static let schema = "game_sessions"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "is_active")
    var isActive: Bool
    
    init() { }
    
    init(id: UUID? = nil, isActive: Bool) {
        self.id = id
        self.isActive = isActive
    }
}
