//
//  SubstateInfo.swift
//  GeoApp
//
//  Created by Paul James on 2023-11-19.
//

import FirebaseFirestoreSwift

struct SubstateInfo: Identifiable, Codable{
    @DocumentID var id: String?
    var substateFlag: String = ""
    var substateName: String = ""
    var substateType: String = ""
    var substatePopulation: String = ""
    var substateLanguages: String = ""
    var wrappedId: String { id ?? "" } 
    
    init() {
        
    }
    
    init(substateFlag: String,substateName: String,substateType: String,
         substatePopulation: String,substateLanguages: String){
        
        self.substateFlag = substateFlag
        self.substateName = substateName
        self.substateType = substateType
        self.substatePopulation = substatePopulation
        self.substateLanguages = substateLanguages

                
    }
}
