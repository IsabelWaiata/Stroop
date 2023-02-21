//
//  SpeedView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/18.
//

import SwiftUI

struct SpeedViews: View {
    
    @ObservedObject var stroop: Stroop
    
    @State var showTotal: Bool = false
    
    var body: some View {
        VStack {
            Text("Correct per Minute").font(.title)
            HStack {
                ForEach(Test.Mode.list, id: \.self) { mode in
                    let score = showTotal ? stroop.score(for: mode) : stroop.test.score(for: mode)
                    SpeedView(score: score, mode: mode)
                }
                let score = showTotal ? stroop.score : stroop.test.score
                SpeedView(score: score, mode: nil)
            }
            .padding()
            Divider()
        }
    }
}

struct SpeedView: View {
    
    let score: Test.Score
    let mode: Test.Mode? // nil = Total
    
    
    
    func color(for mode: Test.Mode?) -> Color {
        switch mode?.language {
        case .chinese: return .red
        case .english: return .blue
        default: return .primary
        }
    }
    
    var body: some View {
        
        let speed = CGFloat(score.gpm)
        let color = color(for: mode)
        let title = mode?.label ?? "Total"
        VStack {
            Text( title.localizedCapitalized).font(.headline)
                .font(.headline)
            VStack(spacing: 0) {
                Text(String(format: "%0.1f", speed))
                    .font(.title2)
                Rectangle()
                    .frame(width: 120, height: 150 - 2 * speed)
                    .foregroundColor(.clear)
                Rectangle()
                    .frame(width: 120, height: 2 * speed)
                
            }
        }
        .foregroundColor(color)
    }
    
}

struct SpeedViews_Previews: PreviewProvider {
    static var previews: some View {
        SpeedViews(stroop: Sample.stroop)
    }
}


struct SpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedView(score: Sample.randomScore, mode: .random)
    }
}
