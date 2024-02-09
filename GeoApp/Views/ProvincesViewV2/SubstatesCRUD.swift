//
//  SubstatesCRUD.swift
//  GeoApp
//
//  Created by Paul James on 2023-11-19.
//

import SwiftUI

struct SubstatesCRUD: View {
    
    @ObservedObject var viewModel = GeoAppViewModel()
    @State var substateFlag: String = ""
    @State var substateName: String = ""
    @State var substateType: String = ""
    @State var selectedProvince: String = ""
    @State var substatePopulation: String = "0.01"
    @State var substateLanguages: String = "English"
    
    var body: some View {
        NavigationStack {
            Spacer()
                .navigationTitle("Canadian Substates")
                                .navigationBarTitleDisplayMode(.inline)
                                
            VStack{
                Text("Enter you knowledge on the Canadian substates you know!")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
            }
            
            
            
            VStack {
                List(viewModel.substatesList) { item in
                    ZStack {
                        HStack {
                            HStack {
                                Image("\(item.substateFlag)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                
                                Text("Name: \(item.substateName) \nType: \(item.substateType) \nPopulation: \(item.substatePopulation) M \nLanguage: \(item.substateLanguages)")
                            }
                            
                            Spacer()
                            Spacer()
                            
                            Button(action: {
                                substateFlag = item.substateFlag
                                selectedProvince = item.substateName
                                substateType = item.substateType
                                substatePopulation = item.substatePopulation
                                substateLanguages = item.substateLanguages

                                
                                viewModel.toBeUpdatedSubstate = item
                            }) {
                                Image(systemName: "pencil")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                            Button(action: {
                                viewModel.deleteSubstate(substate: item)
                            }) {
                                Image(systemName: "trash")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                
                Divider()
                
                VStack(spacing: 0) {
                    VStack {
                        Text("Select Substate Name:")
                            .font(.headline)
                        Picker("Substate Name", selection: $selectedProvince) {
                            ForEach(provinces, id: \.self) { province in
                                Text(province)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    VStack {
                        Text("Select Substate Type:")
                            .font(.headline)
                        Picker("Substate Type", selection: $substateType) {
                            Text("Territory").tag("Territory")
                            Text("Province").tag("Province")
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    VStack {
                        Text("Select Substate Language:")
                            .font(.headline)
                        Picker("Substate Language", selection: $substateLanguages) {
                            Text("English").tag("English")
                            Text("French").tag("French")
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    VStack {
                        Text("Substate Population in Millions:")
                            .font(.headline)
                        Slider(value: Binding(get: {
                            Double(substatePopulation) ?? 0.0
                        }, set: {
                            substatePopulation = String(format: "%.2f", $0)
                        }), in: 0.01...20, step: 0.01)
                        Text("Population: \(substatePopulation) M")
                            .font(.caption)
                    }
                    
                    
                    HStack {
                        Button(action: {
                            let substate = SubstateInfo(
                                substateFlag: selectedProvince,
                                substateName: selectedProvince,
                                substateType: substateType,
                                substatePopulation: substatePopulation,
                                substateLanguages: substateLanguages

                            )
                            viewModel.addSubstate(substate: substate)
                            
                        }) {
                            Text("Add new substate")
                                .font(.headline)
                        }
                        .buttonStyle(BorderedButtonStyle())
                        
                        Button(action: {
                            viewModel.toBeUpdatedSubstate.substateFlag = selectedProvince
                            viewModel.toBeUpdatedSubstate.substateName = selectedProvince
                            viewModel.toBeUpdatedSubstate.substateType = substateType
                            viewModel.toBeUpdatedSubstate.substatePopulation = substatePopulation
                            viewModel.toBeUpdatedSubstate.substateLanguages = substateLanguages
                            viewModel.updateSubstate()
                            
                        }) {
                            Text("Update Substate")
                                .font(.headline)
                        }
                        .buttonStyle(BorderedButtonStyle())
                    }
                }
            }
        }
    }
}


struct SubstatesCRUD_Previews: PreviewProvider {
    static var previews: some View {
        SubstatesCRUD()
    }
}
        
let provinces = [
    "Alberta", "British_Columbia", "Manitoba", "New_Brunswick", "Newfoundland_and_Labrador",
    "Nova_Scotia", "Ontario", "Prince_Edward_Island", "Quebec", "Saskatchewan",
    "Northwest_Territories", "Nunavut", "Yukon"
]
        
