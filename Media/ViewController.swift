//
//  ViewController.swift
//  Media
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var mediaButton: UIButton!
    @IBOutlet var lottoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        mediaButton.addTarget(self, action: #selector(mediaButtonClicked), for: .touchUpInside)
        lottoButton.addTarget(self, action: #selector(lottoButtonClicked), for: .touchUpInside)
    }

    @objc func signUpButtonClicked(){
        let vc = SignUpViewController()
        present(vc, animated: true)
    }
    
    @objc func mediaButtonClicked(){
        let vc = MediaViewController()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
    @objc func lottoButtonClicked(){
        let vc = LottoViewController()
        present(vc, animated: true)
    }
}

