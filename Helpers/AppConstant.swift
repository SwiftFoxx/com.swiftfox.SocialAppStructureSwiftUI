//
//  AppConstant.swift
//  SocialAppStructure
//
//  Created by Koushik Mudi on 18/07/20.
//

import UIKit

enum Authorization {}

extension Authorization {
    enum `Type` {
        case signup
        case login
    }
}

var mainScreenBounds: CGRect {
    return UIScreen.main.bounds
}
