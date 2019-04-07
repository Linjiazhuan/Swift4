//
//  ViewController.swift
//  TipDemo
//
//  Created by 林佳傳 on 2019/4/7.
//  Copyright © 2019 jiazhuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calucationButton: UIButton!{
        didSet{
            self.calucationButton.layer.cornerRadius = self.calucationButton.frame.height / 2
            self.calucationButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var tipLabel:UILabel!
    @IBOutlet weak var moneyTextfield: UITextField!
    @IBOutlet weak var tipTextfield: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var result:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calucationAns(){
        calucation()
        updateUI()
    }
    @IBAction func endEdit(sender:Any){
        view.endEditing(true)
    }
    

 func calucation() {
        if let moneyText = moneyTextfield.text, let tipText = tipTextfield.text{
            if let money = Double(moneyText), let tip = Double(tipText){
                result = "\(money * tip / 100)"
            }else{
                let alert = UIAlertController(title: nil, message: "請輸入數字!", preferredStyle:.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    
    }
    
    func updateUI(){
        resultLabel.text = result
    }

    @IBAction func changeFeaturePress(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            tipLabel.text = "小費:"
            tipTextfield.text = ""
            moneyTextfield.text = ""
        }else{
            tipLabel.text = "稅金:"
            tipTextfield.text = ""
            moneyTextfield.text = ""
        }
    }
    
}

