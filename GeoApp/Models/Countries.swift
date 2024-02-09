//
//  Countries.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-19.
//

import SwiftUI

struct Countries : Identifiable {
    
    var id: String {countryName}
    var countryFlag: String
    var countryName: String
    var countryPopulation: String
    var countryLanguages: String
    var countryCapital: String
    var countryRegion: String
    var countrySubregion: String
    var countryCurrencies: String
    var countryIndependence: String
    var countryUNMembership: String
    var countryWeekStart: String
    
    
    struct CountriesPage: Codable {
        let info: CountriesOtherPage
        let results: [GeoCountry]
    }
    
    
    struct CountriesOtherPage: Codable {
        let count: Int
        let next: String
    }
    
    struct GeoCountry: Codable, Identifiable, Equatable{
        let id = UUID()
        let name: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case url
        }
        
        static var sampleGeoCountry = GeoCountry(name: "Canada", url: "https://restcountries.com/v3.1/name/canada")
    }
    
    struct DetailGeoCountry: Codable {
        let id: Int
        let name: String
        var population: String
        var language: String
        var capital: String
        var region: String
        var subregion: String
        var currency: String
        var independent: String
        var unMember: String
        var weekStart: String
        
        
        
        
        
        
    }
}
