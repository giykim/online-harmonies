import NIOSSL
import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreatePersonalBoardSpaces())
    app.migrations.add(CreateCentralBoardSpaces())
    app.migrations.add(CreateTokens())

    try await app.autoMigrate()

    app.views.use(.leaf)

    // register routes
    try routes(app)
}
