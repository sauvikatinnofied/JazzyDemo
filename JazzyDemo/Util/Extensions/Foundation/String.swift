import Foundation
import UIKit


// MARK:- STRINGS EXTENSION
let AppLangKeyISO639_1 = "CurrentAppLanguage"

public extension String {
    
    // MARK: - COMPUTED PROPETIES
    var length: Int {
        return distance(from: self.startIndex, to: self.endIndex)
    }
    var reversed: String {
        return String(self.reversed())
    }
    var urlEncoded: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    var isPalindrome: Bool {
        return self == reversed
    }
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    var firstWord: String {
        return self.components(separatedBy: " ")[0]
    }
    var lastWord: String? {
        return self.components(separatedBy: " ").last
    }
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var fileExtension: String {
        return (self as NSString).pathExtension
    }
    var fileName: String {
        return (self as NSString).deletingPathExtension
    }
    var fileLocation: String {
        return (self as NSString).deletingLastPathComponent
    }
    
    // MARK: Character search
    func charAt(index: Int) -> Character? {
        guard index < self.length  else { return nil }
        return self[self.index(startIndex, offsetBy: index)]
    }
    // MARK: Word At Index
    func wordAt(index: Int) -> String? {
        let components = self.components(separatedBy: " ")
        guard components.count > index else { return nil }
        return components[index]
    }
    // MARK: - Equality Check
    func equalTo(string: String, compareOption: CompareOptions) -> Bool {
        return self.length == string.length &&
            self.hasSubString(string: string, compareOption: compareOption)
    }
    func equalsToIgnoringCase(string: String) -> Bool {
        return equalTo(string: string, compareOption: .caseInsensitive)
    }
    func equalToWithCase(string: String) -> Bool {
        return equalTo(string: string, compareOption: .literal)
    }
    
    // MARK: - REPLACING
    mutating func replace(string: String, with replacement: String) {
        self = self.replacingOccurrences(of: string, with: replacement)
    }
    // MARK: SUBSTRING GENERATION
    func subString(start: Int, length: Int) -> String? {
        if start + length <= self.length {
            let subStringEndIndex = self.index(startIndex, offsetBy: length)
            return String(self[..<subStringEndIndex])
        } else {
            return nil
        }
    }
    func prefixWithLength(length: Int) -> String? {
        guard length <= self.length else { return nil }
        let endIndex = self.index(startIndex, offsetBy: length)
        return String(self[..<endIndex])
    }
    func sufixWithLength(length: Int) -> String? {
        guard self.index(self.endIndex, offsetBy: -length) > self.startIndex else {
            return nil
        }
        let rangeStart = self.index(self.endIndex, offsetBy: -length)
        return String(self[rangeStart...])
        
    }
    func subStringUptoString(string: String) -> String? {
        guard let index = self.range(of: string, options: .caseInsensitive) else {
            return nil
        }
        return String(self[..<index.lowerBound])
    }
    
    // MARK: - CUSTOM OPERATORS
    static func * (lsh: String, times: Int) -> String {
        return Array(repeatElement(lsh, count: times)).joined(separator: "")
    }
    
    // MARK: - LOCALIZATION
    func localizedWithComment(comment: String?) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
    func hasSubString(string: String, compareOption: CompareOptions = .caseInsensitive) -> Bool {
        return self.range(of: string, options: compareOption) != nil
    }
    func attribute( with font: UIFont , and color: UIColor) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor : color ,
                          NSAttributedString.Key.font : font]
        return NSMutableAttributedString(string: self, attributes: attributes )
    }
    
    func attribute( with font: UIFont , and color: UIColor , scriptFont: UIFont , and scriptColor: UIColor , scriptBaseLineOffset: Int , range: NSRange ) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor : color ,
                          NSAttributedString.Key.font : font]
        let attributedText = NSMutableAttributedString(string: self, attributes: attributes )
        attributedText.addAttributes([NSAttributedString.Key.foregroundColor : scriptColor ,
                                      NSAttributedString.Key.font :scriptFont,
                                      NSAttributedString.Key.baselineOffset : scriptBaseLineOffset], range: range)
        return attributedText
    }
}
extension NSAttributedString {
    func append (string: NSAttributedString, needsSpace: Bool = true) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(self)
        if needsSpace {
            result.append(NSAttributedString(string: " "))
        }
        result.append(string)
        return result
    }
}
