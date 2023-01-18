//
//  Subject.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

struct Subject: Codable {
    
    var gender: Gender?
    var age: Int = 11
    
    enum Gender: String, Codable, CaseIterable {
        case male
        case female
        case other
    }
    
}
