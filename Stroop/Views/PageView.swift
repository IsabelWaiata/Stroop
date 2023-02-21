//
//  PageView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct PageView: View {

    @Binding var doc: StroopDocument

    var body: some View {
        Picker("", selection: $doc.stroop.phase) {
            
            Label("Info", systemImage: "info.circle")
                .tag(Stroop.Phase.info)
            ForEach(Test.Mode.list, id: \.self) { mode in
                Label(mode.label, systemImage: "squares.below.rectangle")
                    .tag(Stroop.Phase.test(mode))
            }
            Label("Results", systemImage: "chart.xyaxis.line")
                .tag(Stroop.Phase.mark)
        }
        .pickerStyle(.segmented)
        .padding()
    }

}



struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(doc: .constant(Sample.document))
    }
}
