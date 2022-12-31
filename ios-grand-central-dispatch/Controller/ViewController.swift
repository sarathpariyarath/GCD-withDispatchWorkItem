//
//  ViewController.swift
//  ios-grand-central-dispatch
//
//  Created by Sarath P on 31/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var animalsArray: [String]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        fetchWholeData()
    }

    func fetchWholeData() {
        APIManagerClass.sharedInstance.sortAnimals(keyword: "") { result in
            
            if result.data.count != 0 {
                
                self.animalsArray = result.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}

