//
//  Struct Mood.swift
//  FidgetApp Watch App
//
//  Created by Jose Blanco on 6/30/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Mood")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    
}

//struct Mood {
//    var id: UUID
//    var emoji: String
//    var note: String
//}
