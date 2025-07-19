//
//  SettingsViewModel.swift
//  NovelStory
//
//  Created by Kerem on 19.07.2025.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    @Published var userCurrentCredit: Int = 100
    @Environment(\.openURL) var openURL
    
    enum ButtonEvent {
        case currentCredit
        case privacyPolicy
        case termsOfUse
        case contactUs
        case restorePurchase
        case rateUs
        case writeReview
        case shareApp
    }
    
    func setCurrentCredit (to credit: Int) {
        self.userCurrentCredit = credit
    }
    
    func handleButtonEvent(event: ButtonEvent) {
        switch event {
            
        case .currentCredit:
            print("credit or main paywall")
            
        case .privacyPolicy:
            break
        case .termsOfUse:
            openURLSafari(url: URL(string: "https://sites.google.com/view/privacypolicy-pdfscannerapp/ana-sayfa"))
        case .contactUs:
            print("xontact")
        case .restorePurchase:
            break
        case .rateUs:
            break
        case .writeReview:
            break
        case .shareApp:
            break
        }
    }
    
    private func openURLSafari(url: URL?) {
        guard let url else {
            print("URL is not valid!")
            return
        }
        
        openURL(url)
    }
    
}
