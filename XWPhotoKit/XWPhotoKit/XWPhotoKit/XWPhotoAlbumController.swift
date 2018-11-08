//
//  XWPhotoAlbumController.swift
//  XWPhotoKit
//
//  Created by 邱学伟 on 2018/11/8.
//  Copyright © 2018 邱学伟. All rights reserved.
//

import UIKit
import Photos

enum AlbumType {
    case List
    case Recent
    case All
}

class XWPhotoAlbumController: UIViewController {
    
    var type : AlbumType = .Recent
    var maxPhotoCount : Int = 1
    
    
//    init(type : AlbumType , maxPhotoCount : Int) {
//        super.init()
//        type
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestAuthorization()
    }
}

fileprivate extension XWPhotoAlbumController {
    /// 授权
    func requestAuthorization() {
        PHPhotoLibrary.requestAuthorization { (status) in
            DispatchQueue.main.async {
                switch status {
                case .authorized :
                    break
                default :
                    self.showPermission()
                    break
                }
            }
        }
    }
    
    func showPermission() {
        let alert = UIAlertController(title: nil, message: "您没有打开相册权限", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
}
