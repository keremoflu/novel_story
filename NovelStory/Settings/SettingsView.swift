//
//  SettingsView.swift
//  NovelStory
//
//  Created by Kerem on 19.07.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            
            Form {
                
                Section("Credits") {
                    LabeledContent("Current Credit", value: "3440")
                        .withEvent(viewModel: settingsViewModel, event: .currentCredit)
                }
                
                Section("General") {
                    Text("Privacy Policy")
                        .withEvent(viewModel: settingsViewModel, event: .privacyPolicy)
                    Text("Terms of Use")
                        .withEvent(viewModel: settingsViewModel, event: .termsOfUse)
                    Text("Contact us")
                        .withEvent(viewModel: settingsViewModel, event: .contactUs)
                    Text("Restore Purchase")
                        .withEvent(viewModel: settingsViewModel, event: .restorePurchase)
                    
                }
                
                Section("Feedback") {
                    Text("Rate Us")
                        .withEvent(viewModel: settingsViewModel, event: .rateUs)
                    Text("Write a Review")
                        .withEvent(viewModel: settingsViewModel, event: .writeReview)
                    Text("Share App")
                        .withEvent(viewModel: settingsViewModel, event: .shareApp)
                    
                    Text("Restore Purchase")
                        .withEvent(viewModel: settingsViewModel, event: .restorePurchase)
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Deneme")
    }
    
}

extension View {
    func withEvent(viewModel: SettingsViewModel, event: SettingsViewModel.ButtonEvent) -> some View {
        self
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.handleButtonEvent(event: event)
            }
    }
}

#Preview {
    SettingsView(settingsViewModel: SettingsViewModel())
}
