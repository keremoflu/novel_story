//
//  HomeView.swift
//  NovelStory
//
//  Created by Batuhan Tibet Ayaydin on 5.07.2025.
//

import Foundation
import SwiftUI

struct HomePage: View {
    private let viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        ZStack {
            LinearTop()
            ScrollView {
                VStack(spacing: 16) {
                    weeklyListView
                    divider
                    editorsPickView
                }
            }
        }
    }

    private var weeklyListView: some View {
        VStack(alignment: .leading, spacing: 8) {
            headerView

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    ForEach(0..<10) { _ in
                        TrendingBookListItem()
                            .frame(width: UIScreen.main.bounds.width / (UIDevice.current.userInterfaceIdiom == .pad ? 5 : 3.2))
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private var divider: some View {
        Rectangle()
            .fill(Color.themeGray)
            .frame(height: UIScreen.main.bounds.height * 0.01)
    }

    private var editorsPickView: some View {
        VStack(alignment: .leading, spacing: 8) {
            headerView
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<10) { _ in
                        VStack(spacing: 12) {
                            ForEach(0..<3) { _ in
                                EditorsPickBookListItem()
                                    .frame(
                                        width: UIScreen.main.bounds.width / (UIDevice.current.userInterfaceIdiom == .pad ? 2 : 2),
                                        height: UIScreen.main.bounds.width / (UIDevice.current.userInterfaceIdiom == .pad ? 5 : 4)
                                    )
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private var headerView: some View {
        HStack {
            Text(viewModel.weeklyTitle)
                .font(.montserrat(size: 16, weight: .semiBold))
                .foregroundStyle(.themePrimary)
            Spacer()
            Text(viewModel.supriseBoxTitle)
                .font(.montserrat(size: 16, weight: .semiBold))
        }
        .padding(.horizontal)
    }
}




#Preview {
    HomePage()
}



