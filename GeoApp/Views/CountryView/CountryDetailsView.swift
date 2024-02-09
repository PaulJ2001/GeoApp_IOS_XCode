import SwiftUI

struct CountryDetailsView: View {
    let country: Countries
    
    var body: some View {
        
        VStack {
            Image("\(country.countryFlag)")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            Text(country.countryName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            VStack(alignment: .leading, spacing: 8) {
                Text("Population: \(country.countryPopulation)")
                Text("Languages: \(country.countryLanguages)")
                Text("Capital: \(country.countryCapital)")
                Text("Region: \(country.countryRegion)")
                Text("Subregion: \(country.countrySubregion)")
                Text("Currencies: \(country.countryCurrencies)")
                Text("Independence: \(country.countryIndependence)")
                Text("UN Membership: \(country.countryUNMembership)")
                Text("Week Start: \(country.countryWeekStart)")
            }
            .frame(alignment: .center)
            .padding()
            
            .padding()
        }
        
    }
}
    struct CountryDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            let sampleCountry = Countries(
                countryFlag: "CanFlag",
                countryName: "Canada",
                countryPopulation: "38.25 Million",
                countryLanguages: "English|French",
                countryCapital: "Ottawa",
                countryRegion: "Americas",
                countrySubregion: "North America",
                countryCurrencies: "Canadian Dollar",
                countryIndependence: "Independent",
                countryUNMembership: "UN Member",
                countryWeekStart: "Sunday"
            )
            return CountryDetailsView(country: sampleCountry)
        }
    }
    

