//
//  CollectionViewController.swift
//  Video_app
//
//  Created by Ryuya Tosaka on 2017/10/24.
//  Copyright © 2017年 ryuya. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    // サムネイル画像の名前
    let photos = ["google_home", "google_home","google_home","google_home","google_home",
                  "google_home","google_home","google_home","google_home","google_home"]
    
    let cellMargin: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        // "Cell" はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                               for: indexPath)
        // cellのカスタマイズ
        
        testCell.layer.borderColor = UIColor.gray.cgColor
        testCell.layer.borderWidth = 0.2
        testCell.backgroundColor = UIColor.white
        testCell.layer.masksToBounds = true
        testCell.layer.cornerRadius = 5
        
        // 影
//        testCell.layer.shadowColor = UIColor.black.cgColor
//        testCell.layer.shadowOffset = CGSize(width: 10, height: 10)
//        testCell.layer.shadowOpacity = 0.2
//        testCell.layer.shadowRadius = 5
        
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        
        // Tag番号を使ってLabelのインスタンス生成
        let label = testCell.contentView.viewWithTag(2) as! UILabel
        label.text = photos[(indexPath as NSIndexPath).row]
        
        return testCell
    }
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横に２つのCellを入れることを想定して、多少のマージンを入れる
        let cellSize:CGFloat = self.view.frame.size.width/2 - 7
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: 220)
    }
    
    //セルのアイテムのマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        //マージン(top , left , bottom , right)
        return UIEdgeInsetsMake(5.0 , 3.0 , 5.0 , 3.0 )
    }
    
    //セルの垂直方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }

    //セルの水平方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    // Cellが選択された際に呼び出される
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        performSegue(withIdentifier: "toViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toViewController") {
            let _: ViewController = (segue.destination as? ViewController)!
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return 10;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
