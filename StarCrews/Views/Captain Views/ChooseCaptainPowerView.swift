//
//  ChooseCaptainPowerView.swift
//  StarCrews
//
//  Created by Adam Sadler on 5/27/22.
//

import SwiftUI

struct ChooseCaptainPowerView: View {
    @ObservedObject var crewVM: CrewViewModel
    var captain: Captain
    
    var body: some View {
        List {
            ForEach(SamplePower.preMade, id: \.self) { power in
                NavigationLink {
                    AddCaptainPowerView(crewVM: crewVM, captain: captain, powerName: power.name, category: power.category, notes: power.notes, activation: power.activation, strain: power.strain)
                } label: {
                    Text("\(power.name)")
                }
            }
            NavigationLink {
                AddCaptainPowerView(crewVM: crewVM, captain: captain)
            } label: {
                Text("Custom Power")
            }
        }
        .navigationTitle("Captain Powers")
    }
}

struct ChoosePowerView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let sampleCaptain = Captain(context: context)
        sampleCaptain.name = "Han Solo"
        
        return ChooseCaptainPowerView(crewVM: CrewViewModel(), captain: sampleCaptain)
    }
}
