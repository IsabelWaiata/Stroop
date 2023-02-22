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
            ScrollView {
                if stroop.test.trys.count > 0 {
                    Text("This Test").font(.largeTitle)
                    Text(stroop.test.score.summary)
                    Divider()
                    ComboViews(showTotal: false)
                }
                Text("All Previous Tests").font(.largeTitle)
                Text("\(stroop.tests.count) Tests Completed")
                Divider()
                ComboViews(showTotal: true)
            }
            
            ZStack {
                HStack {
                    Spacer()
                    Button(action: {
                        stroop.nextTest()
                        stroop.phase = .info
                    }) {
                        Label("Discard", systemImage: "xmark.bin")
                    }
                    .foregroundColor(.red)
                    .buttonStyle(.plain)
                }
                Button(action: {
                    stroop.saveTest()
                    stroop.nextTest()
                    stroop.phase = .info
                }) {
                    Label("Save", systemImage: "internaldrive")
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding(.horizontal)
#if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
        }
    }
}

struct MarkView_Previews: PreviewProvider {
    static var previews: some View {
        MarkView()
            .environmentObject(Sample.stroop)
    }
}
