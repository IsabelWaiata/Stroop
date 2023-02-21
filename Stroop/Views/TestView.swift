//
//  TestView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        
        VStack {
            
            ScoreView()
            
            PlayView()
            
        }
        .padding()
#if os(iOS)
        .navigationBarHidden(true)
#endif
    }
}

struct TestView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView()
            .environmentObject(Sample.stroop)
    }
}
