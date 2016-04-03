//
//  TableViewController.swift
//  flindr
//
//  Created by Ryan Paglinawan on 4/3/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

import Foundation
import UIKit

class TableViewController:UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Info = 
        self.PosterImage = UIImage(data: NSData(contentsOfURL: APIConstantsUtil.imgURL))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var Info: UIButton!
    @IBOutlet weak var PosterImage: UIImageView!
}
