//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Igor Skripnik on 23.11.2018.
//  Copyright © 2018 garik. All rights reserved.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {

    var index: Int = 0
    var article: Article!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var buttonOpenInSafari: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBAction func pushOpenAction(_ sender: Any) {
        if let url = URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
        
        //проверки на пустоту
        if URL(string: article.urlToImage) == nil {
            self.imageView.backgroundColor = UIColor.black
        }
        
        if URL(string: article.url) == nil {
            buttonOpenInSafari.isHidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
