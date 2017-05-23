//
//  DialogPresentationController.swift
//  AnimationTest
//
//  Created by Albert-z on 2017-05-14.
//  Copyright © 2017 Albert-z. All rights reserved.
//

import UIKit

class DialogPresentationController: UIPresentationController {
    var presentedFrame = CGRect.zero
    var isLayout = false
    override func containerViewDidLayoutSubviews(){
        if !isLayout {
            presentedView?.frame = presentedFrame
            
            containerView?.insertSubview(coverbutton, at: 0)
            
            coverbutton.addTarget(self, action: #selector(closeDialog), for: .touchUpInside)
            isLayout = true
        }
    }
    
    func closeDialog(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    private lazy var coverbutton: UIButton = {
        let btn = UIButton.init(frame: UIScreen.main.bounds)
        btn.backgroundColor = UIColor.lightGray
        btn.alpha = 0.8
        return btn
    }()
}
