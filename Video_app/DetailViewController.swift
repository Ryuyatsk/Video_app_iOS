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
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        let startColor = UIColor(red:48/255, green:37/255, blue:184/255, alpha: 1).cgColor
        let endColor = UIColor(red:200/255, green:109/255, blue:215/255, alpha: 1).cgColor
        let layer = CAGradientLayer()
        layer.colors = [startColor, endColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.frame = CGRect(x: 0, y:  0, width: 150, height: 40)
        buy_button.layer.masksToBounds = true
        buy_button.layer.cornerRadius = 20
        buy_button.layer.addSublayer(layer)
        
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
    
    @IBAction func onClickBuyButton(_ sender: UIButton) {
        
        // UIAlertControllerを作成する.
        let myAlert: UIAlertController = UIAlertController(title: "カートに入れました！", message: "カートを確認してください!!!!", preferredStyle: .alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
        
        // UIAlertを発動する.
        present(myAlert, animated: true, completion: nil)
        
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
