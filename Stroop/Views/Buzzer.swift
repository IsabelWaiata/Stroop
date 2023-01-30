//
//  Buzzer.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/31.
//

import SwiftUI

class Buzzer {
    
    static let shared = Buzzer()
    
    let haptic = UINotificationFeedbackGenerator()
    
    init() {
        haptic.prepare()
    }
    
    func feedback(_ feedback: UINotificationFeedbackGenerator.FeedbackType = .success) {
        haptic.notificationOccurred(feedback)
    }
    
    func buzz(_ good: Bool? = true) {
        guard let good else { return }
        let feedback: UINotificationFeedbackGenerator.FeedbackType = good ? .success : .error
        self.feedback(feedback)
    }
}
