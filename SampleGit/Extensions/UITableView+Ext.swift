//
//  UITableView+Ext.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 20.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension UITableView {
    private func nibFromClass(_ type: UIView.Type) -> UINib {
        return UINib(nibName: type.nameOfClass, bundle: nil)
    }

    func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.nameOfClass, for: indexPath) as? T
    }

    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(nibFromClass(cell), forCellReuseIdentifier: cell.nameOfClass)
    }
}
