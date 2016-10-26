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
        let fromImage = fromView.selectedImage!
        let toImage = toView.photoImageView!
        
        photo = UIImageView()
        photo.image = fromImage.image
        photo.frame = containerView.convert(fromImage.frame, to: fromImage.superview)
        photo.contentMode = fromImage.contentMode
        
        containerView.addSubview(photo)
        toView.view.alpha = 0
        toImage.isHidden = true
        fromImage.isHidden = true
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            self.photo.frame = containerView.convert(toImage.frame, to: toImage.superview)
            self.photo.contentMode = toView.photoImageView.contentMode
        }) { (finished: Bool) -> Void in
            self.photo.removeFromSuperview()
            toImage.isHidden = false
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let fromView = fromViewController as! PhotoViewController
        let toView = toViewController.childViewControllers[0].childViewControllers[0] as! NewsFeedViewController
        let fromImage = fromView.photoImageView!
        let toImage = toView.selectedImage!
        
        photo = UIImageView()
        photo.image = fromImage.image
        photo.frame = containerView.convert(fromImage.frame, to: fromImage.superview)
        photo.contentMode = fromImage.contentMode

        containerView.addSubview(photo)
        toView.view.alpha = 0
        toImage.isHidden = true
        fromImage.isHidden = true
        
        UIView.animate(withDuration: duration, animations: {
            toView.view.alpha = 1
            self.photo.frame = containerView.convert(toImage.frame, to: toImage.superview)
            self.photo.contentMode = toImage.contentMode
        }) { (finished: Bool) -> Void in
            self.photo.removeFromSuperview()
            toImage.isHidden = false
            self.finish()
        }
    }
}
