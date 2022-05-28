//
//  ChooseFirstMatePowerView.swift
//  StarCrews
//
//  Created by Adam Sadler on 5/27/22.
//

import SwiftUI

struct ChooseFirstMatePowerView: View {
    @ObservedObject var crewVM: CrewViewModel
    var firstMate: FirstMate
    
    var body: some View {
        List {
            ForEach(SamplePower.preMade, id: \.self) { power in
                NavigationLink {
                    AddFirstMatePowerView(crewVM: crewVM, firstMate: firstMate, powerName: power.name, category: power.category, notes: power.notes, activation: power.activation, strain: power.strain)
                } label: {
                    Text("\(power.name)")
                }
            }
            NavigationLink {
                AddFirstMatePowerView(crewVM: crewVM, firstMate: firstMate)
            } label: {
                Text("Custom Power")
            }
        }
        .navigationTitle("First Mate Powers")
    }
}

struct ChooseFirstMatePowerView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let sampleFirstMate = FirstMate(context: context)
        sampleFirstMate.name = "Han Solo"
        
        return ChooseFirstMatePowerView(crewVM: CrewViewModel(), firstMate: sampleFirstMate)
    }
}
