import SwiftUI

struct QuizAnswerSheet: View {
    @EnvironmentObject var viewModel: GeoAppViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                                Spacer()
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "arrow.left.circle.fill")
                                        .font(.title)
                                        .foregroundColor(Color("AppColor"))
                                        .padding(.trailing, 10)
                                }
                            }
                            .padding(.top, 10)
                Text("Quiz Answer Sheet")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                ForEach(viewModel.mockQuestions) { question in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Question \(question.id): \(question.title)")
                            .font(.headline)
                        
                        Text("Correct Answer: \(question.answer)")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("AppColor")))
                    .padding(.bottom, 10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    QuizAnswerSheet()
}
