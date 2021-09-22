/// A two-way transformation from source to destination and back.
public struct Transformation<Source, Destination> {
    /// Forward transformation from source to destination.
    public let forth: (Source) -> Destination
    /// Backward transformation from destination to source.
    public let back: (Destination) -> Source

    /// Initializes a transformation from provided back and forth closures.
    /// - Parameters:
    ///   - forth: Forward transformation closure from source to destination.
    ///   - back: Backward transformation closure from destination to source.
    public init(forth: @escaping (Source) -> Destination, back: @escaping (Destination) -> Source) {
        self.forth = forth
        self.back = back
    }
}
