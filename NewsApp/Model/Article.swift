//
//  Article.swift
//  NewsApp
//
//  Created by Igor Skripnik on 10.10.2018.
//  Copyright © 2018 garik. All rights reserved.
//

import Foundation

/*
 -"source": {
 "id": null,
 "name": "Newsbtc.com"
 },
 "author": "News BTC",
 "title": "Ducking Bitcoin Taxes Will Not Help Industry Grow: Bittax Interview",
 "description": "Early Bitcoin believers ventured into the digital currency industry because of its autonomy and anonymity. But the anti-establishment attitude cannot help the sector grow, according to Bittax. The Israel-based crypto tax specialist said that most people would…",
 "url": "https://www.newsbtc.com/2019/01/30/ducking-bitcoin-taxes-will-not-help-industry-grow-bittax-interview/",
 "urlToImage": "https://www.newsbtc.com/wp-content/uploads/2019/01/shutterstock_264409757.jpg",
 "publishedAt": "2019-01-30T17:38:18Z",
 "content": "Early Bitcoin believers ventured into the digital currency industry because of its autonomy and anonymity. But the anti-establishment attitude cannot help the sector grow, according to Bittax.\r\nThe Israel-based crypto tax specialist said that most people woul… [+4285 chars]"
 }
 */

struct Article {
    var sourceName: String
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
//    var content: String
    
    
    init(dictionary:Dictionary <String, Any>) {
        sourceName = (dictionary["source"] as? Dictionary <String, Any> ?? ["":""])["name"] as? String ?? ""
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
    }
}
