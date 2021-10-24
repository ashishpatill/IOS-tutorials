//
//  Task.swift
//  GetDataFromApi
//
//  Created by Ashish Pisey on 24/10/21.
//

import Foundation
/*
 
 {
         "id": 122,
         "objective": "Rayan x11",
         "created_at": "2021-10-23T22:13:04.289117Z"
     }
 
 */

struct TaskObject : Codable {
    let id : Int
    let objective : String
    let created_at : String
}
