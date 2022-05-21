//
//  CrewViewModel.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import Foundation
import CoreData

class CrewViewModel {
    let context = PersistenceController.shared.container.viewContext
    
    func createCrew(name: String, shipName: String) {
        let newCrew = Crew(context: context)
        newCrew.name = name
        newCrew.shipName = shipName
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error saving new crew: \(error)")
        }
    }
}
