//
//  JoeBastianichService.swift
//  DesignPattern
//
//  Created by Vu Minh Hieu on 03/12/2024.
//

import Foundation

class JoeBastianichService : NameRatingService {
  var name: String = "JoeBastianichService"
  
  func rate(name: String, completion: @escaping (Bool, String) -> Void) {
    let isConnectionOK = true
    guard isConnectionOK else {completion(false,"Connection is lost")}
    DispatchQueue.main.asyncAfter(deadline: .now() + 5){
      completion(true,"\(String(describing: self)) rating... \n \(name) has scored 100 points")
    }
  }
  
  
}
