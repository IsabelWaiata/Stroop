//
//  MarkView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct MarkView: View {
    
    @Binding var doc: StroopDocument
    
    var body: some View {
        VStack {
            ScrollView {
                if doc.stroop.test.trys.count > 0 {
                    Text("This Test").font(.largeTitle)
                    Text(doc.stroop.test.score.summary)
                    Divider()
                    AccuracyViews(stroop: doc.stroop, showTotal: false)
                    SpeedViews(stroop: doc.stroop, showTotal: false)
                }
                Text("All Previous Tests").font(.largeTitle)
                Text("\(doc.stroop.model.tests.count) Tests Completed")
                Divider()
                AccuracyViews(stroop: doc.stroop, showTotal: true)
                SpeedViews(stroop: doc.stroop, showTotal: true)
            }
            
            ZStack {
                HStack {
                    Spacer()
                    Button(action: {
                        doc.stroop.nextTest()
                        doc.stroop.phase = .info
                    }) {
                        Label("Discard", systemImage: "xmark.bin")
                    }
                    .foregroundColor(.red)
                    .buttonStyle(.plain)
                }
                Button(action: {
                    doc.stroop.saveTest()
                    doc.stroop.nextTest()
                    doc.stroop.phase = .info
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
        MarkView(doc: .constant(Sample.document))
    }
}
