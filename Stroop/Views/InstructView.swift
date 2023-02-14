//
//  InstructView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/30.
//

import SwiftUI

struct InstructView: View {
    
    
    
    var body: some View {
        VStack {
            Text("Instructions")
                .font(.title)
            Text("Press the coloured button corresponding to the **meaning** of the word")
            PlayView()
                .environmentObject(Sample.stroop)
            
        }
    }
}

struct InstructView_Previews: PreviewProvider {
    static var previews: some View {
        InstructView()
    }
}
