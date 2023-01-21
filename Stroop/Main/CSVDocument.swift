//
//  CSVDocument.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/21.
//

import SwiftUI
import UniformTypeIdentifiers


struct CSVDocument: FileDocument {
    
    var csv: String = ""
    
    let csvHeaderRow = "Gender,Age,Chinese Control Attempts,Chinese Control Correct,Chinese Control Seconds,English Control Attempts,English Control Correct,English Control Seconds,Chinese Variable Attempts,Chinese Variable Correct,Chinese Variable Seconds,English Variable Attempts,English Variable Correct,Chinese Variable Seconds"
    
    func csv(for test: Test) -> String {
        var cells = [String]()
        cells.append(test.subject.gender?.rawValue ?? "")
        cells.append("\(test.subject.age)")
        for mode in Test.Mode.list {
            let score = test.score(for: mode)
            cells.append("\(score.trys)")
            cells.append("\(score.good)")
            cells.append("\(score.time)")
        }
        let row = cells.joined(separator: ",")
        return row
    }
    
    init(_ stroop: Stroop) {
        var rows = [csvHeaderRow]
        for test in stroop.tests {
            let row = csv(for: test)
            rows.append(row)
        }
        self.csv = rows.joined(separator: "\n")
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            csv = String(decoding: data, as: UTF8.self)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(csv.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
    
    static var readableContentTypes: [UTType] { [.commaSeparatedText] }
}
