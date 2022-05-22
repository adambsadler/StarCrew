//
//  CrewViewModel.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import Foundation
import CoreData

class CrewViewModel: ObservableObject {
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
    
    func createCaptain(crew: Crew, captainName: String, captainBackground: String) {
        let newCaptain = Captain(context: context)
        newCaptain.name = captainName
        newCaptain.background = captainBackground
        
        crew.captain = newCaptain
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error saving new captain: \(error)")
        }
    }
    
    func createFirstMate(crew: Crew, firstMateName: String, firstMateBackground: String) {
        let newFirstMate = FirstMate(context: context)
        newFirstMate.name = firstMateName
        newFirstMate.background = firstMateBackground
        
        crew.firstMate = newFirstMate
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error saving new first mate: \(error)")
        }
    }
    
    func recruitSoldier(crew: Crew, soldierName: String, soldierType: String) {
        let newSoldier = Soldier(context: context)
        newSoldier.name = soldierName
        newSoldier.type = soldierType
        
        crew.addToSoldiers(newSoldier)
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error recruiting soldier: \(error)")
        }
    }
    
    func createSoldierArray(crew: Crew) -> [Soldier] {
        let fetchRequest: NSFetchRequest<Soldier>
        fetchRequest = Soldier.fetchRequest()
        
        do {
            let soldiers = try context.fetch(fetchRequest)
            var soldierArray = [Soldier]()
            for soldier in soldiers {
                if soldier.crew == crew {
                    soldierArray.append(soldier)
                }
            }
            
            return soldierArray
        } catch {
            let error = error as NSError
            print("Error fetching soldiers: \(error)")
        }
        
        return []
    }
}
