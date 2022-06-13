//
//  Local.swift
//  PetsIntroduction
//
//

import Foundation

struct Local {
    let key: Int
    let name: String
    let imageURL: URL
    let area: Area              //  필요지역 한정 호출 위해.
    let location: String        // 정확한 위치
    let number: String
    let type: LocalType
}

enum LocalType: String {
    case hospital = "H"
    case shop = "S"
}
