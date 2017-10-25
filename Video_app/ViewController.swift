//
//  ViewController.swift
//  Video_app
//
//  Created by Ryuya Tosaka on 2017/10/23.
//  Copyright © 2017年 ryuya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var goDetail_button: UIButton!
    
    @IBOutlet var mainView: UIView!
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    var url: URL = {
        var url = URL(string: "http://motto.tokyo/app/video/yasuda.mp4")
        return url!
    }()
    
    /*
     下記から動画画面の実装
     */
    
    //AVURLAssetは持ってないから
    //AVAssetResourceLoaderDelegateをしないといけないからextensionする
    lazy var asset: AVURLAsset = {
        var asset: AVURLAsset = AVURLAsset(url: self.url)
        asset.resourceLoader.setDelegate(self, queue: DispatchQueue.main)
        return asset
    }()
    
    
    lazy var playerItem: AVPlayerItem = {
        var playerItem: AVPlayerItem = AVPlayerItem(asset: self.asset)
        return playerItem
    }()
    
    
    lazy var player: AVPlayer = {
        var player: AVPlayer = AVPlayer(playerItem: self.playerItem)
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        return player
    }()
    
    //動画の画面
    lazy var playerLayer: AVPlayerLayer = {
        var playerLayer: AVPlayerLayer = AVPlayerLayer(player: self.player)
        playerLayer.frame = CGRect(x:0 , y: 0, width: self.view.frame.size.width, height:self.view.frame.size.height)
        playerLayer.backgroundColor = UIColor.clear.cgColor
        return playerLayer
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBarを非表示にしたい場合
        // self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //動画のアイテムを監視
        playerItem.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        //動画が終わったタイミングを監視
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        mainView.layer.addSublayer(playerLayer)
        player.play()
        
        
        // 動画の再生ボタンを生成.
        let startButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        startButton.layer.position = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
        startButton.layer.masksToBounds = true
        startButton.backgroundColor = UIColor(red:255/255 , green:255/255 , blue:255/255 , alpha:0)
        startButton.addTarget(self, action: #selector(ViewController.onButtonClick(sender: )), for: .touchUpInside)
        self.view.addSubview(startButton)
        
        
        let startColor = UIColor(red:48/255, green:37/255, blue:184/255, alpha: 1).cgColor
        let endColor = UIColor(red:200/255, green:109/255, blue:215/255, alpha: 1).cgColor
        let alayer = CAGradientLayer()
        alayer.colors = [startColor, endColor]
        alayer.startPoint = CGPoint(x: 0, y: 0)
        alayer.endPoint = CGPoint(x: 1, y: 1)
        alayer.frame = CGRect(x: 0, y:  0, width: self.view.frame.size.width, height: 45)
        goDetail_button.layer.addSublayer(alayer)

        
        
    }
    
    // 再生ボタンが押された時に呼ばれるメソッド.
    func onButtonClick(sender : UIButton){
        
        print("押されたよ")
        
        // 再生されているなら停止
        if ((player.rate != 0) && (player.error == nil)){
            print("停止する")
            player.pause()
        }
        // 停止されているなら再生
        else{
            print("再生する")
            player.play()

        }

        
    }
    
    // 監視対象の値に変化があった時に呼ばれる
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {}
    
    //動画を一番最初まで巻き戻す的な
    func playerItemDidReachEnd(_ notification: Notification) {
        
        player.seek(to: kCMTimeZero)
    }
    
    // 画面遷移
    @IBAction func goNextBySegue(_ sender: UIButton) {
        performSegue(withIdentifier: "nextSegue", sender: nil)
    }


}

extension ViewController : AVAssetResourceLoaderDelegate {
}


