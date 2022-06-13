//
//  ImageExtension.swift
//  PetsIntroduction
//
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(asset: ConstantAssetName) {
        self.init(systemName: asset.rawValue)
    }
    
}
