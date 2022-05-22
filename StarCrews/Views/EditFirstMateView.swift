//
//  EditFirstMateView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/22/22.
//

import SwiftUI

struct EditFirstMateView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    @ObservedObject var firstMate: FirstMate
    @State var firstMateName: String = ""
    @State var background: String = ""
    @State var level: Int64 = 0
    @State var move: Int64 = 0
    @State var fight: Int64 = 0
    @State var shoot: Int64 = 0
    @State var armour: Int64 = 0
    @State var will: Int64 = 0
    @State var health: Int64 = 0
    @State var currentHealth: Int64 = 0
    @State var gear: String = ""
    @State var notes: String = ""
    @State var powerArray: [Power] = []
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("First Mate Name")) {
                    TextField("First Mate Name", text: $firstMateName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Background")) {
                    TextField("Background", text: $background)
                        .disableAutocorrection(true)
                }
                Section(header: Text("First Mate Stats")) {
                    HStack {
                        Text("Level: ")
                        TextField("Level", value: $level, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Move: ")
                        TextField("Move", value: $move, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Fight: ")
                        TextField("Fight", value: $fight, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Shoot: ")
                        TextField("Shoot", value: $shoot, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Armour: ")
                        TextField("Armour", value: $armour, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Will: ")
                        TextField("Will", value: $will, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Health: ")
                        TextField("Health", value: $health, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Current Health: ")
                        TextField("Current Health", value: $currentHealth, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                }
                Section(header: Text("Powers")) {
                    ForEach(powerArray, id: \.self) { power in
                        NavigationLink {
                            EditPowerView(crewVM: CrewViewModel(), power: power)
                        } label: {
                            Text("\(power.name ?? "Power Name")")
                        }
                    }
                    NavigationLink {
                        AddFirstMatePowerView(crewVM: CrewViewModel(), firstMate: firstMate)
                    } label: {
                        Text("Add a new power")
                            .foregroundColor(.gray)
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
                        firstMate.name = firstMateName
                        firstMate.background = background
                        firstMate.level = level
                        firstMate.move = move
                        firstMate.fight = fight
                        firstMate.shoot = shoot
                        firstMate.armour = armour
                        firstMate.will = will
                        firstMate.health = health
                        firstMate.currentHealth = currentHealth
                        firstMate.gear = gear
                        firstMate.notes = notes
                        crewVM.saveData()
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Update First Mate")
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
        .navigationTitle("Update First Mate")
        .toolbar {
            ToolbarItem {
                Button {
                    showingAlert = true
                } label: {
                    Text("Delete First Mate")
                }.alert("Are you sure you want to delete your first mate?", isPresented: $showingAlert) {
                    Button("Delete", role: .destructive) {
                        crewVM.deleteFirstMate(firstMate: firstMate)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                firstMateName = firstMate.name ?? ""
                background = firstMate.background ?? ""
                level = firstMate.level
                move = firstMate.move
                fight = firstMate.fight
                shoot = firstMate.shoot
                armour = firstMate.armour
                will = firstMate.will
                health = firstMate.health
                currentHealth = firstMate.currentHealth
                gear = firstMate.gear ?? ""
                notes = firstMate.notes ?? ""
                powerArray = crewVM.getFirstMatePowerArray(firstMate: firstMate)
            }
        }
    }
}

struct EditFirstMateView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let sampleFirstMate = FirstMate(context: context)
        let samplePower = Power(context: context)
        sampleFirstMate.name = "Han Solo"
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
        
        return EditFirstMateView(crewVM: CrewViewModel(), firstMate: sampleFirstMate)
    }
}
