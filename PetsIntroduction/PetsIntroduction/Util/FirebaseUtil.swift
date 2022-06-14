//
//  FirebaseUtil.swift
//  PetsIntroduction
//

import Foundation

import Firebase

class FirebaseUtil {
    private let constant = Constant.firebase
    private let userKey = TestUserData().user.key
    private let userPathStr = "\(Constant.firebase.users)/\(TestUserData().user.key)"
    
    private let isNotification = true
    // db
    private var reference = Database.database().reference()

    // MARK: - Read
    /// 해당 함수 읽으면 device에 저장.
    func read() {
        var path = userPathStr
        
        reference
            .child("\(constant.users)/\(userKey)")
            .getData(completion: { [weak self] error, snapshot in
                print("///////////////////////////////////////////")
                print("-->", error, snapshot)
                guard let self = self
                else {
                    print("[fail] firebase DB, unknown self", error!.localizedDescription)
                    return
                }
                guard error == nil
                else {
                    print("[fail] firebase DB", error!.localizedDescription)
                    return
                }

                // TODO: 해당부분 부터 디바이스 저장하는 함수 따로 만들거나 util 만들어서 빼기!
                guard let value = snapshot?.value as? NSDictionary
                else {
                    print("[fail] firebase DB, unknown value")
                    return
                }
                
                print("성공!!", snapshot)

                let userName = value[self.constant.userName] as? String ?? String.empty
                let phoneNum = value[self.constant.userPhoneNum] as? String ?? String.empty
                let petList = value[self.constant.petList] as? [Int] ?? []
                let chattingList = value[self.constant.chattingList] as? [Int] ?? []
                let localBookList = value[self.constant.localBookList] as? [Int] ?? []
                let matchCount = value[self.constant.matchCount] as? Int ?? Int.empty
                let complain = value[self.constant.complain] as? [Int] ?? []
                
                let area = value[self.constant.area] as? NSDictionary
                let province = area?[self.constant.province] as? String ?? String.empty
                let city = area?[self.constant.city] as? String ?? String.empty
                let gu = area?[self.constant.gu] as? String ?? String.empty
                let dong = area?[self.constant.dong] as? String ?? String.empty
                
                // TODO: match
//                let matchCharges = value[self.constant.matchCharge] as? [String: Match] ?? [:]
//                let matchChargeList = Array(matchCharges)
                
//                let matchCost

                
                print(userName, phoneNum, petList, chattingList, localBookList, matchCount, complain, province, city, gu, dong)
                // TODO: 해당 위치에서 device에 저장.
        })
    }
    
    // MARK: - Write
    
    
    
    func makeUser(user: User) {
        let userPath = reference
            .child(constant.users)
            .child("\(userKey)")
        
        // uuid?, id, 사진, 이름, 번호, [강아지 id], 지역,
        // 알림 동의 여부, 매칭 잔여횟수,
        // [대화 정보 id], [문의사항 id], [즐겨찾는 장소 id]
        
        // [친구 매칭 강아지 id], [반려 매칭 강아지 id]
        // [친구 매칭 거절 강아지 id], [반려 매칭 거절 강아지 id]
        //
        
        
        userPath
            .setValue([
                constant.userId: user.id,
                constant.userName: user.name,
                constant.userPhoneNum: user.number,
                constant.petList: user.petList,
                constant.chattingList: user.chattingList,
                constant.localBookList: user.localBookList,
                constant.matchCount: user.matchCount,
                
                // TODO: anyObject라 area 처럼 변경해야 하는뎅..
//                constant.matchCharge: user.matchCharge,
//                constant.matchCost: user.matchCost,
                
                constant.complain: user.complain
            ])
        
//        userPath.child(constant.matchCharge)
//        userPath.child(constant.matchCost)
        
        // 지역
        userPath.child(constant.area)
            .setValue([
                constant.province: user.area.province,
                constant.city: user.area.city,
                constant.gu: user.area.town,
                constant.dong: user.area.dong
            ])
        
    }
    
    // MARK: - Update
    
    func updateUser(type: PathType, value: Any) {
        let pathStr = userPathStr + "/" + type.path
        
        let path = reference.child(pathStr)
        
        switch type {
        case .image:
            let inputData = value as? URL
            path.setValue(inputData)
        case .name, .number:
            let inputData = value as? String
            path.setValue(inputData)
        case .matchCount:
            let inputData = value as? Int
            path.setValue(inputData)
        case .petList, .chattingList, .localBookList, .complain:
            let inputData = value as? [Int]
            path.setValue(inputData)
        default:    // match, area 다름 함수!
            print("[error]: mismatch")
            return
        }
    }
    
    // TODO: charge
    func updateUseMatch(type: MatchType, vlaue: Match) {
        var pathStr = userPathStr
        
        switch type{
        case .charge:
            pathStr += constant.matchCharge
        case .cost:
            pathStr += constant.matchCost
        }
        
        // MARK: TODO
        // 기존 데이터 추후 device 내부 저장 db 사용해서.
        // type AnyObject
        
//        let path = FirebaseUtil.shared.reference
//            .child(pathStr)
//            .setValue(value)
        
    }
    
    func updateArea(area: Area) {
        let areaPathStr = userPathStr + "/" + constant.area
        
        let areaPath = reference.child(areaPathStr)
        
        areaPath.setValue([
            constant.province: area.province,
            constant.city: area.city,
            constant.gu: area.town,
            constant.dong: area.dong
        ])
    }
    
    // MARK: - Delete
    
    // MARK: - Data
    
    enum MatchType {
        case charge
        case cost
    }
    
    enum PathType {
        case image
        case name
        case number
        case petList
//        case area
        case chattingList
        case localBookList
        case matchCount
//        case matchCharge
//        case matchCost
        case complain
        
        var path: String {
            let constant = Constant.firebase
            switch self {
            case .image:
                return constant.imageURL
            case .name:
                return constant.userName
            case .number:
                return constant.userPhoneNum
            case .petList:
                return constant.petList
            case .chattingList:
                return constant.chattingList
            case .localBookList:
                return constant.localBookList
            case .matchCount:
                return constant.matchCount
            case .complain:
                return constant.complain
            }
        }
    }
}
