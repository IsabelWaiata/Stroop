//
//  ContentView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            PageView()
            Group {
                Spacer()
                switch stroop.phase {
                case .info: InfoView()
                case .test: TestView()
                case .mark: MarkView()
                }
            }
            .transition(.slide)
        }
        .navigationTitle("")
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
