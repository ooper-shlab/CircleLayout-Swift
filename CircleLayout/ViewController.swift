//
//  ViewController.swift
//  CircleLayout
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/8/1.
//
//
/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The primary view controller for this app.
*/
import UIKit

private let cellIdentifier = "MY_CELL"

@objc(ViewController)
class ViewController: UICollectionViewController {
    var cellCount: Int = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellCount = 20
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapGesture(_:)))
        self.collectionView!.addGestureRecognizer(tapRecognizer)
        self.collectionView!.registerClass(Cell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView!.reloadData()
        self.collectionView!.backgroundColor = UIColor.whiteColor()
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellCount
    }

    override func collectionView(cv: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        return cell
    }

    func handleTapGesture(sender: UITapGestureRecognizer) {

        if sender.state == .Ended {
            let initialPinchPoint = sender.locationInView(self.collectionView)
            if let tappedCellPath = self.collectionView!.indexPathForItemAtPoint(initialPinchPoint) {

                self.cellCount = self.cellCount - 1
                self.collectionView!.performBatchUpdates({
                    self.collectionView!.deleteItemsAtIndexPaths([tappedCellPath])
                }, completion: nil)
            } else {
                self.cellCount = self.cellCount + 1
                self.collectionView!.performBatchUpdates({
                    self.collectionView!.insertItemsAtIndexPaths([NSIndexPath(forItem: 0, inSection: 0)])
                }, completion: nil)
            }
        }
    }

}