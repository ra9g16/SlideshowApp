//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Ryota Akai on 2017/07/25.
//  Copyright © 2017年 ryota.akai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 再生/停止のBool
    var startStop: Bool! = false
    
    // 画像ロード処理
    let loadImages:[String] = ["photo1.jpg", "photo2.jpg", "photo3.jpg"]
    var imageNumber: Int! = 0
    
    // タイマー
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // イメージ表示
        imageView.image = UIImage(named: loadImages[imageNumber])
        
        // イメージにタップ機能を追加
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageViewTapped(_:))))
        
        // ボタンの初期色
        backwardButton.setTitleColor(UIColor.black, for: .normal)
        forwardButton.setTitleColor(UIColor.black, for: .normal)
        playButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // detailImageViewControllerにパラメータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailImageViewController:DetailImageViewController = segue.destination as! DetailImageViewController
        detailImageViewController.imageName = loadImages[imageNumber]
    }
    
    //UIImageViewの設定
    @IBOutlet weak var imageView: UIImageView!
    
    
    // 再生ボタンの設定
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func startStopImage(_ sender: UIButton) {
        if startStop == false {
            startSlideshow()
        } else {
            stopSlideshow()
        }
    }
    
    
    // 戻るボタンの設定
    @IBOutlet weak var backwardButton: UIButton!
    
    @IBAction func backImage(_ sender: UIButton) {
        if startStop == false {
            imageBack()
        }
    }

    
    // 進むボタンの設定
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBAction func forwardImage(_ sender: UIButton) {
        if startStop == false {
            imageNext()
        }
    }

    
    // detailPageの戻るボタンの設定
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
    
    
    // 戻るの処理
    func imageBack() {
        imageNumber = imageNumber - 1
        if imageNumber < 0 {
            imageNumber = 2
        }
        imageView.image = UIImage(named: loadImages[imageNumber])
    }
    
    
    // 進むの処理
    func imageNext() {
        imageNumber = imageNumber + 1
        if imageNumber > 2 {
            imageNumber = 0
        }
        imageView.image = UIImage(named: loadImages[imageNumber])
    }
    
    
    // タイマーでの処理
    func updateTimer(timer: Timer) {
        imageNext()
    }
    
    
    // スライドショーの開始処理
    func startSlideshow() {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playButton.setTitle("停止", for: .normal)
        backwardButton.isEnabled = false
        forwardButton.isEnabled = false
        backwardButton.setTitleColor(UIColor.white, for: .normal)
        forwardButton.setTitleColor(UIColor.white, for: .normal)
        startStop = true
    }
    
    
    // スライドショーの停止処理
    func stopSlideshow() {
        self.timer.invalidate()
        self.timer = nil
        playButton.setTitle("再生", for: .normal)
        backwardButton.isEnabled = true
        forwardButton.isEnabled = true
        backwardButton.setTitleColor(UIColor.black, for: .normal)
        forwardButton.setTitleColor(UIColor.black, for: .normal)
        startStop = false
    }
    
    
    // タップアクションの処理
    func imageViewTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "detailPage", sender: self.loadImages[imageNumber])
        if startStop != false {
            stopSlideshow()
        }
    }
}
