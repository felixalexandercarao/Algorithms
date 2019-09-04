//
//  ImageExerciseViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 20/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//
import UIKit

class ImageExerciseViewController: UIViewController{
    //MARK:Properties
    let url = URL(string: "url_of_your_image")
    var imageCounter:Int=1
    @IBOutlet weak var displayedImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        displayedImage.load(url:getUrl(id: imageCounter))
    }
    
    func getUrl(id:Int)->URL{
        return URL(string:"http://lorempixel.com/320/240/city/\(id)")!
    }
    
    //MARK:Actions
    @IBAction func nextPhotoButton(_ sender: UIButton) {
        
        activityIndicator.startAnimating()
        imageCounter+=1
        displayedImage.load(url:getUrl(id: imageCounter))
        activityIndicator.stopAnimating()
    }
    
    @IBAction func backPhotoButton(_ sender: Any) {
        activityIndicator.startAnimating()
        imageCounter-=1
        displayedImage.load(url:getUrl(id: imageCounter))
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

