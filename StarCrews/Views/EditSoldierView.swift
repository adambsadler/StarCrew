//
//  EditSoldierView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/22/22.
//

import SwiftUI

struct EditSoldierView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    @ObservedObject var soldier: Soldier
    @State var soldierName: String = ""
    @State var type: String = ""
    @State var move: Int64 = 0
    @State var fight: Int64 = 0
    @State var shoot: Int64 = 0
    @State var armour: Int64 = 0
    @State var will: Int64 = 0
    @State var health: Int64 = 0
    @State var currentHealth: Int64 = 0
    @State var gear: String = ""
    @State var notes: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Soldier Name")) {
                    TextField("Soldier Name", text: $soldierName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Type")) {
                    TextField("Type", text: $type)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Soldier Stats")) {
                    HStack {
                        Text("Move: ")
                        TextField("Move", value: $move, formatter: NumberFormatter())
                    }
                    HStack {
                        Text("Fight: ")
                        TextField("Fight", value: $fight, formatter: NumberFormatter())
                    }
                    HStack {
                        Text("Shoot: ")
                        TextField("Shoot", value: $shoot, formatter: NumberFormatter())
                    }
                    HStack {
                        Text("Armour: ")
                        TextField("Armour", value: $armour, formatter: NumberFormatter())
                    }
                    HStack {
                        Text("Will: ")
                        TextField("Will", value: $will, formatter: NumberFormatter())
                    }
                    HStack {
                        Text("Health: ")
                        TextField("Health", value: $health, formatter: NumberFormatter())
                    }
                    HStack {
                        Text("Current Health: ")
                        TextField("Current Health", value: $currentHealth, formatter: NumberFormatter())
                    }
                }
                Section(header: Text("Gear")) {
                    TextEditor(text: $gear)
                }
                Section(header: Text("Notes")) {
                    TextEditor(text: $notes)
                }
                Section(footer: Button {
                    DispatchQueue.main.async {
                        soldier.name = soldierName
                        soldier.type = type
                        soldier.move = move
                        soldier.fight = fight
                        soldier.shoot = shoot
                        soldier.armour = armour
                        soldier.will = will
                        soldier.health = health
                        soldier.currentHealth = currentHealth
                        soldier.gear = gear
                        soldier.notes = notes
                        crewVM.saveData()
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Update Soldier")
                        .font(.body)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity)
                }){
                    EmptyView()
                }
            }
        }
        .navigationTitle("Update Soldier")
        .toolbar {
            ToolbarItem {
                Button {
                    showingAlert = true
                } label: {
                    Text("Delete Soldier")
                }.alert("Are you sure you want to delete this soldier?", isPresented: $showingAlert) {
                    Button("Delete", role: .destructive) {
                        crewVM.deleteSoldier(soldier: soldier)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                soldierName = soldier.name ?? ""
                type = soldier.type ?? ""
                move = soldier.move
                fight = soldier.fight
                shoot = soldier.shoot
                armour = soldier.armour
                will = soldier.will
                health = soldier.health
                currentHealth = soldier.currentHealth
                gear = soldier.gear ?? ""
                notes = soldier.notes ?? ""
            }
        }
    }
}

struct EditSoldierView_Previews: PreviewProvider {
    
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
        
        return EditSoldierView(crewVM: CrewViewModel(), soldier: sampleSoldier)
    }
}
