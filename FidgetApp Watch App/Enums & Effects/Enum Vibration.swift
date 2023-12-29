//
//  enum Vibration.swift
//  FigetApp Watch App
//
//  Created by Jose Blanco on 6/25/23.
//

import Foundation

enum Vibration: String, Codable, CaseIterable, Identifiable {
    var id: Self { return self }
    
    case light = "Light"
    case medium = "Medium"
    case strong = "Strong"
    case SCREAM = "SCREAM"
}
