//
//  CaptainListView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct CaptainListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var captain: Captain
    
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Text("Captain: ")
                    .bold()
                + Text("\(captain.name ?? "Unknown")")
                Spacer()
                Text("Level: ")
                    .bold()
                + Text("\(captain.level)")
            }
            HStack {
                Text("\(captain.background ?? "Unknown")")
                Spacer()
                Text("Current Health: ")
                    .bold()
                + Text("\(captain.currentHealth)")
            }
            HStack {
                VStack {
                    Text("Move")
                        .bold()
                    Text("\(captain.move)")
                }
                VStack {
                    Text("Fight")
                        .bold()
                    Text("\(captain.fight)")
                }
                VStack {
                    Text("Shoot")
                        .bold()
                    Text("\(captain.shoot)")
                }
                VStack {
                    Text("Armour")
                        .bold()
                    Text("\(captain.armour)")
                }
                VStack {
                    Text("Will")
                        .bold()
                    Text("\(captain.will)")
                }
                VStack {
                    Text("Health")
                        .bold()
                    Text("\(captain.health)")
                }
            }
            .frame(maxWidth: .infinity)
            HStack {
                Text("Powers")
                    .bold()
                Spacer()
            }
            ForEach(Array(captain.powers as? Set<Power> ?? []), id: \.self) { power in
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
                }
            }
            .padding(.horizontal)
            
            HStack {
                Text("Gear")
                    .bold()
                Spacer()
            }
            Text("\(captain.gear ?? "Gear")")
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Notes")
                    .bold()
                Spacer()
            }
            Text("\(captain.notes ?? "Gear")")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

struct CaptainListView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let sampleCaptain = Captain(context: context)
        let samplePower = Power(context: context)
        sampleCaptain.name = "Han Solo"
        sampleCaptain.level = 25
        sampleCaptain.background = "Rogue"
        sampleCaptain.move = 6
        sampleCaptain.fight = 7
        sampleCaptain.shoot = 8
        sampleCaptain.armour = 12
        sampleCaptain.will = 9
        sampleCaptain.health = 14
        sampleCaptain.currentHealth = 10
        sampleCaptain.gear = "Pistol, medkit"
        sampleCaptain.notes = "Lost an ear"
        samplePower.name = "Hip shot"
        samplePower.activation = 12
        samplePower.strain = 2
        samplePower.category = "Line of sight"
        samplePower.notes = "Quickly draw your blaster and shoot an enemy."
        sampleCaptain.addToPowers(samplePower)
        
        return CaptainListView(captain: sampleCaptain)
    }
}
