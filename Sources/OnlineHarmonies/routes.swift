import Fluent
import Vapor

struct TokensContext: Encodable {
    let title: String
    let tokens: [Token]
}

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("tokens") { req async throws -> View in
        let tokens = try await Token.query(on: req.db).all()
        let context = TokensContext(title: "Tokens Count", tokens: tokens)
        return try await req.view.render("tokens_display", context)
    }
}
