//
//  setClearNavigationBar.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/01.
//

import Foundation
import UIKit

extension UINavigationBar {
    func clearNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}
