import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MediaLibraryTests.allTests),
        testCase(MediaTests.allTests),
        testCase(MediaCollectionsContainer)
    ]
}
#endif
