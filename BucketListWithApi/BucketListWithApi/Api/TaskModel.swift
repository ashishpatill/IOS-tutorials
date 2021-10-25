//
//  TaskObject.swift
//  BucketListWithApi
//
//  Created by Ashish Pisey on 25/10/21.
//

import Foundation

struct TaskModel : Codable {
    let id : Int
    let objective : String
    let created_at : String
}
