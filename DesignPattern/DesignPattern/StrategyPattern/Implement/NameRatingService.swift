//
//  NameRatingService.swift
//  DesignPattern
//
//  Created by Vu Minh Hieu on 03/12/2024.
//

import Foundation

protocol NameRatingService {
  var name : String {get}
  func rate(name : String,completion : @escaping (_ success : Bool,_ message : String) -> Void)
}
