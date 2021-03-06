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
    
    func saveData() {
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error saving data: \(error)")
        }
    }
    
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
    
    func increaseCaptainHealth(captain: Captain) {
        if captain.currentHealth < captain.health {
            DispatchQueue.main.async {
                captain.currentHealth += 1
            }
            
            do {
                try context.save()
            } catch {
                let error = error as NSError
                print("Error increasing captain's health: \(error)")
            }
        }
    }
    
    func decreaseCaptainHealth(captain: Captain) {
        if captain.currentHealth > 0 {
            DispatchQueue.main.async {
                captain.currentHealth -= 1
            }
            
            do {
                try context.save()
            } catch {
                let error = error as NSError
                print("Error descreasing captain's health: \(error)")
            }
        }
    }
    
    func addPowerToCaptain(captain: Captain, name: String, category: String, notes: String, activation: Int64, strain: Int64) {
        let newPower = Power(context: context)
        newPower.name = name
        newPower.category = category
        newPower.notes = notes
        newPower.activation = activation
        newPower.strain = strain
        
        captain.addToPowers(newPower)
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error saving new power: \(error)")
        }
    }
    
    func deleteCaptain(captain: Captain) {
        context.delete(captain)
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error deleting captain: \(error)")
        }
    }
    
    func deletePower(power: Power) {
        context.delete(power)
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error deleting power: \(error)")
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
    
    func addPowerToFirstMate(firstMate: FirstMate, name: String, category: String, notes: String, activation: Int64, strain: Int64) {
        let newPower = Power(context: context)
        newPower.name = name
        newPower.category = category
        newPower.notes = notes
        newPower.activation = activation
        newPower.strain = strain
        
        firstMate.addToPowers(newPower)
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error saving new power: \(error)")
        }
    }
    
    func increaseFirstMateHealth(firstMate: FirstMate) {
        if firstMate.currentHealth < firstMate.health {
            DispatchQueue.main.async {
                firstMate.currentHealth += 1
            }
            
            do {
                try context.save()
            } catch {
                let error = error as NSError
                print("Error increasing first mate's health: \(error)")
            }
        }
    }
    
    func decreaseFirstMateHealth(firstMate: FirstMate) {
        if firstMate.currentHealth > 0 {
            DispatchQueue.main.async {
                firstMate.currentHealth -= 1
            }
            
            do {
                try context.save()
            } catch {
                let error = error as NSError
                print("Error descreasing first mate's health: \(error)")
            }
        }
    }
    
    func deleteFirstMate(firstMate: FirstMate) {
        context.delete(firstMate)
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error deleting first mate: \(error)")
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
    
    func increaseSoldierHealth(soldier: Soldier) {
        if soldier.currentHealth < soldier.health {
            DispatchQueue.main.async {
                soldier.currentHealth += 1
            }
            
            do {
                try context.save()
            } catch {
                let error = error as NSError
                print("Error increasing soldier's health: \(error)")
            }
        }
    }
    
    func decreaseSoldierHealth(soldier: Soldier) {
        if soldier.currentHealth > 0 {
            DispatchQueue.main.async {
                soldier.currentHealth -= 1
            }
            
            do {
                try context.save()
            } catch {
                let error = error as NSError
                print("Error descreasing soldier's health: \(error)")
            }
        }
    }
    
    func deleteSoldier(soldier: Soldier) {
        context.delete(soldier)
        
        do {
            try context.save()
        } catch {
            let error = error as NSError
            print("Error deleting soldier: \(error)")
        }
    }
    
    func getSoldierArray(crew: Crew) -> [Soldier] {
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
            
            return soldierArray.sorted { $0.name! < $1.name! }
        } catch {
            let error = error as NSError
            print("Error fetching soldiers: \(error)")
        }
        
        return []
    }
    
    func getCaptainPowerArray(captain: Captain) -> [Power] {
        let fetchRequest: NSFetchRequest<Power>
        fetchRequest = Power.fetchRequest()
        
        do {
            let powers = try context.fetch(fetchRequest)
            var powerArray = [Power]()
            for power in powers {
                if power.captain == captain {
                    powerArray.append(power)
                }
            }
            
            return powerArray.sorted { $0.name! < $1.name! }
        } catch {
            let error = error as NSError
            print("Error fetching powers: \(error)")
        }
        
        return []
    }
    
    func getFirstMatePowerArray(firstMate: FirstMate) -> [Power] {
        let fetchRequest: NSFetchRequest<Power>
        fetchRequest = Power.fetchRequest()
        
        do {
            let powers = try context.fetch(fetchRequest)
            var powerArray = [Power]()
            for power in powers {
                if power.firstMate == firstMate {
                    powerArray.append(power)
                }
            }
            
            return powerArray.sorted { $0.name! < $1.name! }
        } catch {
            let error = error as NSError
            print("Error fetching powers: \(error)")
        }
        
        return []
    }
}
