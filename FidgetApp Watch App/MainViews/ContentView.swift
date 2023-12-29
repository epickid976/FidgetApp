//
//  ContentView.swift
//  FigetApp Watch App
//
//  Created by Jose Blanco on 6/25/23.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    @AppStorage("score") var score: Int = 0 {
        didSet {
            if score == 10 || score == 50 || score == 100 || score == 200 || score == 300 || score == 400 || score == 500 || score == 1000  || score == 1500 || score == 2000 || score == 3000 || score == 3000 || score == 3000 || score == 3000 || score == 3000 || score == 3000 || score == 3000 || score == 3000 || score == 4000 || score == 5000 || score == 6000 || score == 7000 || score == 8000 || score == 9000 || score == 10000 || score == 11000 || score == 12000 || score == 13000 || score == 14000 || score == 15000 || score == 16000 || score == 17000 || score == 18000 || score == 19000 || score == 20000 || score == 21000 || score == 22000 || score == 23000 || score == 24000 || score == 25000 || score == 26000 || score == 27000 || score == 28000 || score == 29000 || score == 30000 || score == 31000 || score == 32000 || score == 33000 || score == 34000 || score == 35000 || score == 36000 || score == 37000 || score == 38000 || score == 39000 || score == 40000 {
                animation = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    animation = false
                }
            }
        }
    }
    @AppStorage("newTaps") var newTaps: Int = 0
    @AppStorage("vibration") var vibration: Vibration = .strong
    
    init() {
        newTaps = 0
    }
    @State var animation: Bool = false
    @State var scale: Bool = false
    @State private var currentPage = 0
    var body: some View {
        VStack{
            VStack {
                Text("Welcome to Figet!")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .transition(.opacity)
                //Total Score
                Text("Score: \(score)")
                    .bold()
                    .transition(.opacity)
            }
                .padding(.bottom, 5)
            //Press me Button
            ZStack {
                if animation {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 12, height: 12)
                        .modifier(ParticlesModifier())
                        .offset(x: -100, y : -50)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 12, height: 12)
                        .modifier(ParticlesModifier())
                        .offset(x: 60, y : 70)
                }
                
                Button(action: {
                    withAnimation {
                        DispatchQueue.main.async {
                            scale.toggle()
                        }
                    }
                    switch vibration {
                    case .light:
                        WKInterfaceDevice.current().play(.click)
                    case .medium:
                        WKInterfaceDevice.current().play(.start)
                    case .strong:
                        WKInterfaceDevice.current().play(.success)
                    case .SCREAM:
                        WKInterfaceDevice.current().play(.retry)
                    }
                    score += 1
                    newTaps += 1
                }){
                    Text("Press me")
                        .bold()
                        .frame(width: scale ? 85 : 100, height: scale ? 85 : 100)
                        .foregroundColor(Color.primary)
                        .background(Color(UIColor(red: 51/255, green: 212/255, blue: 212/255, alpha: 1.0)))
                        .clipShape(Circle())
                }
                .frame(width: 100, height: 100)
                .buttonStyle(PlainButtonStyle())
                    .transition(.scale)
            }
            .padding(.bottom, 5)
            .animation(.easeInOut, value: scale)
            //New Score
            Text("New Taps: \(newTaps)")
                .bold()
                .transition(.opacity)
        }.frame(width: 300, height: 300)
        .animation(.easeInOut, value: scale)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
