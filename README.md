# Swift `RangeTools` #

Some small tools to make Ranges easier to work with in Swift.



## Protocols ##

So far, this is the only feature of this package: some protocols to genericize ranges.

In Swift's standard library, all the range types conform to `RangeExpression`. However, this doesn't give you much insight: All it guarantees is that the range's bounds are comparable, that it can contain a value, and that it might be resolved to a `Range` within a given collection.

This package adds more protocols:

- `RangeProtocol`: A protocol to which all ranges, even `NSRange`, conform
- `RangeWithLowerBound`: Any range which has a lower bound, such as `a...`, `a..<b`, and `a...b`
- `RangeWithUpperBound`: Any range which has an upper bound, such as `..<b`, `...b`, `a..<b`, and `a...b`
- `RangeWithLowerAndUpperBound`: Any range which has both a lower and an upper bound, such as `a..<b` and `a...b`
