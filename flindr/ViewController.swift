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
        
        
        // Testing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSwipeLeft(){
        // reject movie
        nextMovie();
    }
    
    func didSwipeRight(){
        // accept and save movie
        
        nextMovie();
    }
    
    func nextMovie(){
        // this will get the next movie from the list on the database API
        
    }

}

