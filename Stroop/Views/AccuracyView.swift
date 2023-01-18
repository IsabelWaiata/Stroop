//
//  AccuracyView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/18.
//

import SwiftUI

struct AccuracyViews: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        HStack {
            ForEach(Test.Mode.allCases, id: \.self) { mode in
                let score = stroop.test.score(for: mode)
                AccuracyView(score: score, mode: mode)
            }
            
            AccuracyView(score: stroop.test.score, mode: nil)
        }
        .padding()
    }
}

struct AccuracyView: View {
    
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
        
        let accuracy = CGFloat(score.accuracy)
        let color = color(for: mode)
        let title = mode?.rawValue ?? "Total"
        VStack {
            Text( title.localizedCapitalized).font(.headline)
            ZStack {
                Circle()
                    .trim(from: 0, to: accuracy)
                    .stroke(lineWidth: 24)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 100)
                VStack {
                    Text("\(Int(accuracy * 100))%")
                        .font(.title2)
                    Text("\(score.good) / \(score.trys)")
                }
            }
            .padding()
        }
        .foregroundColor(color)
    }
    
}


struct AccuracyViews_Previews: PreviewProvider {
    static var previews: some View {
        AccuracyViews()
            .environmentObject(Sample.stroop)
    }
}

struct AccuracyView_Previews: PreviewProvider {
    static var previews: some View {
        AccuracyView(score: Sample.randomScore, mode: .chinese)
    }
}
