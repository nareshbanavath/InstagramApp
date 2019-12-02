//
//  NewPostViewController.swift
//  InstagramApp
//
//  Created by IOS User1 on 27/11/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit
enum NewPostPagesToShow : Int {
    case library , camera
    var identifier : String{
        switch self{
        case .library :
            return "LibraryVC"
        case .camera :
            return "CameraVC"


        }
    }

    static func pagesToShow() -> [NewPostPagesToShow]
    {
        return [.library , .camera]
    }
}
class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    @objc func cancelButtonPressed()
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryDidTouch(_ sender: UIButton) {
        //when phto touches need to communicate to pagecontroler to show photoLibraryVC
        //communication through notification
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.library)
    }


    @IBAction func cameraDidTouch(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.camera
        )
    }

}
