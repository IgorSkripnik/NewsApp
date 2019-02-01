//
//  PageViewController.swift
//  NewsApp
//
//  Created by Igor Skripnik on 23.11.2018.
//  Copyright © 2018 garik. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        self.showViewControllers()
        loadNews {
            self.showViewControllers()
        }
    }
    
    
    func showViewControllers() {
        DispatchQueue.main.sync {
            if let vc = self.pageViewController(for: 0) {
                self.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) - 1
        return self.pageViewController(for: index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) + 1
        return self.pageViewController(for: index)
    }
    
    
    func pageViewController(for index: Int) -> OneNewsViewController? {
        if index < 0 {
            return nil
        }
        
        if index >= articles.count {
            return nil
        }
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "oneNewsSID") as! OneNewsViewController
        vc.article = articles[index]
        vc.index = index
        return vc
    }
}
