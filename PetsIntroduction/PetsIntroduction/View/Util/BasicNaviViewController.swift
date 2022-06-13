//
//  BasicNaviViewController.swift
//  PetsIntroduction
//
//

import UIKit

class BasicNaviViewController: BasicViewController {
//    private let titleFontSize: CGFloat
//    private let naviIconSize: CGFloat
        
    private let backItemImage = UIImage(asset: .chevronLeft)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: set
    override func setUI() {}
    
    func setType(type: SetType) {
        let (naviIconColor, naviTextColor, naviBackgroudColor) = type.value()
        
        switch type {
        case .clear:
            clearAddtion()
        default:
            opaqueAddtion()
        }
        
        // TODO
        
        // iconColor
        
        // textColor
        
        // backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: func
    
    private func clearAddtion() {
        // TODO
    }
    
    private func opaqueAddtion() {
        // TODO
    }
    
    // MARK: SetType
    
    enum SetType {
        case basic
        /// 네비바 배경 clear 필요시
        case clear
        case dating
        case friend
        
        func value() -> (
            iconColor: UIColor,
            textColor:UIColor,
            backGroundColor: UIColor
            ) {
                
                switch self {
                case .basic:
                    return (
                        UIColor.darkGray,
                        UIColor.darkGray,
                        UIColor(assetsColor: .backgroundWhite)
                    )
                case .clear:
                    return (
                        UIColor.white,
                        UIColor.white,
                        UIColor.clear
                    )
                case .dating:
                    return (
                        UIColor.white,
                        UIColor.white,
                        UIColor(assetsColor: .datePink)
                    )
                case .friend:
                    return (
                        UIColor.white,
                        UIColor.white,
                        UIColor(assetsColor: .friendBlue)
                    )
                }
        }
        
    }
}

