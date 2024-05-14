//
//  Format.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 14/05/24.
//

import Foundation

extension Double {
    func format(f: Int) -> String {
        return String(format: "%\(f)f", self)
    }
}
