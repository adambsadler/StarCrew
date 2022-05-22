//
//  EditCaptainPowerView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/22/22.
//

import SwiftUI

struct EditPowerView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    @ObservedObject var power: Power
    @State var powerName: String = ""
    @State var category: String = ""
    @State var notes: String = ""
    @State var activation: Int64 = 0
    @State var strain: Int64 = 0
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Power Name")) {
                    TextField("Power Name", text: $powerName)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Category")) {
                    TextField("Category", text: $category)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Power Details")) {
                    HStack {
                        Text("Activation: ")
                        TextField("Activation", value: $activation, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Strain: ")
                        TextField("Strain", value: $strain, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $notes)
                }
                Section(footer: Button {
                    // After updating a power, when going back to detail view without updating captain, the data isn't udpated in CaptainListView
                    DispatchQueue.main.async {
                        power.name = powerName
                        power.category = category
                        power.activation = activation
                        power.strain = strain
                        power.notes = notes
                        crewVM.saveData()
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Update Power")
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
        .navigationTitle("Update Power")
        .toolbar {
            ToolbarItem {
                Button {
                    showingAlert = true
                } label: {
                    Text("Delete Power")
                }.alert("Are you sure you want to delete this power?", isPresented: $showingAlert) {
                    Button("Delete", role: .destructive) {
                        crewVM.deletePower(power: power)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                powerName = power.name ?? ""
                category = power.category ?? ""
                activation = power.activation
                strain = power.strain
                notes = power.notes ?? ""
            }
        }
    }
}

struct EditCaptainPowerView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let samplePower = Power(context: context)
        samplePower.name = "Hip shot"
        samplePower.activation = 12
        samplePower.strain = 2
        samplePower.category = "Line of sight"
        samplePower.notes = "Quickly draw your blaster and shoot an enemy."
        
        return EditPowerView(crewVM: CrewViewModel(), power: samplePower)
    }
}
