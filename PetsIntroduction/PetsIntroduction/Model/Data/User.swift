//
//  User.swift
//  PetsIntroduction
//
//

import Foundation

struct User {
    let key: Int
    let id: String
    let imageURL: URL?
    let name: String
    let number: String
    let petList: [Int]          // [pet ID]
    let area: Area              // 사는 지역
    let chattingList: [Int]     // [chatting ID]
    let localBookList: [Int]     // [areaID]
    
    let matchCount: Int
    let matchCharge: [Match]    // 충전내역
    let matchCost: [Match]      // 사용내역
    
    let complain: [Int]         // [ComplainID]     * 현재 사용 안함. 추후 1:1문의등 추가 개발 시 사용 예정
}
