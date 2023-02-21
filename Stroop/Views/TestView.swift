//
//  TestView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

import SwiftUI

struct TestView: View {
    
    @Binding var doc: StroopDocument
    
    var body: some View {
        
        VStack {
            
            ScoreView(stroop: doc.stroop)
            
            PlayView(stroop: doc.stroop)
            
        }
        .padding()
#if os(iOS)
        .navigationBarHidden(true)
#endif
    }
}

struct TestView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView(doc: .constant(Sample.document))
    }
}
