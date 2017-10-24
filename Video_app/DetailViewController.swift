//
//  DetailViewController.swift
//  Video_app
//
//  Created by Ryuya Tosaka on 2017/10/24.
//  Copyright © 2017年 ryuya. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet var buy_button: UIButton!
    @IBOutlet var fav_button: UIButton!
    @IBOutlet var share_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBarを非表示にしたい場合
        // self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        buy_button.layer.cornerRadius = 20
        
        
        fav_button.layer.cornerRadius = 15
        fav_button.layer.shadowColor = UIColor.black.cgColor
        fav_button.layer.shadowOffset = CGSize(width: 0, height: 0)
        fav_button.layer.shadowOpacity = 0.2
        fav_button.layer.shadowRadius = 10.0
        
        
        share_button.layer.cornerRadius = 15
        share_button.layer.shadowColor = UIColor.black.cgColor
        share_button.layer.shadowOffset = CGSize(width: 0, height: 0)
        share_button.layer.shadowOpacity = 0.2
        share_button.layer.shadowRadius = 10.0
       
    }
    
    
    
    @IBAction func onClickTwitterShare(_ sender: UIButton) {
        
        let text = "Learn more about Google Home!! #Googlehome"
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        composeViewController.setInitialText(text)
        
        self.present(composeViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
