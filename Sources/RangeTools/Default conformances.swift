//
//  Default conformances.swift
//  
//
//  Created by Ben Leggiero on 2021-06-07.
//

import Foundation



// MARK: - Access Protocols

extension Range: RangeWithLowerAndUpperBound {
    public static var upperBoundIsInclusive: Bool { false }
}



extension ClosedRange: RangeWithLowerAndUpperBound {
    public static var upperBoundIsInclusive: Bool { true }
}



extension PartialRangeFrom: RangeWithLowerBound {
    public static var upperBoundIsInclusive: Bool { true }
}



extension PartialRangeUpTo: RangeWithUpperBound {
    public static var upperBoundIsInclusive: Bool { false }
}



extension PartialRangeThrough: RangeWithUpperBound {
    public static var upperBoundIsInclusive: Bool { true }
}



#if canImport(ObjectiveC)
extension NSRange: RangeWithLowerAndUpperBound {
    public static var upperBoundIsInclusive: Bool { false }
}
#endif



// MARK: - Initialization Protocols

extension Range: RangeWhichCanBeInitializedWithBothLowerAndUpperBounds {
    public init(lowerBound: Bound, upperBound: Bound) {
        self.init(uncheckedBounds: (lower: lowerBound, upper: upperBound))
    }
}



extension ClosedRange: RangeWhichCanBeInitializedWithBothLowerAndUpperBounds {
    public init(lowerBound: Bound, upperBound: Bound) {
        self.init(uncheckedBounds: (lower: lowerBound, upper: upperBound))
    }
}



extension PartialRangeFrom: RangeWhichCanBeInitializedWithOnlyLowerBound {
    public init(lowerBound: Bound) {
        self.init(lowerBound)
    }
}



extension PartialRangeUpTo: RangeWhichCanBeInitializedWithOnlyUpperBound {
    public init(upperBound: Bound) {
        self.init(upperBound)
    }
}



extension PartialRangeThrough: RangeWhichCanBeInitializedWithOnlyUpperBound {
    public init(upperBound: Bound) {
        self.init(upperBound)
    }
}



#if canImport(ObjectiveC)
extension NSRange: RangeWhichCanBeInitializedWithBothLowerAndUpperBounds {
    public init(lowerBound: Int, upperBound: Int) {
        self.init(Range(lowerBound: lowerBound, upperBound: upperBound))
    }
}
#endif
