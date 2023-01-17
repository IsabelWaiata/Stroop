//
//  ControlView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ControlView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            Spacer()
            Text(stroop.test.current.word.control)
                .font(.system(size: 120))
            Spacer()
            ButtonsView()
            Spacer()
            Button(action: {
                stroop.phase = .test(.chinese)
            }) {
                Label("中文", systemImage: "play")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
        .environmentObject(Stroop())
    }
}
