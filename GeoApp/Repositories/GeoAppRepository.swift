//
//  GeoAppRepository.swift
//  GeoApp
//
//  Created by Paul James on 2023-11-19.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class GeoAppRepository: ObservableObject {
    
    
    static var shared = GeoAppRepository()
    
    @Published var list: [SubstateInfo] = []
    
    private let path = "Substates"
    private let store = Firestore.firestore()
    
    init(){
        get()
    }
    
    
    func get(){
        store.collection(path).addSnapshotListener {
            snapshot, error in
            if let error = error {
                print(error)
                return
            }
            self.list = snapshot?.documents.compactMap {
                try? $0.data(as: SubstateInfo.self)
            } ?? []
            print(self.list)
        }
    }
    
    func add(_ substatesInfo: SubstateInfo){
        
        do{
            _ = try store.collection(path).addDocument(from: substatesInfo)
        }
        catch{
            fatalError("Adding a substate failed")
        }
    }
    
    func update(_ substatesInfo: SubstateInfo) {
        if let documentId = substatesInfo.id {
            store.collection(path).document(documentId).setData(["substateFlag": substatesInfo.substateFlag, "substateName": substatesInfo.substateName,"substateType": substatesInfo.substateType,"substatePopulation": substatesInfo.substatePopulation,"substateLanguages": substatesInfo.substateLanguages], merge:  true)
        }
    }
    
    
    func delete(_ substatesInfo: SubstateInfo){
        if let documentId = substatesInfo.id {
            store.collection(path).document(documentId).delete {
                error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}
