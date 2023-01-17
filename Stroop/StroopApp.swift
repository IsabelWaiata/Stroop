//
//  StroopApp.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

@main
struct StroopApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: StroopDocument()) { file in
            ContentView(document: file.$document)
                .frame(minWidth: 120, maxWidth: .infinity, minHeight: 80, maxHeight: .infinity)
        }
    }
}
