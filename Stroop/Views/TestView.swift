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
            
            if stroop.phase == .test(.control) {
                ControlView()
            }
            
            if stroop.phase == .test(.chinese) {
                ChineseView()
            }
            
            if stroop.phase == .test(.english) {
                EnglishView()
            }
            
        }
        
    }

}

struct TestView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView()
            .environmentObject(Stroop())
    }
}
