
import Foundation

extension Decimal {
	public var intValue: Int? {
		if let s = "\(self)".components(separatedBy: ".").first { return Int(s) }
		else { return nil }
	}
}
