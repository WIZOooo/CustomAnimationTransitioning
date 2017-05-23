//
//  CustomTransition.swift
//  AnimationTest
//
//  Created by Albert-z on 2017-05-14.
//  Copyright © 2017 Albert-z. All rights reserved.
//

import UIKit

class CustomTransitioningManager: NSObject, UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {

    var presentedFrame = CGRect.zero
    var isPresented = false
    
    //MARK:UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.8
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        if isPresented{
            disappear(transitionContext: transitionContext)
        }else{
            showUp(transitionContext: transitionContext)
        }
    }
    
    
    //MARK:UIViewControllerTransitioningDelegate
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?{
        //创建presentationController
        let dialog = DialogPresentationController.init(presentedViewController: presented, presenting: presenting)
        //设置Controller中成员变量的值
        dialog.presentedFrame = presentedFrame
        
        //返回指定的presentationController
        return dialog
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresented = false
        NSLog("Show")
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresented = true
        NSLog("Disappear")
        return self
    }
    
    //MARK:Custom func
    func showUp(transitionContext: UIViewControllerContextTransitioning){
        let view = transitionContext.view(forKey: .to)
        
        transitionContext.containerView.addSubview(view!)
        
        view?.transform = .init(scaleX: 0.0, y: 0.0)
        
        view?.layer.anchorPoint = .init(x: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.5, animations: { 
            view?.transform = .identity
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
    }
    
    func disappear(transitionContext: UIViewControllerContextTransitioning){
        
        let view = transitionContext.view(forKey: .from)
        
        view?.transform = .init(scaleX: 1.0, y: 1.0)
    
        UIView.animate(withDuration: 0.5, animations: { 
            view?.transform = .init(scaleX: 1.0, y: 0.001)
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
    }
}
