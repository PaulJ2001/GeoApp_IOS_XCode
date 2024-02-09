

//import SwiftUI
import Combine
import CoreGraphics

class GeoAppViewModel : ObservableObject {
    

    @Published var substatesRepo = GeoAppRepository.shared
    @Published var substatesList = [SubstateInfo]()
    @Published var toBeUpdatedSubstate = SubstateInfo()
    @Published var correctAnswers: Int = 0
    @Published var selection = 0
    @Published var showingAnswerSheet = false
    @Published var showStart = true
    @Published var showResults = false
    @Published var showUpdateSubstateView = false


    @Published var result = Result(correct: 0, total: 0, grade: "100%")
 

    @Published var mockQuestions = [
        Question(id: 1, countryFlag: "BraFlag", title: "What is the Capital of Brazil?", answer: "Brasilia", options: ["Sao Paulo","Rio De Janeiro","Brasilia","Salvador"].shuffled()),
        Question(id: 2, countryFlag: "UsaFlag", title: "What is the United States current Population?", answer: "331 million", options: ["321 million","331 million","341 million","351 million"].shuffled()),
        Question(id: 3, countryFlag: "SweFlag", title: "What is Sweden's Official Currency?", answer: "Swedish Krona", options: ["Euro","Swedish Krona","Danish Krone","Norwegian Krone"].shuffled()),
        Question(id: 4, countryFlag: "NicFlag", title: "What Subregion is Nicaragua part of?", answer: "Central America", options: ["South America","Central America","Caribbean","North America"].shuffled()),
        Question(id: 5, countryFlag: "EgyFlag", title: "What is the official language of Egypt?", answer: "Arabic", options: ["Arabic","English","French","Turkish"].shuffled()),
        Question(id: 6, countryFlag: "TaiFlag", title: "Taiwan is a Recognized country by the United Nations", answer: "False", options: ["True","False"].shuffled()),
        Question(id: 7, countryFlag: "MkdFlag", title: "What region is North Macedonia Located in?", answer: "Europe", options: ["Asia","Africa","Americas","Europe"].shuffled()),
        Question(id: 8, countryFlag: "LtuFlag", title: "What is the official Currency of Lithuania?", answer: "Euro", options: ["Litas","Euro","Latvian Lats","Polish Złoty"].shuffled()),
        Question(id: 9, countryFlag: "IndFlag", title: "What is the capital of India?", answer: "New Delhi", options: ["Mumbai","New Delhi","Kolkata","Chennai"].shuffled()),
        Question(id: 10, countryFlag: "BlzFlag", title: "What Country's Flag is this?", answer: "Belize", options: ["Nicaragua","El Salvador","Belize","Bahamas"].shuffled())
    ]

    
    @Published var countries: [Countries] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        // Fetch countries data from the data provider
        self.countries = CountriesDataProvider.getCountries()
        
        self.countries.sort { $0.countryName < $1.countryName }
        
        // Subscribe to changes in substatesRepo
        self.substatesRepo.$list
            .assign(to: \.substatesList, on: self)
            .store(in: &cancellables)
        
        // Print substatesList when it changes
        for substate in self.substatesList {
            print("Substates: \(substate.substateFlag); \(substate.substateName); \(substate.substateType); \(substate.substatePopulation); \(substate.substateLanguages)")
        }
    }
    
    
    func canSubmitQuiz() -> Bool {
        return mockQuestions.filter({$0.selected == nil}).isEmpty
        }
    
    func gradeQuiz() {
        var correct: Int = 0
        for question in mockQuestions {
            if question.answer == question.selected {
                correct += 1
            }
        }
        self.result = Result(correct: Int(correct), total: mockQuestions.count, grade: "\(Int((Double(correct)/Double(mockQuestions.count)) * 100))%")
        
    }
    
    func resetQuiz(){
        self.mockQuestions = mockQuestions.map({Question(id: $0.id, countryFlag: $0.countryFlag, title: $0.title, answer: $0.answer, options: $0.options, selected: nil)})
    }

    
    func incrementCorrectAnswers() {
        correctAnswers += 1
    }
    
    func addSubstate(substate: SubstateInfo){
        substatesRepo.add(substate)
    }
    
    func updateSubstate() {
        substatesRepo.update(toBeUpdatedSubstate)
    }
    

    
    func deleteSubstate(substate: SubstateInfo){
        //todoRepo.delete(todo)
        substatesRepo.delete(substate)
    }
    
}
