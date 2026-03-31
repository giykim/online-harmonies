//
//  Player.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/30/26.
//

import Fluent
import Foundation

final class Player: Model, @unchecked Sendable {
    static let schema = "players"
    
    @ID(key: .id)
    var id: UUID?
    
    init() { }
    
    init(id: UUID? = nil) {
        self.id = id
    }
}
