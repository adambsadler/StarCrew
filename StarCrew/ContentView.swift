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
            .navigationViewStyle(.stack)
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        CreateCrewView(crewVM: CrewViewModel())
                    } label: {
                        Text("Create a Crew")
                    }

                }
            }
        }
        
    }

    private func addCrew() {
        withAnimation {
            let newCrew = Crew(context: viewContext)
            newCrew.name = "New Crew"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteCrew(offsets: IndexSet) {
        withAnimation {
            offsets.map { crews[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
