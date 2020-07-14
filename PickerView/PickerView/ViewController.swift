//
//  ViewController.swift
//  PickerView
//
//  Created by 장윤서 on 2020/07/15.
//  Copyright © 2020 Yunseo Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 2
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["aurora-1197753_1920.jpg", "california-210913_1920.jpg", "forest-1950402_1920.jpg", "landscape-540115_1920.jpg", "lone-tree-1934897_1920.jpg", "river-2951997_1920.jpg", "scotland-1761292_1920.jpg", "sunset-1373171_1920.jpg", "tuscany-428041_1920.jpg", "yellowstone-national-park-1581879_1920.jpg"]
    @IBOutlet var pickerImager: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    //returns the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return PICKER_VIEW_COLUMN
    }

    //return the # of rows in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
     */
    
    //print image on picker imager
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x:0, y:0, width: 150, height: 100)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            lblImageFileName.text = imageFileName[row]
        }else{
            imageView.image = imageArray[row]
        }
        /*
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
        */
    }


}

