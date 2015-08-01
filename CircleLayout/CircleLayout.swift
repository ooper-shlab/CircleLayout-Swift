//
//  File.swift
//  CircleLayout
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/8/1.
//
//
/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
Custom UICollectionViewLayout to represent Circle Layout design.
*/
import UIKit

let ITEM_SIZE: CGFloat = 70

@objc(CircleLayout)
class CircleLayout: UICollectionViewLayout {
    var center: CGPoint = CGPoint()
    var radius: CGFloat = CGFloat()
    var cellCount: Int = Int()


    override func prepareLayout() {
        super.prepareLayout()

        let size = self.collectionView!.frame.size
        cellCount = self.collectionView!.numberOfItemsInSection(0)
        center = CGPointMake(size.width / 2.0, size.height / 2.0)
        radius = min(size.width, size.height) / 2.5
    }

    override func collectionViewContentSize() -> CGSize {
        return self.collectionView!.frame.size
    }

    override func layoutAttributesForItemAtIndexPath(path: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: path)
        attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE)
        attributes.center = CGPointMake(center.x + radius * cos(2 * CGFloat(path.item) * CGFloat(M_PI) / CGFloat(cellCount)),
            center.y + radius * sin(2 * CGFloat(path.item) * CGFloat(M_PI) / CGFloat(cellCount)))
        return attributes
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes] = []
        for i in 0..<self.cellCount {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            attributes.append(self.layoutAttributesForItemAtIndexPath(indexPath)!)
        }
        return attributes
    }

    //### ???
//- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath *)itemIndexPath
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes {
        let attributes = self.layoutAttributesForItemAtIndexPath(itemIndexPath)!
        attributes.alpha = 0.0
        attributes.center = CGPointMake(center.x, center.y)
        return attributes
}

    //### ???
//- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath *)itemIndexPath
    override func finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = self.layoutAttributesForItemAtIndexPath(itemIndexPath)!
        attributes.alpha = 0.0
        attributes.center = CGPointMake(center.x, center.y)
        attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0)
        return attributes
    }

}