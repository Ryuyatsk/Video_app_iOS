//
//  ViewController.swift
//  Video_app
//
//  Created by Ryuya Tosaka on 2017/10/23.
//  Copyright © 2017年 ryuya. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var url: URL = {
        var url = URL(string: "https://hogehoge.com")
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
        playerLayer.frame = UIScreen.main.bounds
        playerLayer.backgroundColor = UIColor.clear.cgColor
        return playerLayer
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(playerLayer)
        player.play()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : AVAssetResourceLoaderDelegate {
}


