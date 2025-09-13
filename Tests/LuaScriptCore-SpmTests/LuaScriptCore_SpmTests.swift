import XCTest
@testable import LuaScriptCore
@testable import LuaScriptCore_Swift

final class LuaScriptCore_SpmTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        var _context : LuaContext = LuaContext();
        let result = _context.evalScript(script: "print('Hello World');");
        print(result)
    }
}
