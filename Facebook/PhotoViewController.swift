//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Mullins, Griffin on 10/24/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoActionImage: UIImageView!
    
    var passedImage: UIImageView! = UIImageView()
    let setOff: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        photoImageView.image = passedImage.image
        scrollView.contentSize.height = view.frame.height
        scrollView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapDone(_ sender: AnyObject) {
        dismiss(animated: true) {
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        let scrolly = abs(scrollView.contentOffset.y)
        var converted: CGFloat!
        
        print("\(scrolly)")
        
        converted = convertValue(scrolly, r1Min: 0, r1Max: setOff, r2Min: 1, r2Max: 0)
        
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(converted)
        photoActionImage.alpha = converted
        doneButton.alpha = converted
        
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
        let scrolly = abs(scrollView.contentOffset.y)
        
        switch scrolly {
        case 0...setOff:
            UIView.animate(withDuration: 0.25, animations: {
                self.scrollView.contentOffset.y = 0.0
            })
        default:
            dismiss(animated: true, completion: {
            })
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
