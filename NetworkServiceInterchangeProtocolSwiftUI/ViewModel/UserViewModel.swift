//
//  UserViewModel.swift
//  NetworkServiceInterchangeProtocolSwiftUI
//
//  Created by Erge Gevher Akova on 23.08.2022.
//

import Foundation

class UserListViewModel: ObservableObject{
    
    @Published var userList = [UserViewModel]()
    
    let webService = WebService()
    
    func downloadUsers() async{
        do{
            let users = try await webService.downloadUsers(Constants.urls.usersExtension)
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
