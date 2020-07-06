//
//  ContentView.swift
//  Shared
//
//  Created by Shane Leigh on 05/07/2020.
//

import SwiftUI
import SpriteKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor (
            red:   .random(in: 0...1),
            green: .random(in: 0...1),
            blue:  .random(in: 0...1),
            alpha: 1.0
        )
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .random(), size: CGSize(width: 50, height: 50))
        box.position = location
        
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
    
}

struct ContentView: View {
    
//    @State private var reset = false
    
    var scene: SKScene {
        let scene = GameScene()
        
        scene.size = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 50)
        scene.scaleMode = .fill
        
        return scene
    }

    
    
    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 50)
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "swift")
                    Text("Replay")
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
