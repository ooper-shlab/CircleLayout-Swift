//
//  AppDelegate.swift
//  CircleLayout
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/8/1.
//
//
/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
Simple app delegate.
*/
import UIKit

@UIApplicationMain
@objc(AppDelegate)
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var viewController: ViewController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        viewController = ViewController(collectionViewLayout: CircleLayout())

        self.window!.rootViewController = self.viewController

        self.window!.makeKeyAndVisible()
        return true
    }


}
