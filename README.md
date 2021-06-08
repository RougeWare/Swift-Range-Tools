[![Tested on GitHub Actions](https://github.com/RougeWare/Swift-Range-Tools/actions/workflows/swift.yml/badge.svg)](https://github.com/RougeWare/Swift-Range-Tools/actions/workflows/swift.yml) [![](https://www.codefactor.io/repository/github/rougeware/swift-range-tools/badge)](https://www.codefactor.io/repository/github/rougeware/swift-range-tools)

[![Swift 5](https://img.shields.io/badge/swift-5-brightgreen.svg?logo=swift&logoColor=white)](https://swift.org) [![swift package manager 5.3 is supported](https://img.shields.io/badge/swift%20package%20manager-5.3-brightgreen.svg)](https://swift.org/package-manager) [![Supports macOS, iOS, tvOS, watchOS, Linux, & Windows](https://img.shields.io/badge/macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux%20%7C%20Windows-grey.svg)](./Package.swift) 
[![](https://img.shields.io/github/release-date/rougeware/swift-range-tools?label=latest%20release)](https://github.com/RougeWare/Swift-range-tools/releases/latest)


# Swift `RangeTools` #

Some small tools to make Ranges easier to work with in Swift.



## Protocols ##

So far, this is the only feature of this package: some protocols to genericize ranges.

In Swift's standard library, all the range types conform to `RangeExpression`. However, this doesn't give you much insight: All it guarantees is that the range's bounds are comparable, that it can contain a value, and that it might be resolved to a `Range` within a given collection.

This package adds more protocols. These, for accessing members of a range generically:

- `RangeProtocol`: A protocol to which all ranges, even `NSRange`, conform
- `RangeWithLowerBound`: Any range which has a lower bound, such as `a...`, `a..<b`, and `a...b`
- `RangeWithUpperBound`: Any range which has an upper bound, such as `..<b`, `...b`, `a..<b`, and `a...b`. Also includes info on whether that upper bound is inclusive.
- `RangeWithLowerAndUpperBound`: Any range which has both a lower and an upper bound, such as `a..<b` and `a...b`

And these for creating ranges generically:

- `RangeWhichCanBeInitializedWithOnlyLowerBound`: Any range which can be initialized only with a lower bound, like `a...`
- `RangeWhichCanBeInitializedWithOnlyUpperBound`: Any range which can be initialized only with an upper bound, like `..<b` or `...b`
- `RangeWhichCanBeInitializedWithBothLowerAndUpperBounds`: Any range which can be initialized with both lower and upper bounds, like `a..<b` or `a...b`
