//
//  Enum Moods.swift
//  FidgetApp Watch App
//
//  Created by Jose Blanco on 6/30/23.
//

import Foundation

enum MoodEmojis: String, CaseIterable, Codable, Identifiable {
    var id: Self { return self }
    
    case reallyHappy = "😃"
    case happy = "🙂"
    case neutral = "😐"
    case sad = "🙁"
    case reallySad = "😢"
}
