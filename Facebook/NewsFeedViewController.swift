//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet var photos: [UIImageView]!
    
    var selectedImage: UIImageView! = UIImageView()
    var photoTransition: PhotoTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height + feedImageView.frame.origin.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    @IBAction func photoSegue(_ sender: UITapGestureRecognizer?){
        if let imageSender = sender?.view {
            selectedImage = imageSender as! UIImageView
            performSegue(withIdentifier: "photoSegue", sender: selectedImage)
        }
    }
    
     // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PhotoViewController
        if let imageSender = sender {
                destination.passedImage = imageSender as! UIImageView
        }
        
        destination.modalPresentationStyle = UIModalPresentationStyle.custom
        photoTransition = PhotoTransition()
        photoTransition.duration = 0.25
        destination.transitioningDelegate = photoTransition
    }
}
