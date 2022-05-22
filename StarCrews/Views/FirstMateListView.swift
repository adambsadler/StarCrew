//
//  FirstMateListView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct FirstMateListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var firstMate: FirstMate
    
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Text("First Mate: ")
                    .bold()
                + Text("\(firstMate.name ?? "Unknown")")
                Spacer()
                Text("Level: ")
                    .bold()
                + Text("\(firstMate.level)")
            }
            HStack {
                Text("\(firstMate.background ?? "Unknown")")
                Spacer()
                Text("Current Health: ")
                    .bold()
                + Text("\(firstMate.currentHealth)")
            }
            HStack {
                VStack {
                    Text("Move")
                        .bold()
                    Text("\(firstMate.move)")
                }
                VStack {
                    Text("Fight")
                        .bold()
                    Text("+\(firstMate.fight)")
                }
                VStack {
                    Text("Shoot")
                        .bold()
                    Text("+\(firstMate.shoot)")
                }
                VStack {
                    Text("Armour")
                        .bold()
                    Text("\(firstMate.armour)")
                }
                VStack {
                    Text("Will")
                        .bold()
                    Text("+\(firstMate.will)")
                }
                VStack {
                    Text("Health")
                        .bold()
                    Text("\(firstMate.health)")
                }
            }
            .frame(maxWidth: .infinity)
            HStack {
                Text("Powers")
                    .bold()
                Spacer()
            }
            ForEach(Array(firstMate.powers as? Set<Power> ?? []), id: \.self) { power in
                VStack {
                    HStack {
                        Text("\(power.name ?? "Unknown")")
                            .bold()
                        Spacer()
                        Text("Activation: ")
                            .bold()
                        + Text("\(power.activation)")
                    }
                    HStack {
                        Text("\(power.category ?? "Unknown")")
                        Spacer()
                        Text("Strain: ")
                            .bold()
                        + Text("\(power.strain)")
                    }
                    VStack {
                        Text("Description: ")
                            .bold()
                        + Text("\(power.notes ?? "Notes")")
                            
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                }
            }
            .padding(.horizontal)
            
            HStack {
                Text("Gear")
                    .bold()
                Spacer()
            }
            Text("\(firstMate.gear ?? "")")
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Notes")
                    .bold()
                Spacer()
            }
            Text("\(firstMate.notes ?? "")")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct FirstMateListView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let sampleFirstMate = FirstMate(context: context)
        let samplePower = Power(context: context)
        sampleFirstMate.name = "Bucky"
        sampleFirstMate.level = 25
        sampleFirstMate.background = "Rogue"
        sampleFirstMate.move = 6
        sampleFirstMate.fight = 7
        sampleFirstMate.shoot = 8
        sampleFirstMate.armour = 12
        sampleFirstMate.will = 9
        sampleFirstMate.health = 14
        sampleFirstMate.currentHealth = 10
        sampleFirstMate.gear = "Pistol, medkit"
        sampleFirstMate.notes = "Lost an ear"
        samplePower.name = "Hip shot"
        samplePower.activation = 12
        samplePower.strain = 2
        samplePower.category = "Line of sight"
        samplePower.notes = "Quickly draw your blaster and shoot an enemy."
        sampleFirstMate.addToPowers(samplePower)
        
        return FirstMateListView(firstMate: sampleFirstMate)
    }
}
