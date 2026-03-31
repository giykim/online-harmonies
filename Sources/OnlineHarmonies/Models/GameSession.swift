//
//  GameSession.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/30/26.
//

import Fluent
import Foundation

final class GameSession: Model, @unchecked Sendable {
    static let schema = "game_sessions"
    
    @ID(key: .id)
    var id: UUID?
    
    init() { }
}
