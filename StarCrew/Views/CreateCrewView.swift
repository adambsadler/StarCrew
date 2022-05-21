//
//  CreateCrewView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct CreateCrewView: View {
    @Environment(\.presentationMode) var presentationMode
    var crewVM: CrewViewModel
    @State var crewName: String = ""
    @State var shipName: String = ""
    
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
                
            }
            
            
            Button {
                crewVM.createCrew(name: crewName, shipName: shipName)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Create Crew")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding(.vertical, 25)
            }
        }
        .navigationTitle("Create a New Crew")
    }
}

struct CreateCrewView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCrewView(crewVM: CrewViewModel())
    }
}
