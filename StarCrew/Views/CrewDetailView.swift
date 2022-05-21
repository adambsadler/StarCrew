//
//  CrewListView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct CrewDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var crew: Crew
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    Text("Ship Name: ")
                        .bold()
                    Text("\(crew.shipName ?? "No name")")
                        .font(.title)
                }
                Spacer()
                VStack (alignment: .trailing, spacing: 10) {
                    Text("Experience:")
                        .bold()
                    Text("\(crew.experience)")
                        .font(.title)
                    Text("Credits:")
                        .bold()
                    Text("\(crew.credits)")
                        .font(.title)
                }
            }
            .padding(.bottom)
            ScrollView {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Ship Upgrades:")
                            .bold()
                        Spacer()
                    }
                    Text("\(crew.shipUpgrades ?? "")")
                    HStack {
                        Text("Ship's Hold:")
                            .bold()
                        Spacer()
                    }
                    Text("\(crew.shipHold ?? "")")
                    
                    if crew.captain == nil {
                        Button {
                            
                        } label: {
                            Text("Add Captain")
                                .bold()
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .cornerRadius(15)
                        }

                    } else {
                        CaptainListView(captain: crew.captain!)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("\(crew.name!)")
    }
}

struct CrewListView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let sampleCrew = Crew(context: context)
        sampleCrew.name = "The Otters"
        sampleCrew.experience = 32
        sampleCrew.credits = 106
        sampleCrew.shipName = "Bertha 26"
        sampleCrew.shipUpgrades = "Advanced life support, thermal conditioners"
        sampleCrew.shipHold = "Mech suit and plasma artillery"
        
        return CrewDetailView(crew: sampleCrew)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
