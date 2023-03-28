import Foundation

struct NumberFormatting {
  static func temperature(_ tempInF: Double) -> String? {
     let tempInC = (tempInF-32)*5/9
    let formatter = NumberFormatter()
    formatter.numberStyle = .none
    let temp = NSNumber(value: tempInC)
    return formatter.string(from: temp)
  }
}
