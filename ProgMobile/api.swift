//
//  api.swift
//  ProgMobile
//
//  Created by Alexendre on 13/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import Foundation
import Alamofire

var appKey : String!

class apiLooker {
    
    func getArtists (completion: @escaping (NSDictionary)->()) {
        let headers: HTTPHeaders = [
          "Authorization":"Bearer \(appKey!)"
        ]
        AF.request("https://api.spotify.com/v1/browse/new-releases", headers: headers)
            .responseJSON { response in
                
                switch response.result {

                case .success(let json):
                    let JSON = json as? NSDictionary
                    let id = JSON!["albums"] as? NSDictionary
                    
                        completion(id!)
                    
                case .failure(let error):
                    print(error)
                }
                }
    }
    
    func getToken (completion: @escaping (Bool)->()) {
        let headers: HTTPHeaders = [
          "Authorization":"Basic NmY4YzJlODczM2RkNDYxMzlkNDk1NTU2OWM1ZTM4YjY6NDAxNDhkN2M2NDkwNDNlNTlhOTM0MmZhZTEzMDRjMjY="
        ]
        AF.request("https://accounts.spotify.com/api/token", method: .post, parameters: ["grant_type": "client_credentials"], headers: headers)
            .responseJSON { response in
            
            switch response.result {

            case .success(let json):
                let JSON = json as? NSDictionary
                appKey = JSON!["access_token"] as! String
                
                    completion(true)
                
            case .failure(let error):
                print(error)
            }
            }
    }
}
