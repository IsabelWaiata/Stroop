//
//  Buzzer.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/31.
//

import SwiftUI

class Buzzer {
    
    
    typealias Taptics = UINotificationFeedbackGenerator
    typealias Feedback = Taptics.FeedbackType
    
    static let shared = Buzzer()
    
    let taptic = Taptics()
    
    init() {
        taptic.prepare()
    }
    
    func feedback(_ feedback: Feedback = .success) {
        taptic.notificationOccurred(feedback)
    }
    
    func buzz(_ good: Bool? = true) {
        guard let good else { return }
        let feedback: Feedback = good ? .success : .error
        self.feedback(feedback)
    }
}
