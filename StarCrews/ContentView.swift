//
//  ContentView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/21/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Crew.name, ascending: true)],
        animation: .default)
    private var crews: FetchedResults<Crew>

    var body: some View {
        NavigationView {
            List {
                ForEach(crews) { crew in
                    NavigationLink {
                        CrewDetailView(crewVM: CrewViewModel(), crew: crew)
                    } label: {
                        Text(crew.name!)
                    }
                }
                .onDelete(perform: deleteCrew)
            }
            .navigationTitle("Your Crews")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        CreateCrewView(crewVM: CrewViewModel())
                    } label: {
                        Text("Create a Crew")
                    }

                }
            }
        }.navigationViewStyle(.stack)
        
    }

    private func deleteCrew(offsets: IndexSet) {
        withAnimation {
            offsets.map { crews[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
