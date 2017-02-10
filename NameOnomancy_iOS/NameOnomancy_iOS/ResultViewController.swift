//
//  ResultViewController.swift
//  NameOnomancy_iOS
//
//  Created by Kentaro Miura on 2017/02/10.
//  Copyright © 2017年 Kentaro Miura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // スコア
    @IBOutlet weak var scoreLabel: UILabel!

    // 名前
    @IBOutlet weak var nameLabel: UILabel!

    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //レイアウト設定
        self.nameLabel.layer.masksToBounds = true
        self.scoreLabel.layer.masksToBounds = true
        self.nameLabel.layer.cornerRadius = 10
        self.scoreLabel.layer.cornerRadius = self.scoreLabel.bounds.width / 2
        
        // メッセージ表示
        self.nameLabel.text = "\(userName)さんの点数は..."

        // スコア（乱数）
        let score = arc4random_uniform(101)
        
        // スコア表示
        self.scoreLabel.text = "\(score)点"
        
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

}
