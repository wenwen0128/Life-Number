//
//  BirthdayViewController.swift
//  星座
//
//  Created by 溫皓 on 2023/8/29.
//

import UIKit

class BirthdayViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 50
        testButton.layer.cornerRadius = 5
    }
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        // 通過提供的 NSCoder 實例化 ResultViewController，先儲存產生的 controller
        let controller =  ResultViewController(coder: coder)
    
        // 設置 ResultViewController 的 birthday 屬性為 datePicker 的日期 date
        controller?.birthday = datePicker.date
        
        // 回存到 ResultViewController
        return controller
    }

}

