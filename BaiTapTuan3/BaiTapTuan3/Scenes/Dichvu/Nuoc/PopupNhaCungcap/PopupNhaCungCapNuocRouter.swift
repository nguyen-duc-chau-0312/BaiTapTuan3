//
//  PopupNhaCungCapNuocRouter.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol PopupNhaCungCapNuocRoutingLogic: AnyObject {
    func show(_ dataCell: ServiceNuocObj)
}

final class PopupNhaCungCapNuocRouter {
    weak var viewController: PopupNhaCungCapNuocViewController!
}

extension PopupNhaCungCapNuocRouter: PopupNhaCungCapNuocRoutingLogic {
    func show(_ dataCell: ServiceNuocObj) {
        let item: ServiceNuocObj = dataCell
    }
   
    // MARK: Navigation
    /* Example
    func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    } */
}
