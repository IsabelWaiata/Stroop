//
//  TestView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

import SwiftUI

struct TestView: View {
    
    @ObservedObject var stroop: Stroop
    
    var body: some View {
        
        VStack {
            
            ScoreView(stroop: stroop)
            
            PlayView(stroop: stroop)
            
        }
        .padding()
#if os(iOS)
        .navigationBarHidden(true)
#endif
    }
}

struct TestView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView(stroop: Sample.stroop)
    }
}
