//
//  ViewController.swift
//  apiPractice
//
//  Created by sweta makuwala on 11/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var personPicture: UIImageView!
    let apiManager = APIManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        apiManager.nativePostDictionary()
        apiManager.nativePostWithModel()
        apiManager.imageUsingUrlSession { data in
            DispatchQueue.main.async {
                self.personPicture.image = UIImage(data: data)
            }
        }
        

    }


}

