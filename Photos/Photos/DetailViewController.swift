//
//  DetailViewController.swift
//  Photos
//
//  Created by Jasmine Giang on 11/13/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var photo : Photo!
    
    @IBOutlet var backBarButtonItem: UIBarButtonItem!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = photo.username
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE MMM dd, yyyy"
        dateLabel.text = dateFormatter.stringFromDate(photo.date)
        loadImage(photo, imageView: imageView)
        likeCountLabel.text = photo.likes.description
        if (photo.liked == true) {
            likeButton.setImage(UIImage(named: "filled_heart.png"), forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImage(photo: Photo, imageView: UIImageView) {
        var imgURL: NSURL = NSURL(string: photo.standardUrl)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        NSURLConnection.sendAsynchronousRequest(
            request, queue: NSOperationQueue.mainQueue(),
            completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?) -> Void in
                if error == nil {
                    imageView.image = UIImage(data: data!)
                }
        })
    }

    @IBAction func likePhoto(sender: UIButton) {
        photo.liked = !photo.liked
        if (photo.liked == true) {
            sender.setImage(UIImage(named: "filled_heart.png"), forState: .Normal)
        } else {
            sender.setImage(UIImage(named: "unfilled_heart.png"), forState: .Normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
