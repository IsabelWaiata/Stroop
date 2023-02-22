//
//  AccuracyView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/18.
//

import SwiftUI

struct AccuracyViews: View {
    
    @EnvironmentObject var stroop: Stroop
    
    @State var showTotal: Bool = false
    
    var body: some View {
        VStack {
            Text("Accuracy").font(.title)
            HStack {
                ForEach(Test.Mode.list, id: \.self) { mode in
                    
                    let score = showTotal ? stroop.score(for: mode) : stroop.test.score(for: mode)
                    AccuracyView(score: score, mode: mode)
                }
                let score = showTotal ? stroop.score : stroop.test.score
                AccuracyView(score: score, mode: nil)
                
            }
            .padding()
            Divider()
        }
    }
}

struct AccuracyView: View {
    
    let score: Test.Score
    let mode: Test.Mode? // nil == total
    
    
    func color(for mode: Test.Mode?) -> Color {
        switch mode?.language {
        case .chinese: return .red
        case .english: return .blue
        default: return .primary
        }
    }
    
    var body: some View {
        
        let accuracy = CGFloat(score.accuracy)
        let color = color(for: mode)
        let title = mode?.label ?? "Total"
        VStack {
            Text( title.localizedCapitalized).font(.headline)
            Text("\(Int(accuracy * 100))%")
                .font(.title2)
            Text("\(score.good) / \(score.trys)")
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: 100, height: 150 - 150 * accuracy)
                    .foregroundColor(.clear)
                    .border(color)
                Rectangle()
                    .frame(width: 100, height: 150 * accuracy)
            }
        }
        .frame(width: 150)
        .foregroundColor(color)
    }
    
}


struct AccuracyViews_Previews: PreviewProvider {
    static var previews: some View {
        MarkView()
            .environmentObject(Sample.stroop)
    }
}

struct AccuracyView_Previews: PreviewProvider {
    static var previews: some View {
        AccuracyView(score: Sample.randomScore, mode: .random)
    }
}
