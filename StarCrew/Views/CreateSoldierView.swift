//
//  CreateSoldierView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct CreateSoldierView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    var crew: Crew
    @State var soldierName: String = ""
    @State var soldierType: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Soldier Name")) {
                    TextField("Soldier Name", text: $soldierName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Soldier Type")) {
                    TextField("Soldier Type", text: $soldierType)
                        .disableAutocorrection(true)
                }
                Section(footer: Button {
                    crewVM.recruitSoldier(crew: crew, soldierName: soldierName, soldierType: soldierType)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Recruit Soldier")
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
        .navigationTitle("Recruit a Soldier")
    }
}

struct CreateSoldierView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let sampleCrew = Crew(context: context)
        sampleCrew.name = "The Otters"
        sampleCrew.experience = 32
        sampleCrew.credits = 106
        sampleCrew.shipName = "Bertha 26"
        sampleCrew.shipUpgrades = "Advanced life support, thermal conditioners"
        sampleCrew.shipHold = "Mech suit and plasma artillery"
        
        return CreateSoldierView(crewVM: CrewViewModel(), crew: sampleCrew)
    }
}
