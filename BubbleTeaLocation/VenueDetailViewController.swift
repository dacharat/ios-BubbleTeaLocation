//
//  VenueDetailViewController.swift
//  BubbleTeaLocation
//
//  Created by Jack on 21/2/2562 BE.
//  Copyright © 2562 Jack. All rights reserved.
//

import Alamofire
import AlamofireImage
import UIKit

class VenueDetailViewController: UIViewController {
    
    var name: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        Alamofire.request("https://s3-media3.fl.yelpcdn.com/bphoto/XAE6J6gHotKfj4G593bYHg/ls.jpg").responseImage(completionHandler: {res in
            self.imageView.image = res.result.value
        })
    }
    

}
