//
//  ContentView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stroop: Stroop
    
//    @Binding var doc: StroopDocument
//    @ObservedObject var stroop: Stroop
//
//    init(doc: Binding<StroopDocument>) {
//        _doc = doc
//        stroop = doc.stroop.wrappedValue
//    }
    
    
    var body: some View {
        VStack {
            PageView()
            Group {
                switch stroop.phase {
                case .info: InfoView()
                case .test: TestView()
                case .mark: MarkView()
                }
            }
            if stroop.phase != .mark {
                Button(action: {
                    stroop.nextPhase()
                }) {
                    Label(stroop.phase.next.label , systemImage: "play")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .gesture(
            DragGesture()
                .onEnded {
                    if $0.translation.width < -10 {
                        stroop.nextPhase()
                    } else if $0.translation.width > 10 {
                        stroop.backPhase()
                    }
                }
        )
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Sample.stroop)
    }
}
