//
//  CreateFirstMateView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct CreateFirstMateView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    var crew: Crew
    @State var firstMateName: String = ""
    @State var firstMateBackground: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("First Mate Name")) {
                    TextField("First Mate Name", text: $firstMateName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Background")) {
                    TextField("Background", text: $firstMateBackground)
                        .disableAutocorrection(true)
                }
                Section(footer: Button {
                    crewVM.createFirstMate(crew: crew, firstMateName: firstMateName, firstMateBackground: firstMateBackground)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Create First Mate")
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
        .navigationTitle("Create a First Mate")
    }
}

struct CreateFirstMateView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let sampleCrew = Crew(context: context)
        sampleCrew.name = "The Otters"
        sampleCrew.experience = 32
        sampleCrew.credits = 106
        sampleCrew.shipName = "Bertha 26"
        sampleCrew.shipUpgrades = "Advanced life support, thermal conditioners"
        sampleCrew.shipHold = "Mech suit and plasma artillery"
        
        return CreateFirstMateView(crewVM: CrewViewModel(), crew: sampleCrew)
    }
}
