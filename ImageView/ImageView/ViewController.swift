//
//  ViewController.swift
//  ImageView
//
//  Created by 장윤서 on 2020/06/28.
//  Copyright © 2020 Yunseo Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imgOn:UIImage?      //켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff:UIImage?     //꺼진 전구 이미지가 있는 UIImage 타입의 변수

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "idea.png")
        imgOff = UIImage(named: "idea-2.png")
        
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 1.3
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
            
        }else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
            
        }
        imgView.frame.size = CGSize(width: newHeight, height: newHeight)
        isZoom = !isZoom
        
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
}

