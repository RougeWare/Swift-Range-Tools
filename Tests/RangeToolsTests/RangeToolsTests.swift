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
    
    
    static var allTests = [
        ("testRangeWithUpperAndLowerBound", testRangeWithUpperAndLowerBound),
        ("testRangeWithUpperBound", testRangeWithUpperBound),
        ("testRangeWithLowerBound", testRangeWithLowerBound),
    ]
}



func getLowerBound<RangeType: RangeWithLowerBound>(of range: RangeType) -> RangeType.Bound { range.lowerBound }
func getUpperBound<RangeType: RangeWithUpperBound>(of range: RangeType) -> RangeType.Bound { range.upperBound }
