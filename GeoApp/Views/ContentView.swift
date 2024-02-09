//
//  ContentView.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: GeoAppViewModel
    @State private var isDarkMode = false
    var body: some View {
        VStack {
            Toggle("", isOn: $isDarkMode)
                .padding()
                .onChange(of: isDarkMode) { _ in
                    // Toggle between light and dark mode based on user selection
                    UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                }
            TabView{
                NavigationStack{
                    HStack(alignment: .center){
                        
                        Image("Globe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 550)
                        
                    }
                    
                    .navigationTitle("Paul's GeoApp")
                    
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading){
                            
                            
                        }
                    }
                    
                }
                
                .tabItem() {
                    Label("Home", systemImage: "globe.desk")
                    //Text("Tab 1")
                }
                
                CountriesApi()
                    .tabItem() {
                        Label("Countries", systemImage: "globe.americas")
                        
                    }
                QuizContentView()
                    .tabItem() {
                        Label("Quiz", systemImage: "graduationcap")
                        //Text("Quiz")
                        
                    }
                SubstatesCRUD()
                    .tabItem() {
                        Label("Substates", systemImage: "mountain.2")
                        //Text("Terrirories")
                    }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            
        }
        
        .padding()
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
