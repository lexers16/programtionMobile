//
//  customTableViewCell.swift
//  ProgMobile
//
//  Created by Alexendre on 20/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    var collection : FlowViewController!
    var data : NSArray!
    var numberOfRow = 0
    let api = apiLooker()
    var type = ""
    var newReleaseData : [newReleases]!
    var newRecommendations : [recommendations]!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionView(type : String){
        self.type = type
        
        
                switch type {
                case "Recommandations":
                    api.getRecommendations { (response) in
                        print(response)
                        self.newRecommendations = response
                        self.numberOfRow = response.count
                        self.collection = FlowViewController(frame: self.bounds, inputType: "newReleases")
                        self.collection.collectionView.delegate = self
                        self.collection.collectionView.dataSource = self
                        self.addSubview(self.collection.view)
                        self.collection.collectionView.reloadData()
        //                self.dataDict = response
                    }
                    break
                case "newReleases":
                    api.getNewReleases { (response) in
                        print(response)
                        self.newReleaseData = response
                        self.numberOfRow = response.count
                        self.collection = FlowViewController(frame: self.bounds, inputType: "newReleases")
                        self.collection.collectionView.delegate = self
                        self.collection.collectionView.dataSource = self
                        self.addSubview(self.collection.view)
                        self.collection.collectionView.reloadData()
        //                self.dataDict = response
                    }
                        break
                case "categories":
        //            api.getNewReleases { (response) in
        //                print(response)
        //                self.dataDict = response
        //            }
                    break
                default:
                    break
                }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfRow
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! customCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        print(indexPath)
       
        cell.backgroundColor = UIColor.green
        
                switch type {
                case "Recommandations":
                    cell.setData(Image: ((newRecommendations[indexPath.row].images.first)!.value(forKey: "url"))! as! String, name: newRecommendations[indexPath.row].name)
                    break
                case "newReleases":
                     cell.setData(Image: ((newReleaseData[indexPath.row].images.first)!.value(forKey: "url"))! as! String, name: newReleaseData[indexPath.row].name)
                        
                        break
                case "categories":
                    break
                default:
                    break
                }
        return cell
    }

}
