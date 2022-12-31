//
//  VC + TableViewDelegate.swift
//  ios-grand-central-dispatch
//
//  Created by Sarath P on 31/12/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animalsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell",for: indexPath)
        cell.textLabel?.text = animalsArray?[indexPath.row] ?? "-"
        return cell
    }
    
    
}

