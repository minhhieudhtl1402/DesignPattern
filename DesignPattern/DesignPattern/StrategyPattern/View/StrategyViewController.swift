//
//  StrategyViewController.swift
//  DesignPattern
//
//  Created by Vu Minh Hieu on 03/12/2024.
//

import UIKit
enum NameRating : CaseIterable {
  case GordonRamsey
  case AaronSanchez
  case JoeBastianich
  
  var name : String {
    return String(describing: self)
  }
}
class StrategyViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var nameTextField: UITextField!
  
  let nameRatingServices : [NameRating] = NameRating.allCases
  private var namingSerive : NameRatingService?
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  @IBAction func ratingButtonTapped(_ sender: Any) {
    guard let name = nameTextField.text,
          let chosingIndexPath = tableView.indexPathForSelectedRow
    else {return}
    let nameStrategy = nameRatingServices[chosingIndexPath.row]
    switch nameStrategy {
    case .GordonRamsey:
      namingSerive = GordonRamsayRating()
    case .AaronSanchez:
      namingSerive = AaronSanchezRating()
    case .JoeBastianich:
      namingSerive = JoeBastianichService()
    }
    namingSerive?.rate(name: name, completion: { [weak self] success, message in
      guard let strongSelf = self else {return}
      if success {
        let alert = UIAlertController(title: "Rating...", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
          alert.dismiss(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
          alert.dismiss(animated: true)
        }))
        alert.modalTransitionStyle = .coverVertical
        alert.modalPresentationStyle = .overFullScreen
        strongSelf.present(alert,animated: true)
      }
    })
  }
  
  
}

extension StrategyViewController : UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return nameRatingServices.count  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = nameRatingServices[indexPath.row]
      .name
    return cell
  }
  
  
}
