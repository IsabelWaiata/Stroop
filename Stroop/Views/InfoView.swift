//
//  InfoView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct InfoView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    var body: some View {
        VStack {
            Form {
                Picker(selection: $stroop.subject.gender, label: Text("Gender:")) {
                    ForEach(Subject.Gender.allCases, id: \.self) { gender in
                        Text(gender.rawValue.localizedCapitalized).tag(gender)
                    }
                }
                HStack {
                    Text("Age:")
                    
                    TextField("", value: $stroop.subject.age, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
#if os(iOS)
                        .keyboardType(.decimalPad)
#endif
                    
                }
                
            }
            Text("Instructions")
            Button(action: {
                stroop.nextTest()
                stroop.phase = .test(.control)
            }) {
                Label("Go!", systemImage: "play")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(Stroop())
    }
}
