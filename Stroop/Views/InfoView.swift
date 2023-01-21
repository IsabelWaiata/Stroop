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
    
    @State private var showingExporter = false
    @State private var csvDocument: CSVDocument?
    
    var body: some View {
        VStack {
            Button(action: {
                csvDocument = CSVDocument(stroop)
                showingExporter = true
            }) {
                Label("Export CSV", systemImage: "square.and.arrow.up")
            }
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
                stroop.phase = .test(.first)
            }) {
                Label("Go!", systemImage: "play")
            }
            .buttonStyle(.borderedProminent)
            
            
        }
        .padding()
        .fileExporter(isPresented: $showingExporter,
                      document: csvDocument,
                      contentType: .commaSeparatedText,
                      defaultFilename: "Stroop Export") { result in
            switch result {
            case .success(let url):
                print("Saved to \(url)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(Stroop())
    }
}
