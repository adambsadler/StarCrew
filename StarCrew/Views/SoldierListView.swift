//
//  SoldierListView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct SoldierListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var soldier: Soldier
    
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Text("Crew: ")
                    .bold()
                + Text("\(soldier.name ?? "Unknown")")
                Spacer()
            }
            HStack {
                Text("\(soldier.type ?? "Unknown")")
                Spacer()
                Text("Current Health: ")
                    .bold()
                + Text("\(soldier.currentHealth)")
            }
            HStack {
                VStack {
                    Text("Move")
                        .bold()
                    Text("\(soldier.move)")
                }
                VStack {
                    Text("Fight")
                        .bold()
                    Text("\(soldier.fight)")
                }
                VStack {
                    Text("Shoot")
                        .bold()
                    Text("\(soldier.shoot)")
                }
                VStack {
                    Text("Armour")
                        .bold()
                    Text("\(soldier.armour)")
                }
                VStack {
                    Text("Will")
                        .bold()
                    Text("\(soldier.will)")
                }
                VStack {
                    Text("Health")
                        .bold()
                    Text("\(soldier.health)")
                }
            }
            .frame(maxWidth: .infinity)
            
            HStack {
                Text("Gear")
                    .bold()
                Spacer()
            }
            Text("\(soldier.gear ?? "")")
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Notes")
                    .bold()
                Spacer()
            }
            Text("\(soldier.notes ?? "")")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SoldierListView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let sampleSoldier = Soldier(context: context)
        
        sampleSoldier.name = "Han Solo"
        sampleSoldier.type = "Rogue"
        sampleSoldier.move = 6
        sampleSoldier.fight = 7
        sampleSoldier.shoot = 8
        sampleSoldier.armour = 12
        sampleSoldier.will = 9
        sampleSoldier.health = 14
        sampleSoldier.currentHealth = 10
        sampleSoldier.gear = "Pistol, medkit"
        sampleSoldier.notes = "Lost an ear"
        
        return SoldierListView(soldier: sampleSoldier)
    }
}
