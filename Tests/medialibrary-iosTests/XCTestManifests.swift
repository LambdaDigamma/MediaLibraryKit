import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(medialibrary_iosTests.allTests),
    ]
}
#endif
