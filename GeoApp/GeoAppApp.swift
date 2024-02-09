//
//  GeoAppApp.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-02.
//

import SwiftUI
import Firebase

@main
struct GeoAppApp: App {
    
    @StateObject var viewModel: GeoAppViewModel = GeoAppViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            
            
        }
    }
}
