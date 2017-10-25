////
////  TopListViewController.swift
////  Video_app
////
////  Created by Ryuya Tosaka on 2017/10/24.
////  Copyright © 2017年 ryuya. All rights reserved.
////
//
//import UIKit
//
//class TopListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
//
//    var myCollectionView : UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //ヘッダーエリア
//        let first_view = UIView(frame : CGRect(x: 0, y: 65, width: self.view.frame.size.width, height: self.view.frame.size.height - 65))
//        first_view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//        self.view.addSubview(first_view)
//        
//        // CollectionViewのレイアウトを生成.
//        let layout = UICollectionViewFlowLayout()
//        // Cell一つ一つの大きさ.
//        layout.itemSize = CGSize(width:(self.view.frame.width/2) - 3 , height:200)
//        layout.sectionInset = UIEdgeInsetsMake(3,1.5,0,1.5)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 3
//        // CollectionViewを生成.
//        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        // Cellに使われるクラスを登録.
//        myCollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//        myCollectionView.delegate = self
//        myCollectionView.dataSource = self
//        myCollectionView.backgroundColor = UIColor.blue
//        first_view.addSubview(myCollectionView)
//
//    }
//
//    // Cellが選択された際に呼び出される
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//    }
//
//    // セルの総数を返す
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 100
//    }
//    // Cellに値を設定する
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomUICollectionViewCell
//        cell.textLabel?.text = indexPath.row.description
//
//        return cell
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//}

