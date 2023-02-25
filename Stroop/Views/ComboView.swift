//
//  ComboView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/2/22.
//

import SwiftUI

struct ComboViews: View {
    
    @EnvironmentObject var stroop: Stroop
    
    @State var showEveryone: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Test.Mode.list, id: \.self) { mode in
                    let score = showEveryone ? stroop.score(for: mode) : stroop.test.score(for: mode)
                    ComboView(score: score, mode: mode)
                }
                let score = showEveryone ? stroop.score : stroop.test.score
                ComboView(score: score, mode: nil)
            }
            Text("cpm = Correct Attempts per Minute")
            let test = showEveryone ? stroop.combinedTest : stroop.test
            EffectView(test: test)
            Divider()
        }
        .padding()
    }
}


struct ComboView: View {
    
    let score: Test.Score
    let mode: Test.Mode? // nil = Total
    
    func color(for mode: Test.Mode?) -> Color {
        guard let mode else { return .secondary }
        switch mode.language {
        case .chinese: return mode.variable ? .red : .orange
        case .english: return mode.variable ? .blue : .teal
        }
    }
    
    var body: some View {
        
        let accuracy = CGFloat(score.accuracy)
        let attempt = CGFloat(score.attemptsPerMinute)
        let correct = CGFloat(score.correctPerMinute)
        let color = color(for: mode)
        let title = mode?.label ?? "Mean"
        
        VStack {
            Text( title.localizedCapitalized).font(.headline)
            Group {
                Text("\(score.good) / \(score.trys)")
                Text("\(Int(accuracy * 100))%")
                Text(String(format: "%0.1f cpm", correct))
            }
            .font(.title2)
            
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: 100, height: 2 * (attempt - correct))
                    .foregroundColor(.clear)
                    .border(color)
                Rectangle()
                    .frame(width: 100, height: 2 * correct)
            }
            .frame(width: 150, height: 150, alignment: .bottom)
        }
        .foregroundColor(color)
    }
}


struct ComboViews_Previews: PreviewProvider {
    static var previews: some View {
        ComboViews()
            .environmentObject(Sample.stroop)
    }
}

struct ComboView_Previews: PreviewProvider {
    static var previews: some View {
        ComboView(score: Sample.randomScore, mode: .random)
    }
}
