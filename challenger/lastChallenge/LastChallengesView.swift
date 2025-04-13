import SwiftUI

struct LastChallengesView: View {
    let completedChallenges: [CompletedChallenge] = [
        CompletedChallenge(
            id: "1",
            title: "1000권 책 읽기",
            description: "3년 동안 다양한 분야의 책을 읽고 독서 습관을 형성하는 도전입니다. 하루에 한 권 이상 읽지 않고 꾸준히 3년 동안 책을 읽었습니다.",
            duration: "3년",
            completionRate: 1.0
        ),
        CompletedChallenge(
            id: "2",
            title: "매일 1시간 운동하기",
            description: "6개월 동안 매일 1시간씩 운동하는 도전입니다. 다양한 운동을 시도하며 체력을 기르고 건강한 습관을 형성했습니다.",
            duration: "6개월",
            completionRate: 1.0
        ),
        CompletedChallenge(
            id: "3",
            title: "매일 명상 10분",
            description: "3개월 동안 매일 10분씩 명상하는 도전입니다. 다양한 명상법을 시도하며 마음의 안정을 찾고 집중력을 향상시켰습니다.",
            duration: "3개월",
            completionRate: 1.0
        )
    ]
    
    var body: some View {
        ZStack {
            StarryBackgroundView()
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("완료한 도전 : 총 \(completedChallenges.count)개")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .padding(.bottom, 30)
                }
                .padding(.horizontal, 20)
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(completedChallenges) { challenge in
                            CompletedChallengeCard(challenge: challenge)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct CompletedChallenge: Identifiable {
    let id: String
    let title: String
    let description: String
    let duration: String
    let completionRate: Double
}

struct CompletedChallengeCard: View {
    let challenge: CompletedChallenge
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(challenge.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text(challenge.description)
                .font(.system(size: 15))
                .foregroundColor(Color.white.opacity(0.7))
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack(alignment: .center) {
                ProgressBarView(percentage: challenge.completionRate)
                    .frame(width: 150, height: 12)
                
                Text("100% 완료!")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color(UIColor(red: 0.4, green: 0.8, blue: 0.4, alpha: 1.0)))
                
                Spacer()
                
                Button(action: {
                    print("공유하기: \(challenge.title)")
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 14))
                        Text("공유")
                            .font(.system(size: 14, weight: .medium))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(UIColor(red: 0.35, green: 0.35, blue: 0.5, alpha: 1.0)),
                                Color(UIColor(red: 0.25, green: 0.25, blue: 0.4, alpha: 0.95))
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
                    )
                    .cornerRadius(18)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(UIColor(red: 0.15, green: 0.15, blue: 0.25, alpha: 0.8)),
                    Color(UIColor(red: 0.12, green: 0.12, blue: 0.22, alpha: 0.7))
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
        )
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct ProgressBarView: View {
    let percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(UIColor(red: 0.3, green: 0.35, blue: 0.45, alpha: 0.5)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    )
                
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: min(CGFloat(percentage) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor(red: 0.5, green: 0.9, blue: 0.5, alpha: 1.0)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.0),
                                        Color.white.opacity(0.2),
                                        Color.white.opacity(0.0)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: min(CGFloat(percentage) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    )
                    .shadow(color: Color(UIColor(red: 0.3, green: 0.7, blue: 0.4, alpha: 0.5)), radius: 3, x: 0, y: 0)
            }
        }
    }
}

struct LastChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        LastChallengesView()
    }
}
