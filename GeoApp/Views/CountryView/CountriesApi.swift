import SwiftUI

struct CountriesApi: View {
    @State private var selectedCountry: Countries? // Track the selected country
        @State private var isCountryDetailsViewPresented = false
    @EnvironmentObject var viewModel: GeoAppViewModel


        var body: some View {
            TabView {
                NavigationStack {
                    Spacer()
                        .navigationTitle("Countries")

                    ScrollView(.vertical) {
                        VStack {
                            ForEach(viewModel.countries) { country in
                                CountryCard(country: country)
                                    .onTapGesture {
                                        selectedCountry = country
                                        isCountryDetailsViewPresented.toggle()
                                    }
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $isCountryDetailsViewPresented) {
                if let selectedCountry = selectedCountry {
                    CountryDetailsView(country: selectedCountry)
                }
            }
        }
    }

    struct CountriesApi_Previews: PreviewProvider {
        static var previews: some View {
            CountriesApi()
        }
    }
