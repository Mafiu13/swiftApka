//
//  BigPictureViewController.swift
//  Testinio_0
//
//  Created by Mateusz Orzoł on 22.06.2016.
//  Copyright © 2016 Mateusz Orzoł. All rights reserved.
//

import UIKit

class BigPictureViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            scrollView?.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.1
            scrollView.maximumZoomScale = 10
        }
    }
    
    @IBOutlet weak var spinierinio: UIActivityIndicatorView!
    
    var imageView = UIImageView()
    
    private var image: UIImage?{
        get{
            return (imageView.image)
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    var imageUrl: NSURL?{
        
        didSet{
            image = nil
            fetchImageUrl();
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func fetchImageUrl(){
        if let url = imageUrl{
            spinierinio.startAnimating()
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
                if let data = NSData(contentsOfURL: url) {
                    let image = UIImage(data: data)
                    dispatch_async(dispatch_get_main_queue()) {
                        self.image = image
                        self.spinierinio.stopAnimating()
                    }
                }
            }
        }
    }
    
    @IBAction func smallCat() {
        imageUrl = NSURL(string: urls.cat)
    }
    
    @IBAction func bigCat() {
        imageUrl = NSURL(string: urls.cat4k)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        smallCat()
    }
    
}
