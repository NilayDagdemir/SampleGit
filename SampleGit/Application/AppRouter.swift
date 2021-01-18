//
//  AppRouter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

open class AppRouter {

    public static var shared = AppRouter()

    var window: UIWindow?

    func start() {
        let viewController = SearchRepositoriesRouter.setupModule()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
