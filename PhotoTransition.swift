//
//  PhotoTransition.swift
//  Facebook
//
//  Created by Mullins, Griffin on 10/24/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    var photo: UIImageView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let fromView = fromViewController.childViewControllers[0].childViewControllers[0] as! NewsFeedViewController
        let toView = toViewController as! PhotoViewController
        
        photo = UIImageView()
        photo.image = fromView.selectedImage.image
        photo.frame = fromView.selectedImage.frame
        photo.contentMode = fromView.selectedImage.contentMode
        
        containerView.addSubview(photo)
        toView.view.alpha = 0
        toView.photoImageView.isHidden = true
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            self.photo.frame = toView.photoImageView.frame
            self.photo.contentMode = toView.photoImageView.contentMode
        }) { (finished: Bool) -> Void in
            self.photo.removeFromSuperview()
            toView.photoImageView.isHidden = false
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let fromView = fromViewController as! PhotoViewController
        let toView = toViewController.childViewControllers[0].childViewControllers[0] as! NewsFeedViewController

        photo = UIImageView()
        photo.image = fromView.photoImageView.image
        photo.frame = fromView.photoImageView.frame
        photo.contentMode = fromView.photoImageView.contentMode
        
        containerView.addSubview(photo)
        
        fromViewController.view.alpha = 1
        toView.selectedImage.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
            self.photo.frame = toView.selectedImage.frame
            self.photo.contentMode = toView.selectedImage.contentMode
        }) { (finished: Bool) -> Void in
            self.photo.removeFromSuperview()
            toView.selectedImage.alpha = 1
            self.finish()
        }
    }
}
