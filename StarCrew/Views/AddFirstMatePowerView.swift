//
//  AddFirstMatePowerView.swift
//  StarCrew
//
//  Created by Adam Sadler on 5/22/22.
//

import SwiftUI

struct AddFirstMatePowerView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var crewVM: CrewViewModel
    var firstMate: FirstMate
    @State var powerName: String = ""
    @State var category: String = ""
    @State var notes: String = ""
    @State var activation: Int64 = 0
    @State var strain: Int64 = 0
    
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
                    }
                    HStack {
                        Text("Strain: ")
                        TextField("Strain", value: $strain, formatter: NumberFormatter())
                    }
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $notes)
                }
                Section(footer: Button {
                    DispatchQueue.main.async {
                        crewVM.addPowerToFirstMate(firstMate: firstMate, name: powerName, category: category, notes: notes, activation: activation, strain: strain)
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add Power")
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
        .navigationTitle("Add a Power")
    }
}

struct AddFirstMatePowerView_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        let sampleFirstMate = FirstMate(context: context)
        sampleFirstMate.name = "Han Solo"
        
        return AddFirstMatePowerView(crewVM: CrewViewModel(), firstMate: sampleFirstMate)
    }
}
