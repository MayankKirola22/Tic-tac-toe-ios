//
//  Cell.swift
//  Tic Tac Toe
//
//  Created by May 2003 on 17/06/24.
//

import Foundation
import SwiftUI

struct Cell{
    var tile : Tile
    func displayTile()-> String{
        switch(tile){
        case Tile.Circle:
            return "0"
        case Tile.Cross:
            return "X"
        default:
            return " "
        }
    }
    func tileColor()-> Color{
        switch(tile){
        case Tile.Circle:
            return Color.red
        case Tile.Cross:
            return Color.black
        default:
            return Color.black
        }
    }
}
enum Tile{
    case Circle
    case Cross
    case Empty
}
