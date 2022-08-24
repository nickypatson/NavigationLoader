//
//  ViewController.swift
//  testLoading
//
//  Created by Nicky on 7/3/17.
//  Copyright © 2017 Nicky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    class ViewController: UIViewController {
        
        
        class ViewController: UIViewController {
            
            
            
            class ViewController2: UIViewController {
                
                class ViewController2: UIViewController {
                    
                    
                    class ViewController2: UIViewController {

class ViewController: UIViewController {

    let loadingBar: LoadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func stopLoading(_ sender: Any) {
        loadingBar.stopAnimation()
    }
    
    @IBAction func startLoading(_ sender: Any) {
        loadingBar.startAnimating()
    }
}
