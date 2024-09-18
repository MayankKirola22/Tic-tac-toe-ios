import SwiftUI

struct ContentView: View {
    @StateObject var gameState = GameState()
    var body: some View {
        let borderSize = CGFloat(5)
        VStack(){
            VStack(){
                VStack(){
                    Text("Score").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    HStack(){
                        Text("Circle : \(gameState.CircleScore)")
                        Spacer()
                        Text("Cross : \(gameState.CrossScore)")
                    }.font(.system(size: 25)).padding(20)
                }.padding(50)
                Text("\(gameState.turn)'s turn").font(.system(size: 30)).bold()
            }.padding(10)
            VStack (spacing: borderSize){
                ForEach(0...2,id:\.self){
                    row in
                    HStack(spacing: borderSize){
                        ForEach(0...2,id:\.self){
                            column in
                            
                            let cell = gameState.board[row][column]
                            
                            Text(cell.displayTile()).font(.system(size: 60)).bold().foregroundColor(cell.tileColor()).frame(maxWidth:100,maxHeight: 100).aspectRatio(1,contentMode: .fit).background(Color.white).onTapGesture {
                                gameState.placeTile(row,column)
                            }
                        }
                    }
                }
            }.background(Color.black).alert(isPresented: $gameState.showAlert){
                Alert(title: Text(gameState.alertMessage),dismissButton: .default(Text("OK")){
                    gameState.resetBoard()
                })
            }
            Spacer()
    
        }
    }
}

#Preview {
    ContentView()
}
