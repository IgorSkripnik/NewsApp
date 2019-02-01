//
//  Model.swift
//  NewsApp
//
//  Created by Igor Skripnik on 10.10.2018.
//  Copyright © 2018 garik. All rights reserved.
//

import Foundation

var articles:[Article] {
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary <String, Any>] {
        var returnArray: [Article] = []
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        return returnArray
    }
    
    return []
}

var urlToData:URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadNews(completionHandler: (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2018-10-23&sortBy=publishedAt&apiKey=7f690f05d66b43b6b2b3d39c7fda41bb")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) { (urlFile, response, error) in
        if let urlF = urlFile {
            do {
                try? FileManager.default.removeItem(at: urlToData)
                try FileManager.default.copyItem(at: urlF, to: urlToData)
            } catch {
                print(error.localizedDescription)
            }
        }
            completionHandler?()
    }
    downloadTask.resume()
}
