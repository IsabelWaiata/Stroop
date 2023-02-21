//
//  PhaseView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/2/22.
//

import SwiftUI

struct PhaseView: View {

    @Binding var doc: StroopDocument

    var body: some View {
        VStack {
            Group {
                switch doc.stroop.phase {
                case .info: InfoView(doc: $doc)
                case .test: TestView(doc: $doc)
                case .mark: MarkView(doc: $doc)
                }
            }
            if doc.stroop.phase != .mark {
                Button(action: {
                    doc.stroop.nextPhase()
                }) {
                    Label(doc.stroop.phase.next.label , systemImage: "play")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .gesture(
            DragGesture()
                .onEnded {
                    if $0.translation.width < -10 {
                        doc.stroop.nextPhase()
                    } else if $0.translation.width > 10 {
                        doc.stroop.backPhase()
                    }
                }
        )
    }

}



struct PhaseView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseView(doc: .constant(Sample.document))
    }
}
