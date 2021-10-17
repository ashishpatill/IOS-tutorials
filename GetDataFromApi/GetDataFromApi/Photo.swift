//
//  Photo.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 17/10/21.
//

import UIKit

struct Photo: Codable {
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
}

