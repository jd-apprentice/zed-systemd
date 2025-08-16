import XCTest
import SwiftTreeSitter
import TreeSitterSystemdService

final class TreeSitterSystemdServiceTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_systemd_service())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading SystemdService grammar")
    }
}
