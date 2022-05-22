//
//  EditCrewView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/22/22.
//

import SwiftUI

struct EditCrewView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    var crew: Crew
    @State var crewName: String = ""
    @State var shipName: String = ""
    @State var experience: Int64 = 0
    @State var credits: Int64 = 0
    @State var upgrades: String = ""
    @State var shipHold: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Crew Name")) {
                    TextField("Crew Name", text: $crewName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Ship Name")) {
                    TextField("Ship Name", text: $shipName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Crew Details")) {
                    HStack {
                        Text("Experience: ")
                        TextField("Experience", value: $experience, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Credits: ")
                        TextField("Credits", value: $credits, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                }
                Section(header: Text("Ship Upgrades")) {
                    TextEditor(text: $upgrades)
                }
                Section(header: Text("Ship's Hold")) {
                    TextEditor(text: $shipHold)
                }
                Section(footer: Button {
                    crew.name = crewName
                    crew.shipName = shipName
                    crew.experience = experience
                    crew.credits = credits
                    crew.shipUpgrades = upgrades
                    crew.shipHold = shipHold
                    crewVM.saveData()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Update Crew")
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
        .navigationTitle("Update Crew")
        .onAppear {
            DispatchQueue.main.async {
                crewName = crew.name ?? ""
                shipName = crew.shipName ?? ""
                experience = crew.experience
                credits = crew.credits
                upgrades = crew.shipUpgrades ?? ""
                shipHold = crew.shipHold ?? ""
            }
        }
    }
}

struct EditCrewView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let sampleCrew = Crew(context: context)
        sampleCrew.name = "The Otters"
        sampleCrew.experience = 32
        sampleCrew.credits = 106
        sampleCrew.shipName = "Bertha 26"
        sampleCrew.shipUpgrades = "Advanced life support, thermal conditioners"
        sampleCrew.shipHold = "Mech suit and plasma artillery"
        
        return EditCrewView(crewVM: CrewViewModel(), crew: sampleCrew)
    }
}
