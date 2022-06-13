//
//  ConstantFirebase.swift
//  PetsIntroduction
//
//

import Foundation

enum ConstantFirebase {
    static let users = "users"
    static let userId = "userID"
    static let userName = "userName"
    static let imageURL = "imageURL"
    static let userPhoneNum = "phoneNum"
    static let petList = "petList"
    static let localBookList = "localBookList"
    
    static let matchCount = "matchCount"
    static let matchCharge = "matchCharge"
    static let matchCost = "matchCost"
    
    static let chattingList = "chattingList"
    
    static let area = "area"

    
    // 추후 반영 예정
    static let complain = "complain"
    
// MARK: 하위
    
    // 지역
    
    /// 도
    static let province = "province"
    /// 시
    static let city = "city"
    /// 군/구
    static let gu = "gu"
    /// 읍/면/동
    static let dong = "dong"
    
    // match
    
    static let time = "time"
    static let count = "count"
    static let amount = "amount"
    static let explanation = "explanation"
    
    static let expire = "expire"
}
