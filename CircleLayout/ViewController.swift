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
        self.collectionView!.register(Cell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView!.reloadData()
        self.collectionView!.backgroundColor = UIColor.white
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellCount
    }

    override func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        return cell
    }

    func handleTapGesture(_ sender: UITapGestureRecognizer) {

        if sender.state == .ended {
            let initialPinchPoint = sender.location(in: self.collectionView)
            if let tappedCellPath = self.collectionView!.indexPathForItem(at: initialPinchPoint) {

                self.cellCount = self.cellCount - 1
                self.collectionView!.performBatchUpdates({
                    self.collectionView!.deleteItems(at: [tappedCellPath])
                }, completion: nil)
            } else {
                self.cellCount = self.cellCount + 1
                self.collectionView!.performBatchUpdates({
                    self.collectionView!.insertItems(at: [IndexPath(item: 0, section: 0)])
                }, completion: nil)
            }
        }
    }

}
