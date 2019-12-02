//
//  TabBarDelegate.swift
//  InstagramApp
//
//  Created by IOS User1 on 02/12/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit
class TabBarDelegate : NSObject , UITabBarControllerDelegate
{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        let navigationController = viewController as? UINavigationController
        navigationController?.popViewController(animated: true)
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let selectedViewcontroller = tabBarController.selectedViewController
        //we ensure that selectedVC should not be nil
        guard let _selectedViewController = selectedViewcontroller else { return false}

        //we ensure that the selectedViewController and our nextViewcontroller were not to be same means ex: suppose currently we are in home tab and we again tapped the (same tab)home tab only so to avoid this multiple selection on same tab we need check with below condition Here viewController is currently Showing VC and the selectedVC is whatever we select next
        if viewController == _selectedViewController
        {
            return false
        }
        guard let controllerIndex = tabBarController.viewControllers?.index(of: viewController) else {return true}
        if controllerIndex == 2{
            let newPostStoryBoard = UIStoryboard(name: "NewPost", bundle: nil)
            let newPostVC = newPostStoryBoard.instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
            let navVC = UINavigationController(rootViewController: newPostVC)
            _selectedViewController.present(navVC, animated: true, completion: nil)

            return false
        }
        let navigationController = viewController as? UINavigationController
        navigationController?.popViewController(animated: true)
        return true
    }
}
