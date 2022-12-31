//
//  VC + SearchBar Extensions.swift
//  ios-grand-central-dispatch
//
//  Created by Sarath P on 31/12/22.
//

import Foundation
import UIKit


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APIManagerClass.sharedInstance.sortAnimals(keyword: searchText) { result in
            if result.data.count != 0 {
                self.animalsArray = result.data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
