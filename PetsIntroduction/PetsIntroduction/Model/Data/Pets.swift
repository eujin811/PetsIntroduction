//
//  Pets.swift
//  PetsIntroduction
//
//

import Foundation

struct Pet {
    let key: Int
    let onwerKey: Int // 주인 key
    
    let name: String
    let imageURL: URL
    let isNeutralization: Bool
    let age: Int
    let gender: Gender
    let size: PetSize
    let area: Area
    let characteristic: String  // 50자 이하.
    
    let animalType: AnimalType
    let species: String  // 치와와, 시바, 진도
    
    let matchDatePet: [Int]
    let matchFriendPet: [Int]
    let rejectDatePet: [Int]
    let rejectFriendPet: [Int]
}
