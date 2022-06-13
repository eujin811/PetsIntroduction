//
//  Match.swift
//  PetsIntroduction
//

import Foundation

struct Match {
    let time: String    // TimeStamp
    let count: Int
    let amount: Int     // 무료충전, 매칭 사용시 0원으로 표기. default 0
    let explanation: String
    
    let expire: String  // TimeStamp, 유통기한, (무료증정, 이벤트 증정 관련!)
    
//    let isCost: Bool
    // 아님 그냥 두개로??
    
    init(time: String, count: Int, amount: Int, explanation: String, expire: String) {
        self.time = time
        self.count = count
        self.amount = amount
        self.explanation = explanation
        self.expire = expire
    }
    
    init(machCost: MatchCost) {
        self.time = machCost.time
        self.count = machCost.count
        self.amount = Int.empty
        self.explanation = machCost.explanation
        self.expire = String.empty
    }
    
    init(matchCharge: MatchCharge) {
        self.time = matchCharge.time
        self.count = matchCharge.count
        self.amount = matchCharge.amount
        self.explanation = matchCharge.explanation
        self.expire = matchCharge.expire ?? String.empty
    }
}
