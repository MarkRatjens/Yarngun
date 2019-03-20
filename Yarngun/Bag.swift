public struct Bag<Key> where Key: Hashable {
	public typealias B = Bag<Key>
	public typealias C = [Key: Int]
	
	public init(_ array: [Key]) {
		contents = array.reduce(contents) { (c, k) in
			var c = c
			if let v = c[k] { c[k] = v + 1 }
			else { c[k] = 1 }
			return c
		}
	}
	
	public var recurring: B { return B(contents.filter { $0.value > 1 }) }

	public var byRecurrenceOrder: [(key: Key, value: Int)] { return contents.sorted(by: { $0.value > $1.value }) }

	public var mostRecurring: Key? { return byRecurrenceOrder.first?.key }

	public var contents: C = [:]

	private init(_ contents: C) { self.contents = contents }
}

extension Array where Element: Hashable {
	public var bag: Bag<Element> { return Bag(self) }
}
