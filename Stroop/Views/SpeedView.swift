//
//  SpeedView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/18.
//

import SwiftUI

struct SpeedViews: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        HStack {
            ForEach(Test.Mode.allCases, id: \.self) { mode in
                let score = stroop.test.score(for: mode)
                SpeedView(score: score, mode: mode)
            }
            
            SpeedView(score: stroop.test.score, mode: nil)
        }
        .padding()
    }
}

struct SpeedView: View {
    
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
        
        let speed = CGFloat(score.gpm)
//        let speed = CGFloat.random(in: 1.0 ... 69.0)
        let color = color(for: mode)
        let title = mode?.rawValue ?? "Total"
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
        SpeedViews()
            .environmentObject(Sample.stroop)
    }
}


struct SpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedView(score: Sample.randomScore, mode: .english)
    }
}
