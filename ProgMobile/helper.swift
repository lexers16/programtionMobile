//
//  helper.swift
//  ProgMobile
//
//  Created by Alexendre on 20/12/2019.
//  Copyright © 2019 Alexendre. All rights reserved.
//

import Foundation


struct newReleases {
    let artists : Array<NSDictionary>!
    let markets : Array<String>!
    let links : Array<NSDictionary>!
    let id : String!
    let images : Array<NSDictionary>!
    let name : String
    let releaseDate : String
    let type : String
}

struct recommendations {
    let artists : Array<NSDictionary>!
    let links : Array<NSDictionary>!
    let id : String!
    let images : Array<NSDictionary>!
    let name : String
}

struct playlist {
    let description : String!
    let id : String!
    let images : Array<NSDictionary>!
    let name : String
}
