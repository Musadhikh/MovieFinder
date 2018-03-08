//
//  ViewController.swift
//  MovieFinder
//
//  Created by Musadhikh Muhammed K on 08/03/18.
//  Copyright © 2018 musadhikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        APIHandler.sharedHandler.getMovies(for: "batman", page: 1) { (result) in
            
        }
    }

}

