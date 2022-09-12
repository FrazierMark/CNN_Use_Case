//
//  CNNUseCaseApp.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import SwiftUI

@main
struct MyNewTestApp_Watch_AppApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self) var extensionDelegate
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            TabView {
                MenuView()
                CoreView()
                AssuranceView()
            }
        }
    }
}
