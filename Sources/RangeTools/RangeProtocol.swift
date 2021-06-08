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
    
    
    
    /// Determines whether this range contains the given element
    ///
    /// - Parameter element: The element you want to see if this range contains
    /// - Returns: `true` if `element` is contained in the range expression, otherwise `false`
    func contains(_ element: Bound) -> Bool
}



// MARK: - RangeWithLowerBound

/// A range which has a lower bound, like `a...`, `a...b`, or `a..<b`
public protocol RangeWithLowerBound: RangeProtocol {
    
    /// The range's lower bound
    var lowerBound: Bound { get }
}



// MARK: - RangeWithUpperBound

/// A range which has an upper bound, like `...a`, `..<a`, `a...b`, or `a..<b`
public protocol RangeWithUpperBound: RangeProtocol {
    
    /// The range's upper bound
    var upperBound: Bound { get }
}



// MARK: - RangeWithLowerAndUpperBound

/// A range which has a lower and upper bound, like `a...b` or `a..<b`
public protocol RangeWithLowerAndUpperBound: RangeWithLowerBound, RangeWithUpperBound {
}
