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
        let vc = TopBarMainViewController(
            tabBarItems: [
                TabBarItem(viewController: Test1(), itemTitle: "test11231231231"),
                TabBarItem(viewController: Test2(), itemTitle: "test222"),
                TabBarItem(viewController: Test3(), itemTitle: "tes"),
                TabBarItem(viewController: Test1(), itemTitle: "test1"),
                TabBarItem(viewController: Test2(), itemTitle: "test2"),
                TabBarItem(viewController: Test3(), itemTitle: "test3")
            ],
            startPage: 3
            ,
            bottomBar: BottomBar()
        )
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

}

