//
//  GameSessionPlayer.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/31/26.
//

import Fluent
import Foundation

final class GameSessionPlayer: Model, @unchecked Sendable {
    static let schema = "game_session_players"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "game_session_id")
    var gameSessionId: UUID
    
    @Field(key: "player_id")
    var playerId: UUID
    
    init() { }
    
    init(id: UUID? = nil, gameSessionId: UUID, playerId: UUID) {
        self.id = id
        self.gameSessionId = gameSessionId
        self.playerId = playerId
    }
}
