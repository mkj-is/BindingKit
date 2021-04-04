public struct Transformation<Source, Destination> {
    public let forth: (Source) -> Destination
    public let back: (Destination) -> Source

    public init(forth: @escaping (Source) -> Destination, back: @escaping (Destination) -> Source) {
        self.forth = forth
        self.back = back
    }
}
