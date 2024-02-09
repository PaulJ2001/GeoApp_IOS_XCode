//
//  QuizResult.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-05.
//

import SwiftUI

struct QuizResult: View {
    @EnvironmentObject var viewModel: GeoAppViewModel
    @Environment(\.dismiss) var dismiss
    @State var result: Result
    
        var body: some View {
            
            VStack {
                       Spacer()
                       
                       Text("Geo Quiz Results")
                           .font(.largeTitle)
                           .padding(.bottom, 20)
                       
                       Text("You have completed the quiz.\nHere are your results:")
                           .font(.title)
                           .multilineTextAlignment(.center)
                           .padding(.horizontal, 20)
                           .padding(.bottom, 40)
                       
                       Image("quizIcon")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 150, height: 150)
                           .padding(.bottom, 40)
                       
                       Text("\(result.correct) out of \(result.total)")
                           .font(.title)
                           .fontWeight(.bold)
                           .padding(.bottom, 20)
                
                       Text(result.grade)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                       
                       Button(action: {
                           viewModel.resetQuiz()
                           viewModel.showStart = true
                           dismiss()
                       }) {
                           Text("Retake Quiz")
                               .fontWeight(.bold)
                               .font(.title)
                               .foregroundColor(.white)
                               .padding()
                               .frame(width: 200)
                               .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                                   .fill(Color("AppColor"))
                               )
                       }
                
                Text("View Answer Sheet")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color("AppColor"))
                                .padding()
                                .onTapGesture {
                                    viewModel.showingAnswerSheet = true
                                }
                                .fullScreenCover(isPresented: $viewModel.showingAnswerSheet) {
                                    QuizAnswerSheet()
                                }
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
//
/*
    struct QuizResults_Previews: PreviewProvider {
        static var previews: some View {
            // You can preview both the success and failure states for the quiz results.
            //QuizResults(isPassed: true)
            //QuizResults(isPassed: false)
        }
    }
*/
