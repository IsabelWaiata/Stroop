//
//  Subject.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

class Subject: Codable {
    
    var gender: Gender = .other
    var age: Int = 11
    
    enum Gender: String, Codable, CaseIterable {
        case male
        case female
        case other
    }
    
}
