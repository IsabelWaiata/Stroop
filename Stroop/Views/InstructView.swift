//
//  InstructView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/30.
//

import SwiftUI

struct InstructView: View {
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Instructions")
                .font(.title)
            Text("尽可能快地按下与单词含义相对应的彩色按钮。")
            Text("Press the colored button corresponding to the **MEANING** of the word as *fast* as you can.")
            Text("如果你不懂中文或英文，你可以跳过它。")
            Text("If you don’t know Chinese or English, you can skip it.")
            ForEach(Test.Mode.list, id: \.self) { mode in
                Divider()
//                PlayView(stroop: Sample.stroop(mode))
            }
        }
        
    }
}

struct InstructView_Previews: PreviewProvider {
    static var previews: some View {
        InstructView()
    }
}
