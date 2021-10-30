//
//  ContentView.swift
//  ticTacToe WatchKit Extension
//
//  Created by Vivek Bhookya on 10/29/21.
//

import SwiftUI

var placeHolder = ""
var player = "0";
var board = [
    ["","",""],
    ["","",""],
    ["","",""]
]

func checkForGameWinner() -> Bool {
    // Horizontal
    return (
            (board[0][0].count > 0 && board[0][0] == board[0][1] && board[0][0] == board[0][2]) ||
            (board[1][0].count > 0 && board[1][0] == board[1][1] && board[1][0] == board[1][2]) ||
            (board[2][0].count > 0 && board[2][0] == board[2][1] && board[2][0] == board[2][2]) ||
            
            // Vertical
            (board[0][0].count > 0 && board[0][0] == board[1][0] && board[0][0] == board[2][0]) ||
            (board[0][1].count > 0 && board[0][1] == board[1][1] && board[0][1] == board[2][1]) ||
            (board[0][2].count > 0 && board[0][2] == board[1][2] && board[0][2] == board[2][2]) ||
            
            // Diagonal
            (board[0][0].count > 0 && board[0][0] == board[1][1] && board[0][0] == board[2][2]) ||
            (board[0][2].count > 0 && board[0][2] == board[1][1] && board[0][2] == board[2][0])
    )
}

func checkForDraw() -> Bool {
    // every slot has a value AND the game is not won
    return (
        board[0][0].count > 0 && board[0][1].count > 0 && board[0][2].count > 0 &&
        board[1][0].count > 0 && board[1][1].count > 0 && board[1][2].count > 0 &&
        board[2][0].count > 0 && board[2][1].count > 0 && board[2][2].count > 0
    ) && (!checkForGameWinner())
}

func evaluateBoard(x: Int, y: Int) -> Color {
    let value = board[x][y];
    
    // Initial coloring
    if (value == "") {
        return Color.black;
    }
    else if (value == "0") {
        print("should be pink!")
        return Color.pink
    }
    else {
        return Color.blue
    }
}

func markBoard(markX: Int, markY: Int) -> Void {
    if (board[markX][markY] == "") {
        board[markX][markY] = player;
    }
    
    if (player == "0") {
        player = "1"
    }
    else {
        player = "0"
    }
    
    print(board)
    //    checkForGameWinner() TODO
    
    //    evaluateBoard(x: markX, y: markY)
}

struct ContentView: View {
    @State private var one = ""
    @State private var two = ""
    @State private var three = ""
    @State private var four = ""
    @State private var five = ""
    @State private var six = ""
    @State private var seven = ""
    @State private var eight = ""
    @State private var nine = ""
    
    @State private var playerState = false;
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    // https://www.ioscreator.com/tutorials/swiftui-divider-tutorial
                    HStack {
                        Button(action: {
                            if (self.one.count > 0 || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:0, markY:0)
                            self.one.append(playerState ? "x" : "o")
                            playerState.toggle()
                            print(board[0][0])
                            
                        }) {
                            Text(self.one)
                            //                        Text("")
                        }
                        .background(evaluateBoard(x:0, y:0))
                        .cornerRadius(50)
                        
                        Button(action: {
                            if (self.two.count > 0  || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:0, markY:1)
                            self.two.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.two)
                        }
                        .background(evaluateBoard(x:0, y:1))
                        .cornerRadius(50)
                        
                        Button(action: {
                            if (self.three.count > 0  || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:0, markY:2)
                            self.three.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.three)
                        }
                        .background(evaluateBoard(x:0, y:2))
                        .cornerRadius(50)
                    }
                }
                
                Group {
                    // https://www.ioscreator.com/tutorials/swiftui-divider-tutorial
                    HStack {
                        Button(action: {
                            if (self.four.count > 0  || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:1, markY:0)
                            self.four.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.four)
                        }
                        .background(evaluateBoard(x:1, y:0))
                        .cornerRadius(50)
                        
                        Button(action: {
                            if (self.five.count > 0 || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:1, markY:1)
                            self.five.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.five)
                        }
                        .background(evaluateBoard(x:1, y:1))
                        .cornerRadius(50)
                        
                        Button(action: {
                            if (self.six.count > 0 || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:1, markY:2)
                            self.six.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.six)
                        }
                        .background(evaluateBoard(x:1, y:2))
                        .cornerRadius(50)
                    }
                }
                
                Group {
                    // https://www.ioscreator.com/tutorials/swiftui-divider-tutorial
                    HStack {
                        Button(action: {
                            if (self.seven.count > 0 || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:2, markY:0)
                            self.seven.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.seven)
                        }
                        .background(evaluateBoard(x:2, y:0))
                        .cornerRadius(50)
                        
                        Button(action: {
                            if (self.eight.count > 0 || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:2, markY:1)
                            self.eight.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.eight)
                        }
                        .background(evaluateBoard(x:2, y:1))
                        .cornerRadius(50)
                        
                        Button(action: {
                            if (self.nine.count > 0 || checkForGameWinner()) {
                                return
                            }
                            markBoard(markX:2, markY:2)
                            self.nine.append(playerState ? "x" : "o")
                            playerState.toggle()
                        }) {
                            Text(self.nine)
                        }
                        .background(evaluateBoard(x:2, y:2))
                        .cornerRadius(50)
                    }
                }
                
                Divider()
                
//                if (checkForGameWinner() || checkForDraw()) {
                    Group {
                        Button(action: {
                            // reset everything i guess
                            placeHolder = ""
                            player = "0";
                            board = [
                                ["","",""],
                                ["","",""],
                                ["","",""]
                            ]
                            
                            self.one = ""
                            self.two = ""
                            self.three = ""
                            self.four = ""
                            self.five = ""
                            self.six = ""
                            self.seven = ""
                            self.eight = ""
                            self.nine = ""
                            self.playerState = false
                        }) {
                            if (checkForDraw()) {
                                Text("Draw.\nNew game?")
                            }
                            else if (checkForGameWinner()) {
                                Text("Good job.\nNew game?")
                            }
                            else {
                                Text("Reset game?")
                            }
                        }
                    }
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
