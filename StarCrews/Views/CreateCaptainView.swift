//
//  CreateCaptainView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct CreateCaptainView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    var crew: Crew
    @State var captainName: String = ""
    @State var captainBackground: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Captain Name")) {
                    TextField("Captain Name", text: $captainName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Background")) {
                    TextField("Background", text: $captainBackground)
                        .disableAutocorrection(true)
                }
                Section(footer: Button {
                    crewVM.createCaptain(crew: crew, captainName: captainName, captainBackground: captainBackground)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Create Captain")
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
        .navigationTitle("Create a Captain")
    }
}

struct CreateCaptainView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let sampleCrew = Crew(context: context)
        sampleCrew.name = "The Otters"
        sampleCrew.experience = 32
        sampleCrew.credits = 106
        sampleCrew.shipName = "Bertha 26"
        sampleCrew.shipUpgrades = "Advanced life support, thermal conditioners"
        sampleCrew.shipHold = "Mech suit and plasma artillery"
        
        return CreateCaptainView(crewVM: CrewViewModel(), crew: sampleCrew)
    }
}
