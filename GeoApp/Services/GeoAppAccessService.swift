//
//  GeoAppAccessService.swift
//  GeoApp
//
//  Created by Paul James on 2023-11-19.
//

import Foundation
//
//class GeoAppAccessService {
//    
//    
//    func getGeoCountries(completion:@escaping ([GeoCountry]) -> () ){
//        //fetching url;
//        Bundle.main.fetchData(url: "https://restcountries.com/v3.1/all", model: CountriesPage.self) {
//            data in
//            //create new  object
//            //Inside the closure, a new array of objects is created. It seems that the data object contains a property called results, which is used to initialize the array. The assumption here is that the data.results contains a list of data in some form.
//            let GeoState: [GeoCountry] = data.results
//            //pass the array object in the completion handler
//            completion(GeoState)
//            //error handler
//        } failure: { error in
//            print(error)
//            
//        }
//    }
//    
//    func getDetailsGeoState(id: Int, _ completion:@escaping (Detail) -> () ){
//        Bundle.main.fetchData(url: "https://rickandmortyapi.com/api/character/\(id)/", model: DetailRandMChar.self) {
//            data in
//            completion(data)
//        } failure: { error in
//            print(error)
//        }
//    }
//
//}
//     
//}
//
