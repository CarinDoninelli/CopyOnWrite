import Foundation

private final class Reference<T> {
    var value: T

    init(_ value: T) {
        self.value = value
    }
}

public struct Boxed<T> {
    fileprivate var reference: Reference<T>

    public init(_ value: T) {
        reference = Reference(value)
    }

    public var value: T {
        get {
            return reference.value
        }
        set {
            if isKnownUniquelyReferenced(&reference) {
                reference.value = newValue
            }
            else {
                reference = Reference(newValue)
            }
        }
    }
}