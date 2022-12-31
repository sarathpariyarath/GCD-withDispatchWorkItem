//
//  ViewController.swift
//  ios-grand-central-dispatch
//
//  Created by Sarath P on 31/12/22.
//

import UIKit







class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APIManagerClass.sharedInstance.sortAnimals(keyword: searchText) { result in
            print(result)
        }
    }
}
