//
//  AppDelegate.swift
//  InstagramApp
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let tabBarDelegate = TabBarDelegate()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Override point for customization after application launch.
        let tabBarController = UITabBarController()
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let activityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
        let homeVc = homeStoryboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        let searchVc = searchStoryboard.instantiateViewController(withIdentifier: "Search") as! SearchViewController
        let newPostVc = newPostStoryboard.instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
        let profileVc = profileStoryboard.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
        let activityVc = activityStoryboard.instantiateViewController(withIdentifier: "Activity") as! ActivityViewController
        let vcData : [(UIViewController,UIImage,UIImage)] = [
            (homeVc,UIImage(named: "home_tab_icon")!,UIImage(named: "home_selected_tab_icon")!),
            (searchVc,UIImage(named: "search_tab_icon")!,UIImage(named: "search_selected_tab_icon")!),
            (newPostVc,UIImage(named: "post_tab_icon")!,UIImage(named: "post_tab_icon")!),
            (activityVc,UIImage(named: "activity_tab_icon")!,UIImage(named: "activity_selected_tab_icon")!),
            (profileVc,UIImage(named: "profile_tab_icon")!,UIImage(named: "profile_selected_tab_icon")!)

        ]
        let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
            let nav = UINavigationController(rootViewController: vc)
            nav.navigationBar.isTranslucent = false

            nav.tabBarItem.image = defaultImage
            nav.tabBarItem.selectedImage = selectedImage
            return nav

        }
        tabBarController.viewControllers = vcs
        tabBarController.tabBar.isTranslucent = false
        tabBarController.delegate = tabBarDelegate
        if let items = tabBarController.tabBar.items
        {
            for item in items
            {
//                item.title = "Home"
//                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 6)
//                item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
                //Rendering tabBarImages with original Image
                if let image = item.image
                {
                    item.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                if let selectedImage = item.selectedImage
                {
                    item.selectedImage = selectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }

                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }

        UINavigationBar.appearance().backgroundColor = .white
        window?.rootViewController = tabBarController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

