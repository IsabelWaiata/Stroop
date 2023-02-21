//
//  PhaseView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/2/22.
//

import SwiftUI

struct PhaseView: View {

    @ObservedObject var stroop: Stroop

    var body: some View {
        VStack {
            Group {
                switch stroop.phase {
                case .info: InfoView(stroop: stroop)
                case .test: TestView(stroop: stroop)
                case .mark: MarkView(stroop: stroop)
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
    static var previews: some View {
        PhaseView(stroop: Sample.stroop)
    }
}
