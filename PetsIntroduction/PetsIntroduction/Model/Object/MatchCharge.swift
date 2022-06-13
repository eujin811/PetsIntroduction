//
//  MatchCharge.swift
//  PetsIntroduction
//
//

import Foundation

/// 충전 내역.
struct MatchCharge {
    let time: String
    let count: Int
    let amount:Int
    let explanation: String

    let isFreeCharge: Bool
    let expire: String?
}
