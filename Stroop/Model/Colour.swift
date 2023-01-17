//
//  Colour.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation
import SwiftUI

enum Colour: Codable, CaseIterable {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case pink
    case brown
    
    
    var control: String {
        return english
    }
    
    var english: String {
        switch self {
        case .red:      return "Red"
        case .orange:   return "Orange"
        case .yellow:   return "Yellow"
        case .green:    return "Green"
        case .blue:     return "Blue"
        case .purple:   return "Purple"
        case .pink:     return "Pink"
        case .brown:    return "Brown"
        }
    }
    
    var chinese: String {
        switch self {
        case .red:      return "红色"
        case .orange:   return "橙色"
        case .yellow:   return "黄色"
        case .green:    return "绿色"
        case .blue:     return "蓝色"
        case .purple:   return "紫色"
        case .pink:     return "粉红色"
        case .brown:    return "棕色"
        }
    }
    
    var color: Color {
        switch self {
        case .red:      return .red
        case .orange:   return .orange
        case .yellow:   return .yellow
        case .green:    return .green
        case .blue:     return .blue
        case .purple:   return .purple
        case .pink:     return .pink
        case .brown:    return .brown
        }
    }
    
    static var random: Colour {
        allCases.randomElement()!
    }
    
    
    
}
