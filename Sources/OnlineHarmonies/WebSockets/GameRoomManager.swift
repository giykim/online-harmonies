//
//  GameRoomManager.swift
//  OnlineHarmonies
//
//  Created by Giyoung Kim on 3/31/26.
//

import Vapor

actor GameRoomManager {
    static let shared = GameRoomManager()
    
    private var rooms: [UUID: [WebSocket]] = [:]
    
    func add(_ ws: WebSocket, to sessionId: UUID) {
        rooms[sessionId, default: []].append(ws)
    }
    
    func broadcast(_ message: String, to sessionId: UUID) async {
        for ws in rooms[sessionId] ?? [] {
            try? await ws.send(message)
        }
    }
    
    func remove(_ ws: WebSocket, from sessionId: UUID) {
        rooms[sessionId]?.removeAll { $0 === ws }
    }
}
