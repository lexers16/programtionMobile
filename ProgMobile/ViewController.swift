//
//  ViewController.swift
//  ProgMobile
//
//  Created by Alexendre on 13/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var newReleasesData = Array<newReleases>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.tableView.register(customTableViewCell.self, forCellReuseIdentifier: "myCell")
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.isEditing = false
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! customTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        switch indexPath.row {
            case 0:
                cell.setCollectionView(type : "newReleases")
//                let FloWView = FlowViewController(frame: cell.bounds, inputType :"artist")
//                cell.addSubview(FloWView.view)
            break
            case 1:
                cell.setCollectionView(type : "Recommandations")
//                let FloWView = FlowViewController(frame: cell.bounds, inputType :"newReleases")
////                FloWView.collectionView.reloadData()
//                cell.addSubview(FloWView.view)
                break
            case 2:
//                let FloWView = FlowViewController(frame: cell.bounds, inputType :"categories")
////                FloWView.collectionView.reloadData()
//                cell.addSubview(FloWView.view)
                break
            default:
                 cell.backgroundColor = themeColor
                 break
            }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return self.view.frame.height / 3
        case 1:
            return self.view.frame.height / 3
        case 2:
            return self.view.frame.height
        default:
             return self.view.frame.height
        }
    }
}

