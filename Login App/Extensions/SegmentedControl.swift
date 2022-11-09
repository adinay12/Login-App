//
//  SegmentedControl.swift
//  Login App
//
//  Created by Adinay on 10/10/22.
//

import UIKit

extension UISegmentedControl {
    func replaceSegments(segments: Array<String>) {
        self.removeAllSegments()
        for segment in segments {
            self.insertSegment(withTitle: segment, at: self.numberOfSegments, animated: false)
        }
    }
}
