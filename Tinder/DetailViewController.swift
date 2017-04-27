//
//  DetailViewController.swift
//  Tinder
//
//  Created by SongYuda on 4/26/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTapDone(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "detailToCard", sender: nil)
    }
    
}
