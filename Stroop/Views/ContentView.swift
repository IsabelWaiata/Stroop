//
//  ContentView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var doc: StroopDocument

    var body: some View {
        VStack {
            PageView()
            PhaseView(doc: $doc)
        }
        .environmentObject(doc.stroop)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    @State static var doc = Sample.document
    static var previews: some View {
        ContentView(doc: $doc)
    }
}
