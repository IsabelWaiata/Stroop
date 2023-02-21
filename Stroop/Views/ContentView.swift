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
            PageView(stroop: doc.stroop)
            PhaseView(stroop: doc.stroop)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(doc: .constant(StroopDocument()))
    }
}
