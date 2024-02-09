//
//  QuizHome.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-05.
//

import SwiftUI

struct QuizHome: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: GeoAppViewModel
    
    var body: some View {
        
        TabView{

                VStack{
                    
                    Text("Geo Quiz")
                        .font(.largeTitle)
                        .frame(alignment: .leading)
                    Spacer()

                    Text("Test your Knowledge on the Nations of the World!")
                        .font(.title)
                        .frame(alignment: .center)
                    Spacer()
                    
                    Image("quizIcon")
                    
                    Spacer()
                    
                    Button{ 
                        dismiss()

                        
                    } label:{  Text("Begin Quiz")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color("AppColor"))
                        .clipShape(Capsule())
                    }

                .padding(.top)
            }
        
        }
    }

struct QuizHome_Previews: PreviewProvider {
    static var previews: some View {
        QuizHome()
    }
}
