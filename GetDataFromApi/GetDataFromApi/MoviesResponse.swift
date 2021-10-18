//
//  MoviesResponse.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 18/10/21.
//

import Foundation

struct MoviesResponse: Codable {
    let status : Int
    let movies : [String]
}
