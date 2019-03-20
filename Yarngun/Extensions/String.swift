extension String {
	public subscript(i: Int) -> Character? {
		if i >= count || i < -count { return nil }
		return self[index(i)]
	}
	
	public subscript(r: Range<Int>) -> String {
		return String(self[index(r.lowerBound)..<index(r.upperBound)])
	}

	public func index(_ i: Int) -> String.Index {
		if i >= 0 { return index(startIndex, offsetBy: i) }
		else { return index(endIndex, offsetBy: i)}
	}
	
	public func substring(from: Int, to: Int) -> String {
		let f = index(startIndex, offsetBy: from)
		let t = index(startIndex, offsetBy: to + 1)
		return String(self[f..<t])
	}

	public func replace(_ target: String, with: String) -> String {
		return replacingOccurrences(of: target, with: with, options: .literal, range: nil)
	}

	public func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
		let f = DateFormatter()
		f.dateFormat = format
		guard let d = f.date(from: self) else { preconditionFailure("\(self) is not in \(format) format") }
		return d
	}

	public var possibleDates: [Date] {
		let df = DateFormatter()
		df.timeZone = TimeZone(abbreviation: "UTC")
		return ["yyyy-MM-dd", "MM/dd/YYYY", "MMM dd yyyy", "dd-MM-YYYY", "dd/MM/YYYY", "dd MMM yyyy"].map { f in
			df.dateFormat = f
			guard let d = df.date(from: self) else { return nil }
			return d
			}.compactMap{ $0 }
	}

	public var words: Set<String> {
		return Set(split(separator: " ").map { String($0) })
	}
	
	public var toAlphaNumerics: String {
		let unsafeChars = CharacterSet.alphanumerics.inverted
		return components(separatedBy: unsafeChars).joined(separator: " ")
	}
	
	public var withoutNewLines: String {
		return split(separator: "\n").joined(separator: " ")
	}

	public var digitsCorrected: String {
		return self
			.replace("0", with: "O")
			.replace("1", with: "I")
			.replace("2", with: "Z")
			.replace("8", with: "B")
	}
	
	public var lettersCorrected: String {
		return self
			.replace("O", with: "0")
			.replace("Q", with: "0")
			.replace("U", with: "0")
			.replace("D", with: "0")
			.replace("I", with: "1")
			.replace("Z", with: "2")
			.replace("B", with: "8")
	}
}
