//
//  ImageViewController.swift
//  CoreDataTest
//
//  Created by yishain chen on 2016/3/27.
//  Copyright © 2016年 Inno-orz. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {

    var imageView : UIImageView!
    var scrollView : UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(image:  UIImage(named: "steve"))
        setUpScrollView()
        scrollView.delegate = self;
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(scrollView.bounds.size)
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        recenterImage()
    }
    
    private func setUpScrollView() {
    
        scrollView = UIScrollView(frame:view.bounds)
        scrollView.autoresizingMask = [.FlexibleWidth,.FlexibleHeight];
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    private func setZoomScaleFor(scrollViewSize: CGSize) {
    
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
    
    }
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let  horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
      return  self.imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.recenterImage()
    }

}
