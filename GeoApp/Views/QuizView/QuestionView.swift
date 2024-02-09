//
//  QuestionView.swift
//  GeoApp
//
//  Created by Paul James on 2023-11-30.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: Question
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                    Text("Question #\(question.id):")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    Text(question.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    
                    Image(question.countryFlag)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    ForEach(question.options, id: \.self) { option in
                        HStack {
                            Button {
                                question.selected = option
                                print(option)
                            } label: {
                                if question.selected == option {
                                    Circle()
                                        .shadow(radius: 3)
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(Color("AppColor"))
                                } else {
                                    Circle()
                                        .stroke()
                                        .shadow(radius: 3)
                                        .frame(width: 24, height: 24)
                                }
                            }
                            Text(option)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .frame(minWidth: 300, idealWidth: 350)
                .frame(width: 330, height: 500)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(30)

            }
        }

//#Preview {
//    QuestionView()
//}
