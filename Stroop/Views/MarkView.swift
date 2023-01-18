//
//  MarkView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct MarkView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            Divider()
            Text("Accuracy").font(.title)
                .padding()
            AccuracyViews()
            Divider()
            Text("Speed").font(.title).padding()
            SpeedViews()
        }
        
        HStack {
            Button(action: {
                stroop.saveTest()
                stroop.nextTest()
                stroop.phase = .info
            }) {
                Label("Save", systemImage: "internaldrive")
            }
            .buttonStyle(.borderedProminent)
            
            Button(action: {
                stroop.nextTest()
                stroop.phase = .info
            }) {
                Label("Discard", systemImage: "xmark.bin")
            }
            .buttonStyle(.plain)
        }
    }
}

struct MarkView_Previews: PreviewProvider {
    static var previews: some View {
        MarkView()
            .environmentObject(Sample.stroop)
    }
}
