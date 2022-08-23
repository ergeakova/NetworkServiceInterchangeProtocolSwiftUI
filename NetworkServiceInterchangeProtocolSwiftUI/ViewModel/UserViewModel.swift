//
//  UserViewModel.swift
//  NetworkServiceInterchangeProtocolSwiftUI
//
//  Created by Erge Gevher Akova on 23.08.2022.
//

import Foundation

class UserListViewModel: ObservableObject{
    
    @Published var userList = [UserViewModel]()
    
    private var service: NetworkService
    
    init(service: NetworkService){
        self.service = service
    }
    
    func downloadUsers() async{
        var resource = ""
        if service.type == "WebService" {
            resource = Constants.urls.usersExtension
        }else{
            resource = Constants.Paths.userPath
        }
        
        do{
            let users = try await service.downloadUsers(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch{
            print(error.localizedDescription)
        }
        
    }
}



struct UserViewModel{
    let user: User
    var id: Int {
        user.id
    }
    var name: String{
        user.name
    }
    var username: String{
        user.username
    }
    var email: String{
        user.email
    }
}
