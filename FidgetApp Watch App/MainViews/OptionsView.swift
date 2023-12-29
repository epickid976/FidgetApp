//
//  OptionsView.swift
//  FigetApp Watch App
//
//  Created by Jose Blanco on 6/25/23.
//

import Foundation
import SwiftUI

struct OptionsView: View {
    @AppStorage("score") var score: Int = 0
    @AppStorage("vibration") var vibration: Vibration = .strong
    @AppStorage("newTaps") var newTaps: Int = 0
    var body: some View {
        VStack {
            Button(action: {
                score = 0
                newTaps = 0
            }) {
                Text("Reset Score")
                    .bold()
                    .frame(width: 150, height: 50)
                    .foregroundColor(Color.primary)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }.buttonStyle(PlainButtonStyle())
            
            VStack {
                Picker(selection: $vibration,
                       label: Text("Vibration options")
                                .fontWeight(.heavy)
                                .font(.title3)
                                    
                ) {
                    ForEach(Vibration.allCases) { option in
                        HStack {
                            Text(option.rawValue)
                                .bold()
                        }
                    }
                }
                .pickerStyle(.automatic)
                .padding()
            }
            .frame(width: 200, height: 100)
            //            Button(action: {
            //
            //            }) {
            //                Text("Vibration Options")
            //                    .frame(width: 150, height: 50)
            //                    .foregroundColor(Color.primary)
            //                    .background(Color.gray.opacity(0.5))
            //                    .clipShape(RoundedRectangle(cornerRadius: 16))
            //            }.buttonStyle(PlainButtonStyle())
        }.frame(width: 300, height: 300)
        
        
    }
}
