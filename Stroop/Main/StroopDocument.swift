//
//  StroopDocument.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI
import UniformTypeIdentifiers


struct StroopDocument: FileDocument {
    
    var stroop: Stroop

    init() {
        stroop = Stroop()
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let model = try? JSONDecoder().decode(Model.self, from: data)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.stroop = Stroop(model)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(stroop.model)
            return .init(regularFileWithContents: data)
        } catch {
            throw error
        }
    }

    static var readableContentTypes: [UTType] { [.stroop] }
}

extension UTType {
    static var stroop: UTType {
        UTType(importedAs: "net.waiata.stroop")
    }
}
