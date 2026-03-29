//
//  Token.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/29/26.
//

import Vapor
import Fluent

final class Token: Model, @unchecked Sendable {
    static let schema = "tokens"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "color")
    var color: TokenColor
    
    init() { }
    
    init(id: UUID? = nil, color: TokenColor) {
        self.id = id
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
