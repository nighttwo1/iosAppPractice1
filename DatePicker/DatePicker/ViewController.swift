//
//  ViewController.swift
//  DatePicker
//
//  Created by 장윤서 on 2020/07/11.
//  Copyright © 2020 Yunseo Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    var time_picked = ""
    var time_current = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: "+formatter.string(from: datePickerView.date)
        
        let formatter_sharing = DateFormatter()
        formatter_sharing.dateFormat = "hh:mm aa"
        time_picked = formatter_sharing.string(from:datePickerView.date)
    }
    
    @objc func updateTime(){
        //lblCurrentTime.text=String(count)
        //count = count+1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: "+formatter.string(from: date as Date)
        
        let formatter_sharing = DateFormatter()
        formatter_sharing.dateFormat = "hh:mm aa"
        time_current = formatter_sharing.string(from:date as Date)
        
        if(time_picked == time_current){
            view.backgroundColor = UIColor.red
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
}

