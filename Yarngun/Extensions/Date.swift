import Foundation

extension Date {
	public var contextualised: String {
		let d = 0 - Int(timeIntervalSinceNow / 86400)
		
		switch d {
		case 0:
			return "Today"
		case 1:
			return "Yesterday"
		case 2...6:
			let f = DateFormatter()
			f.dateFormat = "EEEE"
			return f.string(from: self)
		default:
			let f = DateFormatter()
			f.dateFormat = "d MMM yyyy"
			return f.string(from: self)
		}
	}
	
	public var thirteenMonthsBefore: Date? { return NSCalendar.current.date(byAdding: .month, value: -13, to: self) }

	public var toYearMonth: String {
		let f = DateFormatter()
		f.dateFormat = "yyyy-MM"
		return f.string(from: self)
	}
}
