//
//  Settings.swift
//  HP Trivia
//
//  Created by Muharrem Efe Çayırbahçe on 2.01.2025.
//

import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var store: Store
    
    var body: some View {
        ZStack {
            InfoBackgroundImage()
            
            VStack {
                Text("Which books would you like to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding(.horizontal)
            
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(0..<7) { i in
                            if store.books[i] == .active || (store.books[i] == .locked && store.purchasedIDs.contains("hp\(i+1)")) {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("hp\(i + 1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .foregroundColor(.green)
                                        .shadow(radius: 4)
                                        .padding(3)
                                }
                                .task {
                                    store.books[i] = .active
                                    store.saveStatus()
                                }
                                .onTapGesture {
                                    store.books[i] = .inactive
                                    store.saveStatus()
                                }
                            } else if store.books[i] == .inactive {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("hp\(i + 1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                        .overlay(Rectangle().foregroundColor(.black).opacity(0.5))
                                    
                                    Image(systemName: "circle")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .foregroundColor(.green.opacity(0.5))
                                        .shadow(radius: 4)
                                        .padding(3)
                                }
                                .onTapGesture {
                                    store.books[i] = .active
                                    store.saveStatus()
                                }
                            } else {
                                ZStack {
                                    Image("hp\(i + 1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                        .overlay(Rectangle().foregroundColor(.black).opacity(0.75))
                                    
                                    Image(systemName: "lock.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .shadow(color: .white.opacity(0.75) , radius: 4)
                                }
                                .onTapGesture {
                                    let product = store.products[i-3]
                                    
                                    Task {
                                        await store.purchase(product)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                Button("Done") {
                    dismiss()
                }
                .doneButton()
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    Settings()
        .environmentObject(Store())
}
