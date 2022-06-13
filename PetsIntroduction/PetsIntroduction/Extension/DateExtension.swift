//
//  DateExtension.swift
//  PetsIntroduction
//
//

import Foundation

extension Date {
    
//    static func toString() -> String {
//        return String(Self)
//    }
    static func timeStamp() -> String {
        let date = Date.timeIntervalBetween1970AndReferenceDate
        return String(date)
    }
}
