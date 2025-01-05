//
//  Instructions.swift
//  HP Trivia
//
//  Created by Muharrem Efe Çayırbahçe on 2.01.2025.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            InfoBackgroundImage()
            
            VStack {
                Image("appiconwithradius")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                ScrollView {
                    Text("How to Play").font(.largeTitle).bold().padding()
                    
                    VStack {
                        Text("Welcome to HP Trivia! In this game, you will be asked random questions from the HP books and you must guess the right answer or you will lose points! 😱")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question is worth 5 points, but if you guess a wrong answer, you lose 1 points! 😭")
                            .padding([.horizontal, .bottom])
                        
                        Text("If you are struggling with a question, there is an opiton to reveal a hint or reveal the book that answers the question. But beware! Using these also minuses 1 point each! 😈")
                            .padding([.horizontal, .bottom])
                        
                        Text("When you select the correct answer, you will be awarded all the points left for that question and they will be added to your total score! 🎉")
                            .padding([.horizontal, .bottom])
                        
                        Text("Good luck! 🍀")
                            .fontWeight(.bold)
                            .padding([.horizontal, .bottom])
                    }
                    .padding()
                }
                .foregroundColor(.black)
                
                Button("Done") {
                    dismiss()
                }
                .doneButton()
            }
        }
    }
}

#Preview {
    Instructions()
}
