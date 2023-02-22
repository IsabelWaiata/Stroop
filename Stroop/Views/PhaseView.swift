//
//  PhaseView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/2/22.
//

import SwiftUI

struct PhaseView: View {
    
    @Binding var doc: StroopDocument
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            Group {
                switch stroop.phase {
                case .info: InfoView()
                case .test: TestView()
                case .mark: MarkView()
                        .onDisappear() {
                            doc.save += 1
                        }
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

struct PhaseView_Previews: PreviewProvider {
    
    @State static var doc = Sample.document
    static var previews: some View {
        PhaseView(doc: $doc)
            .environmentObject(doc.stroop)
    }
}
