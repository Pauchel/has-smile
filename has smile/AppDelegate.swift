//
//  AppDelegate.swift
//  has smile
//
//  Created by 山田　怜音 on 2019/01/30.
//  Copyright © 2019 山田　怜音. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        //ここに初期化処理を書く
        //Userdefaultを使ってフラグを維持する
        let UserDefault = UserDefaults.standard
        //"firsrlunch"をキーにBool型の形を維持する
        let dict = ["firstLanch" : true]
        //デフォルト値登録
        //すでに値が更新されていた場合は、更新後そのままの値になる
        UserDefault.register(defaults: dict)
        
        //firstlunchにき紐づく値がtureなら値をfalseに更新して処理を行う
        if UserDefault.bool(forKey: "firstLanch") {
            UserDefault.set(false, forKey: "firstLanch" )
            print("初回起動のみ表示")
        }
        
        print("初回起動じゃなくても呼ばれるアプリ起動時の処理")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

