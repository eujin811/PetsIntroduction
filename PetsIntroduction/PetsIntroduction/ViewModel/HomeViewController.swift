//
//  HomeViewController.swift
//  PetsIntroduction
//
//

import Foundation
import UIKit

import Firebase

class HomeViewController: BasicViewController {
    let dbReference = FirebaseUtil()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testData = TestUserData()
        
        print("///////////////////////////////////////////")

        // 데이터 쓰기
        // 모든 데이터 덮어쓰기.
        
//        dbReference.child(users).child(testData.userID).setValue([userName: testData.userName])
//        하위 데이터 업데이트.
//        dbReference.child("users/\(testData.userID)/\(userName)").setValue(testData.userName)
        
        let userData = testData.user
        dbReference.makeUser(user: userData)
//        dbReference.read()

    }
    
    override func setUI() {
        
    }
}
