//
//  MarkView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct MarkView: View {
    
    @EnvironmentObject var stroop: Stroop
    @State var test = Test()
    
    var body: some View {
        VStack {
            Text("Results").font(.title)
            Divider()
            HStack {
                ForEach(Test.Mode.allCases, id: \.self) { mode in
                    let score = stroop.test.score(for: mode)
                    ScoreLoop(score: score, mode: mode)
                }
                
                ScoreLoop(score: test.score, mode: nil)
            }
        }
        
        Button(action: {
            stroop.saveTest()
            stroop.nextTest()
            stroop.phase = .info
        }) {
            Label("Start Over", systemImage: "restart")
        }
        .buttonStyle(.borderedProminent)
    }
}


struct ScoreLoop: View {
    
    let score: Test.Score
    let mode: Test.Mode?
    
    
    func color(for mode: Test.Mode?) -> Color {
        switch mode {
        case .control: return .gray
        case .chinese: return .red
        case .english: return .blue
        default: return .primary
        }
    }
    
    var body: some View {
        
        let fraction = CGFloat(score.fraction)
        let color = color(for: mode)
        let title = mode?.rawValue ?? "Total"
        VStack {
            Text( title.localizedCapitalized).font(.headline)
            ZStack {
                Circle()
                    .trim(from: 0, to: fraction)
                    .stroke(lineWidth: 24)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 120)
                VStack {
                    Text("\(Int(fraction * 100))%")
                        .font(.title2)
                    Text("\(score.good) / \(score.trys)")
                }
            }
        }
        .foregroundColor(color)
    }
}

struct MarkView_Previews: PreviewProvider {
    static var previews: some View {
        MarkView()
            .environmentObject(Stroop())
    }
}
