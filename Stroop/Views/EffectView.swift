//
//  EffectView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/2/25.
//

import SwiftUI

struct EffectView: View {
    
    @State var test: Test
    
    var body: some View {
        VStack(spacing: 0) {
            Text("The Stroop Effect")
                .font(.title)
                .foregroundColor(.accentColor)
            if let controlMean = test.controlScore().mean,
               let variableMean = test.variableScore().mean
            {
                let effect = String(format: "%0.2f",
                                    variableMean - controlMean 
                       )
                Text("Time for each correct variable attempt is")
                HStack(alignment: .firstTextBaseline) {
                    Text(effect).font(.system(size: 80, weight: .heavy))
                    Text("seconds").font(.system(size: 60, weight: .heavy))
                }
                .foregroundColor(.accentColor)
                Text("slower than the control.")
                    .padding()
            } else {
                Text("Not enough data.")
            }
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView(test: Sample.randomTest)
    }
}
