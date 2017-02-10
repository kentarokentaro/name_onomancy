//
//  ViewController.swift
//  NameOnomancy_iOS
//
//  Created by Kentaro Miura on 2017/02/09.
//  Copyright © 2017年 Kentaro Miura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // テキストフィールド
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert()
    {
        /* iOS7とiOS8のアラート出し分け */
        let VERSION: Float = (UIDevice.current.systemVersion as NSString).floatValue
        if VERSION >= 8.0 {
            let alertController = UIAlertController(title: "Error", message: "Please enter your name", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = "Please enter your name"
            alert.addButton(withTitle: "OK")
            alert.show()
        }
    }
    
// MARK: SEGUE
    // segueの実行条件を確認するメソッド（実装しなければsegueがそのまま実行される）
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showResult" {
            // テキストフィールドの文字が空の場合
            if textField.text == "" {
                self.showAlert()
                return false
            }
            else {
                return true
            }
        }
        return true
    }
    
    // segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // idnifier - sendボタンの場合
        if segue.identifier == "showResult" {
            let resultViewController: ResultViewController = segue.destination as! ResultViewController
            // テキストフィールドの文字列を渡す
            resultViewController.userName = textField.text!
        }
    }


}

