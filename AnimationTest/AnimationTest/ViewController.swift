//
//  ViewController.swift
//  AnimationTest
//
//  Created by Albert-z on 2017-05-13.
//  Copyright © 2017 Albert-z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var window: UIWindow?
    var manager:CustomTransitioningManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: Any) {
        manager = CustomTransitioningManager.init()
        manager?.presentedFrame = CGRect.init(x: UIScreen.main.bounds.width/2 - 150.0, y: UIScreen.main.bounds.height/2 - 100.0, width: 300, height: 150)
        let sb = UIStoryboard.init(name: "DialogVC", bundle: nil)
        let dialogVC = sb.instantiateInitialViewController()
        dialogVC?.modalPresentationStyle = .custom
        dialogVC?.transitioningDelegate = manager
        present(dialogVC!, animated: true, completion: nil)
    }

}

