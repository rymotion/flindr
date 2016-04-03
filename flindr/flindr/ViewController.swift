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
        // Do any additional setup after loading the view, typically from a nib.c
        let LeftSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandle:")
        let RightSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandle:")
        
        LeftSwipe.direction = .Left
        RightSwipe.direction = .Right
        
        view.addGestureRecognizer(LeftSwipe)
        view.addGestureRecognizer(RightSwipe)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeHandle(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            print("Swipe left")
            nextMovie()
        }
        if (sender.direction == .Right) {
            print("Swipe right")
            //also save to a database later
            database.saveData(title, description, imageURL)
            nextMovie()
        }
    }
    
    func nextMovie(){
        //this should load up another movie random if it has to
        APIConstantsUtil.findRandomMovie()
    }

}

