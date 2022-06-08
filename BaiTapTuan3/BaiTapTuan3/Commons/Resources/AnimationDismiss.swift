//
//  AnimationDismiss.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 08/06/2022.
//
import UIKit

struct AnimationDismiss {
    static let shared = AnimationDismiss()
    
    func animationDismiss() -> CATransition {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        return transition
    }
    
    func animationPresent() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        return transition
    }
    //    view.window!.layer.add(transition, forKey: kCATransition)
    //    present(dashboardWorkout, animated: false, completion: nil)
}
