//
//  ToolView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/30.
//

import SwiftUI

struct ToolView: View {
    
    @EnvironmentObject var stroop: Stroop
    
    @State private var showingExporter = false
    @State private var csvDocument: CSVDocument?
    
    
    var body: some View {
        
        Button(action: {
            csvDocument = CSVDocument(stroop)
            showingExporter = true
        }) {
            Label("Export CSV", systemImage: "square.and.arrow.up")
        }
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

struct ToolView_Previews: PreviewProvider {
    static var previews: some View {
        ToolView()
    }
}
