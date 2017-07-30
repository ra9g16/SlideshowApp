//
//  DetailImageViewController.swift
//  SlideshowApp
//
//  Created by Ryota Akai on 2017/07/26.
//  Copyright © 2017年 ryota.akai. All rights reserved.
//

import UIKit

class DetailImageViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    // ViewControllerのイメージ
    var imageName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // 画像表示
        imageDetail.image = UIImage(named: imageName)
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

