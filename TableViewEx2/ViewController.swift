//
//  ViewController.swift
//  TableViewEx2
//
//  Created by kakao on 2022/01/07.
//

import UIKit

enum FoodType: Int {
    case American
    case Chinese
    case Korean
    case Japanese

    func foodTypeName() -> String {
        switch self {
        case .American: return "American"
        case .Chinese: return "Chinese"
        case .Korean: return "Korean"
        case .Japanese: return "Japanese"
        }
    }
    
}

struct Food {
    let name: String
    var price: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    
    //let data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let s = FoodType(rawValue: section) else {
            return 0
        }
        return menu[s]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        if let s = FoodType(rawValue: indexPath.section) {
            let food = menu[s]?[indexPath.row].name ?? ""
            cell.myLabel.text = "\(food)"
        }
     
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let s = FoodType(rawValue: section)
        return s?.foodTypeName()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
    }


}

