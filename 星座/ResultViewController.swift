//
//  ResultViewController.swift
//  星座
//
//  Created by 溫皓 on 2023/8/29.
//

import UIKit
import WebKit

class ResultViewController: UIViewController {
    var birthday:Date! = Date()
    let lifeNumberNames = ["","開創","協調","創意","務實","自由","關懷","權威","探究","權威","智慧"]
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    func updateUI(){
        // 計算生命數字
        let number = calculateLifeNumber(date: birthday)

        // 設定視圖控制器的標題，顯示生命數字和相應的名稱
        title = "\(number)\(lifeNumberNames[number])數"

        // 創建 URL 對象，這個 URL 對象指向指定的網頁
        if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).htm") {
            // 創建一個 URL 請求，使用剛剛創建的 URL
            let request = URLRequest(url: url)
            
            // 使用 WebKit 中的 WebView 加載 URL 請求，顯示網頁內容
            webView.load(request)
        }
    }
    
    func calculateLifeNumber(date: Date) -> Int {
        // 創建一個 DateFormatter 對象，用於將日期轉換為指定格式的字符串
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMd" // 設置日期格式為年份+月份+日期（例如：20230903）
        
        // 使用日期格式化器將傳入的日期轉換為字符串
        var numberString = dateFormatter.string(from: date)
        
        var sum = 0 // 初始化計算總和的變數
        
        // 進入一個循環，直到總和小於或等於9為止
        repeat {
            sum = 0 // 初始化總和為0
            
            // 遍歷日期字符串中的每個字符
            for character in numberString {
                // 將字符轉換為整數，並將其添加到總和中
                let number = Int(String(character))!
                sum = sum + number
                
                // 更新日期字符串以包含新的總和（用於下一輪迭代）
                numberString = "\(sum)"
                
                // 在每次計算總和後打印總和（用於調試）
                print(sum)
            }
        } while sum > 9 // 檢查總和是否大於9，如果是，則繼續循環
        
        // 返回計算出的生命數字
        return sum
    }


    
}
