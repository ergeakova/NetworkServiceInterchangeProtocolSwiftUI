//
//  NetworkService.swift
//  NetworkServiceInterchangeProtocolSwiftUI
//
//  Created by Erge Gevher Akova on 23.08.2022.
//

import Foundation

protocol NetworkService{
    
    func downloadUsers(_ resource: String) async throws -> [User]
    var type: String {get}
}
