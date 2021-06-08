//
//  Default conformances.swift
//  
//
//  Created by Ben Leggiero on 2021-06-07.
//

import Foundation



extension Range: RangeWithLowerAndUpperBound {}
extension ClosedRange: RangeWithLowerAndUpperBound {}
extension PartialRangeFrom: RangeWithLowerBound {}
extension PartialRangeUpTo: RangeWithUpperBound {}
extension PartialRangeThrough: RangeWithUpperBound {}



#if canImport(ObjectiveC)
extension NSRange: RangeWithLowerAndUpperBound {}
#endif
