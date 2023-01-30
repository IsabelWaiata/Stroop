//
//  PageView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct PageView: View {

    @EnvironmentObject var stroop: Stroop

    var body: some View {
        Picker("", selection: $stroop.phase) {
            
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
        PageView()
            .environmentObject(Stroop())
    }
}
