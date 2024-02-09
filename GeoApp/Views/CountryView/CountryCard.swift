//
//  CountryCard.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-16.
//

import SwiftUI

struct CountryCard: View {
    
    var country: Countries // Use the Countries model

        var body: some View {
            ZStack{
                HStack() {
                    Image(country.countryFlag)
                        .resizable()
                        .frame(width: 100, height: 100)

                    VStack(alignment: .leading, spacing: 4) {
                                        Text(country.countryName)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        
                                        Text("Population: \(country.countryPopulation)")
                                            .font(.subheadline)
                                        
                                        Text("Languages: \(country.countryLanguages)")
                                            .font(.subheadline)
                                        
                                        Text("Capital: \(country.countryCapital)")
                                            .font(.subheadline)
                                    }
                    
                    Spacer()
                }
            }
        }
    }

    struct CountryCard_Previews: PreviewProvider {
        static var previews: some View {
            CountryCard(country: Countries(
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
            ))
        }
    }
