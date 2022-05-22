//
//  CrewListView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI

struct CrewDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var crewVM: CrewViewModel
    @State var crew: Crew
    @State var soldierArray: [Soldier] = []
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Captain.name, ascending: true)],
        animation: .default)
    private var captains: FetchedResults<Captain>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FirstMate.name, ascending: true)],
        animation: .default)
    private var firstMates: FetchedResults<FirstMate>
    
    var body: some View {
        VStack {
            ScrollView (showsIndicators: false) {
                HStack {
                    VStack (alignment: .leading, spacing: 10) {
                        NavigationLink {
                            EditCrewView(crewVM: CrewViewModel(), crew: crew)
                        } label: {
                            Text("Update Crew Info")
                                .bold()
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
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
                    Divider()
                    
                    if crew.captain == nil {
                        NavigationLink {
                            CreateCaptainView(crewVM: CrewViewModel(), crew: crew)
                        } label: {
                            Text("Add Captain")
                                .bold()
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }

                    } else {
                        CaptainListView(captain: crew.captain!)
                        HStack {
                            Spacer()
                            NavigationLink {
                                EditCaptainView(crewVM: CrewViewModel(), captain: crew.captain!)
                            } label: {
                                Text("Update Captain")
                                    .bold()
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                            }
                            Spacer()
                        }
                    }
                    Divider()
                    
                    if crew.firstMate == nil {
                        NavigationLink {
                            CreateFirstMateView(crewVM: CrewViewModel(), crew: crew)
                        } label: {
                            Text("Add First Mate")
                                .bold()
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }

                    } else {
                        FirstMateListView(firstMate: crew.firstMate!)
                        Divider()
                    }
                    
                    ForEach(soldierArray, id: \.self) { soldier in
                        SoldierListView(soldier: soldier)
                        Divider()
                    }
                    
                    if soldierArray.count < 8 {
                        NavigationLink {
                            CreateSoldierView(crewVM: crewVM, crew: crew)
                        } label: {
                            Text("Recruit Soldier")
                                .bold()
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }

                    }
                }
            }
        }
        .padding()
        .navigationTitle("\(crew.name!)")
        .onAppear {
            DispatchQueue.main.async {
                soldierArray = crewVM.getSoldierArray(crew: crew)
            }
        }
    }
}

struct CrewListView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let sampleCrew = Crew(context: context)
        let sampleSoldier = Soldier(context: context)
        sampleCrew.name = "The Otters"
        sampleCrew.experience = 32
        sampleCrew.credits = 106
        sampleCrew.shipName = "Bertha 26"
        sampleCrew.shipUpgrades = "Advanced life support, thermal conditioners"
        sampleCrew.shipHold = "Mech suit and plasma artillery"
        sampleSoldier.name = "Bucky"
        sampleSoldier.type = "Tech"
        sampleCrew.addToSoldiers(sampleSoldier)
        
        return CrewDetailView(crewVM: CrewViewModel(), crew: sampleCrew)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
