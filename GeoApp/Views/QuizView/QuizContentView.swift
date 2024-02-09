//
//  QuizContentView.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-16.
//

import SwiftUI

struct QuizContentView: View {
    
    @EnvironmentObject var viewModel: GeoAppViewModel
    @State private var isSubmitPressed: Bool = false
    
    
    var body: some View {
        
        TabView(selection: $viewModel.selection){
            ForEach(
                viewModel.mockQuestions.indices, id: \.self) {
                    index in
                    VStack{
                        Spacer()
                        QuestionView(question: $viewModel.mockQuestions[index])
                        Spacer()
                        if let lastQuestion = viewModel.mockQuestions.last,
                           lastQuestion.id == viewModel.mockQuestions[index].id{
                                                            Button{
                                                                print(viewModel.gradeQuiz())
                                                                viewModel.gradeQuiz()
                                                                viewModel.showResults = true
                                                                viewModel.selection = 0
                                                            } label: {
                                                                Text("Submit")
                                                                    .padding()
                                                                    .foregroundColor(.white)
                                                                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                                        .fill(Color("AppColor"))
                                                                        .frame(width: 300)
                                                                        //.frame(maxWidth: .infinity)
                                                                    )
                                                            }
                                    .buttonStyle(.plain)
                                    .disabled(!viewModel.canSubmitQuiz())
                                  
                                        
                                        
                                    }
                            }
                    .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    //.padding(.horizontal, 20) // Add padding to the entire TabView
                    .fullScreenCover(isPresented: $viewModel.showStart){
                        QuizHome()
                    }
                    .fullScreenCover(isPresented: $viewModel.showResults){
                        QuizResult(result: viewModel.result)
                    }
        
                }
        }
   // }
    
//}
struct QuizContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizContentView()
    }
}
