//
//  Mode.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/20.
//

import Foundation

extension Test {
    
    struct Mode: Codable, Equatable, Hashable {
        var language = Language.first
        var variable = false
        
        var label: String {
            language.label + " " + (variable ? "Variable" : "Control")
        }
        
        var index: Int? {
            Mode.list.firstIndex(of: self)
        }
        
        /// reverse order of proceeding
        var back: Mode? {
            guard let index,
                  Mode.list.indices.contains(index - 1)
            else { return nil }
            return Mode.list[index - 1]
        }
        
        /// order of proceeding
        var next: Mode? {
            guard let index,
                  Mode.list.indices.contains(index + 1)
            else { return nil }
            return Mode.list[index + 1]
        }
        
        static var random: Mode {
            Mode(language: Language.random, variable: Bool.random())
        }
        
        static let list: [Mode] = [
            Mode(language: .chinese, variable: false),
            Mode(language: .chinese, variable: true),
            Mode(language: .english, variable: false),
            Mode(language: .english, variable: true)
        ]
        
    }
    
    enum Language: String, Codable, Equatable, CaseIterable {
        case chinese
        case english
        
        var label: String {
            switch self {
            case .chinese : return "中文"
            case .english : return "English"
            }
        }
        
        static var first: Language {
            Language.allCases.first!
        }
        
        static var last: Language {
            Language.allCases.last!
        }
        
        static var random: Language {
            Language.allCases.randomElement()!
        }
    }
    
}
