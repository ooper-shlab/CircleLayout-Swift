//
//  Cell.swift
//  CircleLayout
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/8/1.
//
//
/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
Custom collection view cell for a blue dot.
*/
import UIKit

@objc(Cell)
class Cell : UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = 35.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.whiteColor().CGColor
        self.contentView.backgroundColor = UIColor.blueColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}