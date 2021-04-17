import SpriteKit
import SwiftUI

class HouseSKScene: SKScene {
    var sharedModel: SharedModel!
    
    var person: SKSpriteNode!
    var doorTop: SKSpriteNode!
    var doorBottom: SKSpriteNode!
    
    var highlightedObject: SKSpriteNode? = nil
    var actionableObjects = Set<SKSpriteNode>()
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: Layout.width, height: Layout.height)
        background.zPosition = -1
        addChild(background)
        
        doorTop = SKSpriteNode(color: .black, size: CGSize(width: 60, height: 116))
        doorTop.position = CGPoint(x: 250, y: 393)
        actionableObjects.insert(doorTop)
        addChild(doorTop)
        
        doorBottom = SKSpriteNode(color: .black, size: CGSize(width: 60, height: 116))
        doorBottom.position = CGPoint(x: 250, y: 178)
        actionableObjects.insert(doorBottom)
        addChild(doorBottom)
        
        let bed = SKSpriteNode(imageNamed: "bed.png")
        bed.position = CGPoint(x: 590, y: 345)
        bed.size = CGSize(width: 135, height: 90)
        bed.name = NodeNames.bed
        actionableObjects.insert(bed)
        addChild(bed)
        
        let yogaMat = SKSpriteNode(imageNamed: "yogaMat.png")
        yogaMat.position = CGPoint(x: 400, y: 100)
        yogaMat.size = CGSize(width: 160, height: 16)
        yogaMat.zPosition = 0
        yogaMat.name = NodeNames.yogaMat
        actionableObjects.insert(yogaMat)
        addChild(yogaMat)
        
        let piano = SKSpriteNode(imageNamed: "piano.png")
        piano.position = CGPoint(x: 585, y: 140)
        piano.size = CGSize(width: 125, height: 84)
        piano.zPosition = 0
        piano.name = NodeNames.piano
        actionableObjects.insert(piano)
        addChild(piano)
        
        let workTable = SKSpriteNode(imageNamed: "workTable.png")
        workTable.position = CGPoint(x: 405, y: 355)
        workTable.size = CGSize(width: 155, height: 90)
        workTable.zPosition = 0
        workTable.name = NodeNames.workTable
        actionableObjects.insert(workTable)
        addChild(workTable)
        
        person = SKSpriteNode(imageNamed: "characterRight.png")
        person.size = CGSize(width: 40, height: 100)
        person.position = sharedModel.personPosition
        person.zPosition = 1
        person.constraints = [SKConstraint.positionX(SKRange(lowerLimit: 160 + person.frame.width / 2, upperLimit: 657 - person.frame.width / 2))]
        addChild(person)
    }
    
    override func update(_ currentTime: TimeInterval) {
        getIntersectingObject()
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case KeyCodeMap.left.rawValue:
            person.texture = SKTexture(imageNamed: "characterLeft")
            person.run(SKAction.moveBy(x: -12, y: 0, duration: 0.1))
            
        case KeyCodeMap.right.rawValue:
            person.texture = SKTexture(imageNamed: "characterRight")
            person.run(SKAction.moveBy(x: 12, y: 0, duration: 0.1))
            
        case KeyCodeMap.enter.rawValue:
            if let node = highlightedObject {
                if node == doorBottom {
                    person.run(SKAction.moveBy(x: 0, y: 215, duration: 0.1))
                } else if node == doorTop {
                    person.run(SKAction.moveBy(x: 0, y: -215, duration: 0.1))
                } else {
                    sharedModel.personPosition = person.position
                    withAnimation {
                        sharedModel.page = node.name ?? ""
                    }
                }
            }
            
        default: return
        }
    }
    
    func getIntersectingObject() {
        var intersecting = false
        
        for node in actionableObjects {
            if node.intersects(person) {
                intersecting = true
                // If passing through same object, return
                if node == highlightedObject {
                    return
                }
                // Else, dehighlight previous object and highlight the new object
                else {
                    highlightedObject?.colorBlendFactor = 0
                    if highlightedObject == doorBottom || highlightedObject == doorTop {
                        highlightedObject?.color = .black
                    }
                    
                    highlightedObject = node
                    var action = SKAction.colorize(with: .red, colorBlendFactor: 0.5, duration: 0.25)
                    if highlightedObject == doorBottom || highlightedObject == doorTop {
                        action = SKAction.colorize(with: .lightGray, colorBlendFactor: 0.1, duration: 0.25)
                    }
                    node.run(action)
                }
            }
        }
        
        if !intersecting {
            highlightedObject = nil
            actionableObjects.forEach {
                $0.colorBlendFactor = 0
                if $0 == doorBottom || $0 == doorTop {
                    $0.color = .black
                }
            }
        }
    }
}
