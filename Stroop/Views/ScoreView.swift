//
//  ScoreView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        Text(stroop.test.score.summary)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
            .environmentObject(Sample.stroop)
    }
}
