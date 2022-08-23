//
//  LocalService.swift
//  NetworkServiceInterchangeProtocolSwiftUI
//
//  Created by Erge Gevher Akova on 23.08.2022.
//

import Foundation

class LocalService : NetworkService{
    
    var type: String = "LocalService"
    
    func downloadUsers(_ resource: String) async throws -> [User]{
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else{
            fatalError("Resource not found!!!")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
