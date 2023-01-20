//
//  InfoView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct InfoView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    @AppStorage("Gender") var gender: Subject.Gender?
    @AppStorage("Age") var age: Int = 1
    
    var body: some View {
        VStack {
            Form {
                Picker(selection: $gender, label: Text("Gender:")) {
                    Text("Unspecified").tag(nil as Subject.Gender?)
                    ForEach(Subject.Gender.allCases, id: \.self) { gender in
                        Text(gender.rawValue.localizedCapitalized).tag(gender as Subject.Gender?)
                    }
                }
                HStack {
                    Text("Age:")
                    
                    TextField("", value: $age, formatter: NumberFormatter())
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