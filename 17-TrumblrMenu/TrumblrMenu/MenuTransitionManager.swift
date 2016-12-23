//
//  MenuTransitionManager.swift
//  TrumblrMenu
//
//  Created by 陈闯 on 2016/12/23.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    fileprivate var presenting = false
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        let screens: (from: UIViewController, to: UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!, transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        if self.presenting {
            self.offStageMenuController(menuViewController)
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: { 
            if(self.presenting) {
                self.onStageMenuController(menuViewController)
            } else {
                self.offStageMenuController(menuViewController)
            }
        }) { finished in
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow!.addSubview(screens.to.view)
        }
    }
    
    func offstage(_ amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: amount, y: 0)
    }
    
    
    func offStageMenuController(_ menuViewController: MenuViewController) {
        menuViewController.view.alpha = 0
        
        let topRowOffset: CGFloat = 300
        let middleRowOffset: CGFloat = 150
        let bottomRowOffset: CGFloat = 50
        
        menuViewController.leftTopView.transform = self.offstage(-topRowOffset)
        menuViewController.rightTopView.transform = self.offstage(topRowOffset)
        
        menuViewController.leftCenterView.transform = self.offstage(-middleRowOffset)
        menuViewController.rightCenterView.transform = self.offstage(middleRowOffset)
        
        menuViewController.leftBottomView.transform = self.offstage(-bottomRowOffset)
        menuViewController.rightBottomView.transform = self.offstage(bottomRowOffset)
    }
    
    func onStageMenuController(_ menuViewController: MenuViewController) {
        menuViewController.view.alpha = 1
        
        menuViewController.leftTopView.transform = CGAffineTransform.identity
        menuViewController.rightTopView.transform = CGAffineTransform.identity
        
        menuViewController.leftCenterView.transform = CGAffineTransform.identity
        menuViewController.rightCenterView.transform = CGAffineTransform.identity
        
        menuViewController.leftBottomView.transform = CGAffineTransform.identity
        menuViewController.rightBottomView.transform = CGAffineTransform.identity
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}













































