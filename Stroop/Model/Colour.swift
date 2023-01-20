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
    case grey
    
    func text(for mode: Test.Mode) -> String {
        switch mode.language {
        case .chinese: return chinese
        case .english: return english
        }
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
        case .grey:    return "Grey"
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
        case .grey:    return "灰色"
        }
    }
    
    var color: Color {
        switch self {
        case .red:      return Color("Red")
        case .orange:   return Color("Orange")
        case .yellow:   return Color("Yellow")
        case .green:    return Color("Green")
        case .blue:     return Color("Blue")
        case .purple:   return Color("Purple")
        case .pink:     return Color("Pink")
        case .grey:    return Color("Grey")
        }
    }
    
    static var random: Colour {
        allCases.randomElement()!
    }
    
    
    
}
