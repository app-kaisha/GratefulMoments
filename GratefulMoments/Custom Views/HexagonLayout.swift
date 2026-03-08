//
//  HexagonLayout.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 08/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

enum HexagonLayout {
    case standard
    case large
    
    var size: CGFloat {
        switch self {
        case .standard:
            return 200.0
        case .large:
            return 350.0
        }
    }
}
