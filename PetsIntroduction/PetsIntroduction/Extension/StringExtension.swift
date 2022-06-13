//
//  StringExtension.swift
//  PetsIntroduction
//
//

import Foundation

extension String {
    static let empty = String()
    
    /// timeStamp
    func toDate() -> Date? {
        guard let stamp = TimeInterval(Self()) else { return nil }
        let date = Date(timeIntervalSince1970: stamp)
        return date
    }
}
