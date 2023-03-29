//
//  ContentView.swift
//  WarCardGame
//
//  Created by Isaac Boothe on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "back"
    @State private var cpuCard = "back"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State var logoImage = Image("logos")
    @State var playerWins = ""
    @State var cpuWins = ""
    
    var body: some View {
        ZStack{
            Image("background")
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                //logoImage
                Button {
                    playerScore = 0
                    cpuScore = 0
                    playerWins = ""
                    cpuWins = ""
                    playerCard = "back"
                    cpuCard = "back"
                } label: {
                    Image("logo")
                }

                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    playerWins = ""
                    cpuWins = ""
                    //generate random numbers 2 thru 13
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    //update cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    if playerRand > cpuRand{
                        playerScore += 1
                        withAnimation(.easeIn(duration: 1/3)){
                           playerWins = "Winner"
                      }
                        cpuWins = ""
                        
                    }
                    else if playerRand < cpuRand{
                        cpuScore += 1
                        withAnimation(.easeIn(duration: 1/3)){
                            cpuWins = "Winner"
                        }
                        
                        playerWins = ""
                    }
                    else{
                        playerWins = ""
                        cpuWins = ""
                        print("nonsen")
                    }
                   
                } label: {
                    Image("dealbutton")
                }

                Spacer()
                
                HStack{
                    Spacer()
                    
                    VStack{
                        Text(playerWins)
                            .italic()
                            .foregroundColor(Color.white)
                            .padding(.bottom, 12.0)
                            
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                            
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    
                    VStack{
                        Text(cpuWins)
                            .italic()
                            .foregroundColor(Color.white)
                            .padding(.bottom, 12.0)
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
