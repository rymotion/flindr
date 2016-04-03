//
//  ViewController.swift
//  flindr
//
//  Created by Ryan Paglinawan on 4/2/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let LeftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeHandle(_:)))
        let RightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeHandle(_:)))
        
        LeftSwipe.direction = .Left
        RightSwipe.direction = .Right
        
        view.addGestureRecognizer(LeftSwipe)
        view.addGestureRecognizer(RightSwipe)
        
        // Testing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeHandle(sender:UISwipeGestureRecognizer){
        if (sender.direction == .Left) {
            NSLog("swiped left")
        }
        if (sender.direction == .Right) {
            NSLog("swiped right")
        }
        nextMovie()
        NSLog("Next Movie loaded")
        
    }
    
    func nextMovie(){
        // this will get the next movie from the list on the database API
        
    }

}

