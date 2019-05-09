//
//  ViewController.swift
//  has smile
//
//  Created by 山田　怜音 on 2019/01/30.
//  Copyright © 2019 山田　怜音. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var cameraimageview: UIImageView!
    
    @IBOutlet var hanteiLabel: UILabel!
    
    //加工する時元になる画像
    var originalImage: UIImage!
    
    ImageView.contentMode = UIViewContentMode.scaleAspectFit
    
    //画像判定するための元となる画像
    var originalImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //撮影するボタンをした時に書くメソッド
    @IBAction func takePhoto() {
        //カメラが使えるか確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            //カメラを起動
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            //カメラが使えない時はエラーがコンソールに出ます
            print("error")
        }
    }
    
    //カメラ、カメラロール使った時に選択した画像を表示させるメソッド
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        cameraimageview.image = info[.editedImage] as? UIImage
        
        originalImage = cameraimageview.image
        
        dismiss(animated: true, completion: nil)
    }
    
    //保存するボタンを押した時に書くメソッド
    @IBAction func savePhoto() {
        UIImageWriteToSavedPhotosAlbum(cameraimageview.image!, nil, nil, nil)
    }
    
    //アルバムを見るボタンを押した時に書くメソッド
    @IBAction func openAlbum() {
        //カメラロールが使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            //カメラロールの画像を選択して画像を表示するまでの一連の流れ
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            
            picker.allowsEditing = true
            
            
            present(picker,animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func hantei(){
        
        //storyboardに置いたimageviewからCIImageを生成する
        let ciImage = CIImage(image : originalImage)!
        
        //顔認識なのでtypeをCIDetectorTypeFaceに指定する
        
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        //取得パラメーターを指定する
        let options = [CIDetectorSmile : true ]
        
        //画像から特徴を抽出する
        let features = detector?.features(in: ciImage, options : options)
        if let feature = features?.first as? CIFaceFeature {
            
            if feature.hasSmile {
                hanteiLabel.text =  "smile!"
            } else  {
                hanteiLabel.text = "Not a smile"
                
            }
        } else {
            
        }
        print("hello")
    }
    
    @IBAction func snsPhoto () {
        // 投稿する時に書く文章
        let shareText =  "笑顔認識使ってみた！"
        
        //投稿する画像の選択
        let shareImage = cameraimageview.image!
        
        //投稿するコメントと画像の準備
        let activityItems: [Any] = [shareText,shareImage]
        
        let activityViewController = UIActivityViewController(activityItems: activityItems,
                                                              applicationActivities: nil)
        
        let excloudedActivityTypes = [UIActivity.ActivityType.postToWeibo, .saveToCameraRoll, .print]
        
        
        activityViewController.excludedActivityTypes = excloudedActivityTypes
        
        present(activityViewController, animated: true, completion: nil)
    }
}




