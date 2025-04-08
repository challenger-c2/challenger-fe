import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .challenges
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.11, green: 0.11, blue: 0.2, alpha: 1.0))
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                tabContent
                    .padding(.bottom, 0)
                
                TabBarView(selectedTab: $selectedTab)
            }
        }
    }
    
    @ViewBuilder
    private var tabContent: some View {
        switch selectedTab {
        case .challenges:
            ChallengesView()
        case .add:
            AddChallengeView()
        case .history:
            HistoryChallengesView()
        }
    }
}

struct AddChallengeView: View {
    var body: some View {
        VStack {
            Text("도전 추가")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            Spacer()
        }
    }
}

struct HistoryChallengesView: View {
    var body: some View {
        VStack {
            Text("지난 도전")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
