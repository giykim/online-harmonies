//
//  Token.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Fluent
import Vapor

final class Token: Model, Content, @unchecked Sendable {
    static let schema = "tokens"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "game_session_id")
    var gameSession: GameSession
    
    @Field(key: "color")
    var color: TokenColor
    
    @OptionalField(key: "space_type")
    var spaceType: SpaceType?
    
    @OptionalField(key: "space_id")
    var spaceId: UUID?
    
    init() { }
    
    init(id: UUID? = nil, gameSessionId: UUID, color: TokenColor) {
        self.id = id
        self.$gameSession.id = gameSessionId
        self.color = color
    }
}

enum TokenColor: String, Codable {
    case blue
    case gray
    case brown
    case green
    case yellow
    case red
}

enum SpaceType: String, Codable {
    case centralBoard
    case personalBoard
}
