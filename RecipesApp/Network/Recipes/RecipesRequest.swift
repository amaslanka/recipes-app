//
//  RecipesRequest.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 28/02/2021.
//

import Foundation

class RecipesRequest: APIRequest {
    var method = RequestType.GET
    var path = "search"
    var parameters = [String: String]()

    init() { }
    
    init(title: String) {
        parameters["q"] = title
    }
}
