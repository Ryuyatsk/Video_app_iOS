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
        playerLayer.frame = CGRect(x:0 , y: 15, width: self.view.frame.size.width, height:self.view.frame.size.height - 45 - 15)
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
        view.layer.addSublayer(playerLayer)
        player.play()
        
        
        // 動画の再生ボタンを生成.
        let startButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        startButton.layer.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY - 50)
        startButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = 20.0
        startButton.backgroundColor = UIColor.orange
        startButton.setTitle("Start", for: UIControlState.normal)
        startButton.addTarget(self, action: Selector("onButtonClick:"), for: UIControlEvents.touchUpInside)
        self.view.addSubview(startButton)
        
    }
    
    // 再生ボタンが押された時に呼ばれるメソッド.
    func onButtonClick(sender : UIButton){
        
        print("押されたよ")
        
        // 再生されているなら停止
        if ((player.rate != 0) && (player.error == nil)){
            player.pause()
        }
        // 停止されているなら再生
        else{
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


