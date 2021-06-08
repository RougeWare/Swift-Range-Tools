import XCTest
@testable import RangeTools

final class RangeToolsTests: XCTestCase {
    
    func testRangeWithUpperAndLowerBound() {
        
        let range5Through7 = 5...7
        let range5To7 = 5..<7
        
        XCTAssertEqual(7, getUpperBound(of: range5Through7))
        XCTAssertEqual(7, getUpperBound(of: range5To7))
        
        XCTAssertEqual(5, getLowerBound(of: range5Through7))
        XCTAssertEqual(5, getLowerBound(of: range5To7))
    }
    
    func testRangeWithUpperBound() {
        XCTAssertEqual(7, getUpperBound(of: 5...7))
        XCTAssertEqual(7, getUpperBound(of: 5..<7))
        XCTAssertEqual(7, getUpperBound(of: ...7))
        XCTAssertEqual(7, getUpperBound(of: ..<7))
    }
    
    
    func testRangeWithLowerBound() {
        XCTAssertEqual(5, getLowerBound(of: 5...7))
        XCTAssertEqual(5, getLowerBound(of: 5..<7))
        XCTAssertEqual(5, getLowerBound(of: 5...))
    }
    
    
    func testInitRangeWithOnlyLowerBound() {
        XCTAssertEqual((42...).lowerBound, PartialRangeFrom(lowerBound: 42).lowerBound)
    }
    
    
    func testInitRangeWithOnlyUpperBound() {
        XCTAssertEqual((..<42).upperBound, PartialRangeUpTo(upperBound: 42).upperBound)
        XCTAssertEqual((...42).upperBound, PartialRangeThrough(upperBound: 42).upperBound)
    }
    
    
    func testInitRangeWithBothLowerAndUpperBound() {
        
        let range34Through42 = 34...42
        let range34To42 = 34..<42
        
        XCTAssertEqual(range34Through42.lowerBound, Range(lowerBound: 34, upperBound: 42).lowerBound)
        XCTAssertEqual(range34To42.lowerBound, ClosedRange(lowerBound: 34, upperBound: 42).lowerBound)
        
        XCTAssertEqual(range34Through42.upperBound, Range(lowerBound: 34, upperBound: 42).upperBound)
        XCTAssertEqual(range34To42.upperBound, ClosedRange(lowerBound: 34, upperBound: 42).upperBound)
    }
    
    
    func test_upperBoundIsInclusive() {
        XCTAssertFalse(type(of:  ..<7).upperBoundIsInclusive)
        XCTAssertTrue (type(of:  ...7).upperBoundIsInclusive)
        XCTAssertFalse(type(of: 5..<7).upperBoundIsInclusive)
        XCTAssertTrue (type(of: 5...7).upperBoundIsInclusive)
        XCTAssertFalse(type(of: NSRange(location: 5, length: 2)).upperBoundIsInclusive)
    }
    
    
    static var allTests = [
        ("testRangeWithUpperAndLowerBound", testRangeWithUpperAndLowerBound),
        ("testRangeWithUpperBound", testRangeWithUpperBound),
        ("testRangeWithLowerBound", testRangeWithLowerBound),
        ("testInitRangeWithOnlyLowerBound", testInitRangeWithOnlyLowerBound),
        ("testInitRangeWithOnlyUpperBound", testInitRangeWithOnlyUpperBound),
        ("testInitRangeWithBothLowerAndUpperBound", testInitRangeWithBothLowerAndUpperBound),
    ]
}



private func getLowerBound<RangeType: RangeWithLowerBound>(of range: RangeType) -> RangeType.Bound { range.lowerBound }
private func getUpperBound<RangeType: RangeWithUpperBound>(of range: RangeType) -> RangeType.Bound { range.upperBound }
