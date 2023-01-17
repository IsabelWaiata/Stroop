//
//  EnglishView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct EnglishView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            Spacer()
            Text(stroop.test.current.word.english)
                .font(.system(size: 120))
                .foregroundColor(stroop.test.current.tint.color)
            Spacer()
            ButtonsView()
            Spacer()
            Button(action: {
                stroop.phase = .mark
                stroop.saveTest()
            }) {
                Label("Results", systemImage: "play")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
}

struct EnglishView_Previews: PreviewProvider {
    static var previews: some View {
        EnglishView()
            .environmentObject(Stroop())
    }
}
