//
//  ChineseView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ChineseView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            Spacer()
            Text(stroop.test.current.word.chinese)
                .font(.system(size: 120))
                .foregroundColor(stroop.test.current.tint.color)
            Spacer()
            ButtonsView()
            Spacer()
            Button(action: {
                stroop.phase = .test(.english)
            }) {
                Label("English", systemImage: "play")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
}

struct ChineseView_Previews: PreviewProvider {
    static var previews: some View {
        ChineseView()
            .environmentObject(Stroop())
    }
}
