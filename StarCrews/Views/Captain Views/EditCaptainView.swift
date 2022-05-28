//
//  EditCaptainView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/22/22.
//

import SwiftUI

struct EditCaptainView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    @ObservedObject var captain: Captain
    @State var captainName: String = ""
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
                Section(header: Text("Captain Name")) {
                    TextField("Captain Name", text: $captainName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Background")) {
                    TextField("Background", text: $background)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Captain Stats")) {
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
                        ChooseCaptainPowerView(crewVM: crewVM, captain: captain)
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
                        captain.name = captainName
                        captain.background = background
                        captain.level = level
                        captain.move = move
                        captain.fight = fight
                        captain.shoot = shoot
                        captain.armour = armour
                        captain.will = will
                        captain.health = health
                        captain.currentHealth = currentHealth
                        captain.gear = gear
                        captain.notes = notes
                        crewVM.saveData()
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Update Captain")
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
        .navigationTitle("Update Captain")
        .toolbar {
            ToolbarItem {
                Button {
                    showingAlert = true
                } label: {
                    Text("Delete Captain")
                }.alert("Are you sure you want to delete your captain?", isPresented: $showingAlert) {
                    Button("Delete", role: .destructive) {
                        crewVM.deleteCaptain(captain: captain)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                captainName = captain.name ?? ""
                background = captain.background ?? ""
                level = captain.level
                move = captain.move
                fight = captain.fight
                shoot = captain.shoot
                armour = captain.armour
                will = captain.will
                health = captain.health
                currentHealth = captain.currentHealth
                gear = captain.gear ?? ""
                notes = captain.notes ?? ""
                powerArray = crewVM.getCaptainPowerArray(captain: captain)
            }
        }
    }
}

struct EditCaptainView_Previews: PreviewProvider {
    
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
        
        return EditCaptainView(crewVM: CrewViewModel(), captain: sampleCaptain)
    }
}
