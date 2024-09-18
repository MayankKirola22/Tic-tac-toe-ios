import Foundation

class GameState:ObservableObject{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var CircleScore = 0
    @Published var CrossScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    var tilesFilled = 0
    init(){
        resetBoard()
    }
    func resetBoard(){
        var newBoard = [[Cell]]()
        
        for _ in 0...2{
            var row = [Cell]()
            for _ in 0...2{
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
        turn = Tile.Cross
        tilesFilled = 0
    }
    func placeTile(_ row: Int,_ column: Int){
        
        if(board[row][column].tile != Tile.Empty){
            return
        }
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Circle
        tilesFilled+=1
        if checkVictory() {
            if turn == Tile.Cross{
                CrossScore+=1
            }
            else{
                CircleScore+=1
            }
            let winner = turn == Tile.Cross ? "Cross" : "Circle"
            showAlert = true
            alertMessage = "\(winner) Win!"
        }else if checkForDraw(){
            showAlert = true
            alertMessage = "Game Draw!"
        }
        else{
            turn = turn == Tile.Cross ? Tile.Circle : Tile.Cross
        }
        func checkForDraw()->Bool{
            if tilesFilled==9{
                return true
            }
            else {
                return false
            }
        }
        
        func checkVictory()->Bool{
            // Vertical
            if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0){
                return true
            }
            if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1){
                return true
            }
            if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2){
                return true
            }
            
            // Horizontal
            if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2){
                return true
            }
            if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2){
                return true
            }
            if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2){
                return true
            }
            
            // Diagonal
            if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2){
                return true
            }
            if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0){
                return true
            }
            
            return false
        }
        
        func isTurnTile(_ row: Int, _ column: Int)->Bool{
            return board[row][column].tile == turn
        }
    }
}
