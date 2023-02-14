//
//  PlayView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/30.
//

import SwiftUI

struct PlayView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        
        let mode = stroop.phase.mode ?? .list.first!
        let text = stroop.test.current.word.text(for: mode)
        let tint = mode.variable ? stroop.test.current.tint.color : stroop.test.current.word.color
    
        Spacer()
        
        Text(text)
            .font(.system(size: 180))
            .fontWeight(.heavy)
            .minimumScaleFactor(0.2)
            .lineLimit(1)
            .foregroundColor(tint)
        
        Spacer()
        
        ButtonsView()
           
        Spacer()
        
        
    }
    
}

struct PlayView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView()
            .environmentObject(Sample.stroop)
    }
}
