//
//  HomeStatsView.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 12/2/21.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(idealWidth: UIScreen.main.bounds.width / 3,
                           maxWidth: UIScreen.main.bounds.width / 3)
                    .fixedSize(horizontal: true, vertical: false)
            }
        }
        .frame(idealWidth: UIScreen.main.bounds.width,
               maxWidth: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
