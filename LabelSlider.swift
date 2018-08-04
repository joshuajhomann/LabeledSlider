//
//  LabelSlider.swift
//  LabeledSlider
//
//  Created by Joshua Homann on 8/4/18.
//  Copyright © 2018 com.josh. All rights reserved.
//

import UIKit

class LabelSlider: UISlider {
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumIntegerDigits = 1
        return formatter
    }()
    private var centerXConstraint: NSLayoutConstraint!
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        centerXConstraint = label.centerXAnchor.constraint(equalTo: centerXAnchor)
        centerXConstraint.isActive = true
        label.bottomAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        return label
    }()

    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let thumb = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        label.text =  formatter.string(for: value)
        label.sizeToFit()
        centerXConstraint.constant = thumb.midX - frame.size.width / 2
        return thumb
    }

}
