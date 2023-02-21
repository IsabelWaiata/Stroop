//
//  ButtonsView.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import SwiftUI

struct ButtonsView: View {
    
    @ObservedObject var stroop: Stroop
    
    var body: some View {
        HStack {
            ForEach(Colour.allCases, id: \.self) { colour in
                Button {
                    let good = stroop.guess(colour)
                    Buzzer.shared.buzz(good)
                } label: {
                    Rectangle()
                        .frame(height: 150)
                        .foregroundColor(colour.color)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
    
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(stroop: Sample.stroop)
    }
}
