//
//  RangeProtocol.swift
//  
//
//  Created by Ben Leggiero on 2021-06-07.
//  Copyright © 2021 Ben Leggiero BH-1-PS
//

import Foundation



// MARK: - RangeProtocol

/// A protocol to which all ranges conformß
public protocol RangeProtocol {
    
    /// The type for which the expression describes a range.
    associatedtype Bound : Comparable
    
    
    
    /// `true` iff the upper bound of this protocol includes the element at its index, like `a...`, `...b`, and `a...b`. `false` indicates that the upper bound does not include that element, like `..<b` and `a..<b`.
    static var upperBoundIsInclusive: Bool { get }
    
    
    /// Determines whether this range contains the given element
    ///
    /// - Parameter element: The element you want to see if this range contains
    /// - Returns: `true` if `element` is contained in the range expression, otherwise `false`
    func contains(_ element: Bound) -> Bool
}



// MARK: - Ranges with lower bounds

/// A range which has a lower bound, like `a...`, `a...b`, or `a..<b`
public protocol RangeWithLowerBound: RangeProtocol {
    
    /// The range's lower bound
    var lowerBound: Bound { get }
}



/// A range which can be initialized with only its lower bound, like `a...`
public protocol RangeWhichCanBeInitializedWithOnlyLowerBound: RangeWithLowerBound {
    
    /// Initializes this range with its lower bound
    ///
    /// - Parameter lowerBound: The range's initial lower bound
    init(lowerBound: Bound)
}



// MARK: - Ranges with upper bounds

/// A range which has an upper bound, like `...b`, `..<a`, `a...b`, or `a..<b`
public protocol RangeWithUpperBound: RangeProtocol {
    
    /// The range's upper bound
    var upperBound: Bound { get }
}



/// A range which can be initialized with only its upper bound, like `..<b` or `...b`
public protocol RangeWhichCanBeInitializedWithOnlyUpperBound: RangeWithUpperBound {
    
    /// Initializes this range with its upper bound
    ///
    /// - Parameter upperBound: The range's initial upper bound
    init(upperBound: Bound)
}



// MARK: - Ranges with both lower and upper bounds

/// A range which has a lower and upper bound, like `a...b` or `a..<b`
public protocol RangeWithLowerAndUpperBound: RangeWithLowerBound, RangeWithUpperBound {
}



/// A range which can be initialized with only its lower bound, like `a...`
public protocol RangeWhichCanBeInitializedWithBothLowerAndUpperBounds: RangeWithLowerAndUpperBound {
    
    /// Initializes this range with its lower and upper bounds
    ///
    /// - Parameters:
    ///   - lowerBound: The range's initial lower bound
    ///   - upperBound: The range's initial upper bound
    init(lowerBound: Bound, upperBound: Bound)
}
