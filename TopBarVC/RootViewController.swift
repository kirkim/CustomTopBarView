//
//  ViewController.swift
//  TopBarVC
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = TopBarMainViewController(tabBarItems: [
                TabBarItem(viewController: Test1(), title: "test11231231231"),
                TabBarItem(viewController: Test2(), title: "test222"),
                TabBarItem(viewController: Test3(), title: "tes"),
                TabBarItem(viewController: Test1(), title: "test1"),
                TabBarItem(viewController: Test2(), title: "test2"),
                TabBarItem(viewController: Test3(), title: "test3")
            ]
        )
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

}

