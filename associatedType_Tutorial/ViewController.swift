//
//  ViewController.swift
//  associatedType_Tutorial
//
//  Created by 新垣 清奈 on 2022/09/13.
//

import UIKit

class ViewController: UIViewController {

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userNameLabel)
        getResponse()
        view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userNameLabel.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 50)
    }

    private func getResponse(){
        APIClient.UserGet.request {[weak self] user in
            DispatchQueue.main.async {
                self?.userNameLabel.text = user.name
            }
        }
    }
}

