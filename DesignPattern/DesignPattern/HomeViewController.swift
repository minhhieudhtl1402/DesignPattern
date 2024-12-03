//
//  HomeViewController.swift
//  DesignPattern
//
//  Created by Vu Minh Hieu on 03/12/2024.
//

import UIKit

enum DesignPatterns : CaseIterable {
  ///Fundamental
  case Model_View_Controller
  case Delegation
  case Strategy
  case Singleton
  case Memento
  case Observer
  case Builder
  ///Intermediate
  case Model_View_ViewModel
  case Factory
  case Adapter
  case Iterator
  case Prototype
  case State
  case MulticastDelegate
  case Facade
  ///Advanced
  case Mediator
  case Composite
  case Command
  case ChainOfResponsibility
  case Coordinator
  
  var name : String {
    return String(describing: self)
  }
}
class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch designPatterns[indexPath.row] {
      
    case .Model_View_Controller:
      break
    case .Delegation:
      break
    case .Strategy:
      moveToStrategyScreen()
    case .Singleton:
      break
    case .Memento:
      break
    case .Observer:
      break
    case .Builder:
      break
    case .Model_View_ViewModel:
      break
    case .Factory:
      break
    case .Adapter:
      break
    case .Iterator:
      break
    case .Prototype:
      break
    case .State:
      break
    case .MulticastDelegate:
      break
    case .Facade:
      break
    case .Mediator:
      break
    case .Composite:
      break
    case .Command:
      break
    case .ChainOfResponsibility:
      break
    case .Coordinator:
      break
    }
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    designPatterns.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
    cell.textLabel?.text = designPatterns[indexPath.row].name + " Pattern"
    return cell
  }
  
  @IBOutlet weak var tableView: UITableView!
  let designPatterns : [DesignPatterns] = DesignPatterns.allCases
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
}
//MARK: - Navigation
extension HomeViewController {
  private func moveToStrategyScreen(){
    let vc = StrategyViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}
