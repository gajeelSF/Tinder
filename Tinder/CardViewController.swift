//
//  CardViewController.swift
//  Tinder
//
//  Created by SongYuda on 4/26/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onPanImage(_ sender: UIPanGestureRecognizer) {
        
        let tranlation = sender.translation(in: view)
        let location = sender.location(in: view)
        
        if sender.state == .began {
            cardInitialCenter = self.userImage.center
        }
        if sender.state == .changed {
            
            self.userImage.center = CGPoint(x: cardInitialCenter.x + tranlation.x, y: cardInitialCenter.y + tranlation.y)
        
            if(location.y > self.userImage.center.y) {
                let rotation = CGAffineTransform(rotationAngle: -tranlation.x / 100)
                self.userImage.transform = rotation
            }
            else {
                let rotation = CGAffineTransform(rotationAngle: tranlation.x / 100)
                self.userImage.transform = rotation
            }
        }
        
        if sender.state == .ended {
            if (tranlation.x > 50 || tranlation.x < -50) {
                UIView.animate(withDuration: 0.3, animations: {
                    if(tranlation.x > 50) {
                        self.userImage.center.x += 500
                    }
                    else {
                         self.userImage.center.x -= 500
                    }
                    
                })
            }
            else {
                self.userImage.transform  = CGAffineTransform.identity
                self.userImage.center = cardInitialCenter

            }
        }
    }
    @IBAction func onTapImage(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "cardToDetail", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController{
            if let image = userImage.image {
                detailVC.detailImage = userImage
            }
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
