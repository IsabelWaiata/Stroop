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
            Label("Control", systemImage: "squares.below.rectangle")
                .tag(Stroop.Phase.test(.control))
            Label("中文", systemImage: "squares.below.rectangle")
                .tag(Stroop.Phase.test(.chinese))
            Label("English", systemImage: "squares.below.rectangle")
                .tag(Stroop.Phase.test(.english))
            Label("Results", systemImage: "chart.xyaxis.line")
                .tag(Stroop.Phase.mark)
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    func go(_ phase: Stroop.Phase) {
        stroop.phase = .test(.control)
    }
    

}



struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
            .environmentObject(Stroop())
    }
}
