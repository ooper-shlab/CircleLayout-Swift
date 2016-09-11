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


    override func prepare() {
        super.prepare()

        let size = self.collectionView!.frame.size
        cellCount = self.collectionView!.numberOfItems(inSection: 0)
        center = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        radius = min(size.width, size.height) / 2.5
    }

    override var collectionViewContentSize : CGSize {
        return self.collectionView!.frame.size
    }

    override func layoutAttributesForItem(at path: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: path)
        attributes.size = CGSize(width: ITEM_SIZE, height: ITEM_SIZE)
        attributes.center = CGPoint(x: center.x + radius * cos(2 * CGFloat((path as NSIndexPath).item) * CGFloat(M_PI) / CGFloat(cellCount)),
            y: center.y + radius * sin(2 * CGFloat((path as NSIndexPath).item) * CGFloat(M_PI) / CGFloat(cellCount)))
        return attributes
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes] = []
        for i in 0..<self.cellCount {
            let indexPath = IndexPath(item: i, section: 0)
            attributes.append(self.layoutAttributesForItem(at: indexPath)!)
        }
        return attributes
    }

    //### ???
//- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath *)itemIndexPath
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes {
        let attributes = self.layoutAttributesForItem(at: itemIndexPath)!
        attributes.alpha = 0.0
        attributes.center = CGPoint(x: center.x, y: center.y)
        return attributes
}

    //### ???
//- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath *)itemIndexPath
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = self.layoutAttributesForItem(at: itemIndexPath)!
        attributes.alpha = 0.0
        attributes.center = CGPoint(x: center.x, y: center.y)
        attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0)
        return attributes
    }

}
