//
//  MoodView.swift
//  FidgetApp Watch App
//
//  Created by Jose Blanco on 6/30/23.
//

import Foundation
import SwiftUI

struct MoodView: View {
    @State var selection: MoodEmojis = .neutral
    @State var note: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("How do you feel \nright now?")
                    .font(.body)
                    .fontWeight(.heavy)
                    .transition(.opacity)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                VStack {
                    Picker(selection: $selection,
                           label: Text("Moods")
                    ) {
                        ForEach(MoodEmojis.allCases) { option in
                            HStack {
                                Text(option.rawValue)
                                    .bold()
                            }
                        }
                    }
                    .pickerStyle(.automatic)
                    .padding()
                    .labelsHidden()
                }
                .frame(width: 200, height: 75)
                
                HStack {
                    NoteView(note: $note)
                    
                    Button(action: {
                        
                    }) {
                        Text("Save")
                            .bold()
                            .frame(width: 75, height: 50)
                            .foregroundColor(Color.primary)
                            .background(Color(UIColor(red: 51/255, green: 212/255, blue: 212/255, alpha: 1.0)))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }.buttonStyle(PlainButtonStyle())
                        .frame(width: 75, height: 60)
                }
                Spacer()
            }
            .frame(width: 250, height: 275)
            .padding()
        }
    }
}
