//
//  Try.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/20.
//

import Foundation

extension Test {
    
    struct Try: Codable {
        var mode: Mode = Mode()
        var word: Colour = Colour.random   // written text of colour
        var tint: Colour = Colour.random   // random colour of text
        var pick: Colour?  {               // colour guessed by subject
            didSet { time.stop() }
        }
        var time = Stopwatch()
        
        var correct: Bool {
            pick == word
        }
    }
    
}
