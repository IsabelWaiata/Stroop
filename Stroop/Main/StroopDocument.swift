//
//  StroopDocument.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI
import UniformTypeIdentifiers


struct StroopDocument: FileDocument {
    
    var stroop = Stroop()

    init() { }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let stroop = try? JSONDecoder().decode(Stroop.self, from: data)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.stroop = stroop
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(stroop)
            return .init(regularFileWithContents: data)
        } catch {
            throw error
        }
    }
    
//    func csv() -> String {
//        var csv = punter?.tit ?? ""
//        csv += "," + card.tit + "\n"
//        return csv
//    }
    
    static var readableContentTypes: [UTType] { [.stroop] }
}

extension UTType {
    static var stroop: UTType {
        UTType(importedAs: "net.waiata.stroop")
    }
}