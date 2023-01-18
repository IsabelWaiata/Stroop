//
//  ContentView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            PageView()
            
            switch stroop.phase {
            case .info: InfoView()
            case .test: TestView()
            case .mark: MarkView()
            }
        }
        .navigationTitle("")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Sample.stroop)
    }
}
