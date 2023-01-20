//
//  TestView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        
        let mode = stroop.phase.mode ?? .first
        let text = stroop.test.current.word.text(for: mode)
        let tint = mode.variable ? stroop.test.current.tint.color : .primary
        
        VStack {
            
            ScoreView()
            
            Spacer()
            
            Text(text)
                .font(.system(size: 120))
                .foregroundColor(tint)
            Spacer()
            
            ButtonsView()
            
            Spacer()
            
            Button(action: {
                stroop.nextPhase()
            }) {
                Label(mode.next?.label ?? "Results", systemImage: "play")
            }
            .buttonStyle(.borderedProminent)
        }
        
    }
    
}

struct TestView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView()
            .environmentObject(Sample.stroop)
    }
}
