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
    
    @Parent(key: "game_session_id")
    var gameSession: GameSession
    
    @Parent(key: "player_id")
    var player: Player
    
    init() { }
    
    init(id: UUID? = nil, gameSessionId: UUID, playerId: UUID) {
        self.id = id
        self.$gameSession.id = gameSessionId
        self.$player.id = playerId
    }
}
