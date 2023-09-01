import UIKit

class Person {
    var name: String
    var height: Double
    var weight: Double
    
    init(name: String, height: Double, weight: Double) {
        self.name = name
        self.height = height
        self.weight = weight
    }
    
    func toString() -> String {
        return "\(self.name) is \(self.height / 100) meterls tall and weighs \(self.weight) kilograms"
    }
}

let joao = Person(name: "joão", height: 192, weight: 82.4)

print(joao.toString())

class SoccerPlayer: Person {
    var position: String
    var team: SoccerTeam?
    
    init(name: String, height: Double, weight: Double, position: String) {
        self.position = position
        super.init(name: name, height: height, weight: weight)
    }
    
    func addTeam(_ team: SoccerTeam) {
        self.team = team
    }
    
    func hasTeam() -> String {
        if let currentTeam = self.team {
            return "Yes, \(self.name) plays for \(currentTeam.name)"
        } else {
            return "No, he is without a club"
        }
    }
    
    override func toString() -> String {
        return "\(self.name) is a soccer player and plays in the \(self.position) position"
    }
}

let ronaldinho = SoccerPlayer(name: "ronaldinho",
                              height: 170,
                              weight: 72.4,
                              position: "forward")

print(ronaldinho.toString())

class SoccerTeam {
    var name: String
    var country: String
    private var players: [SoccerPlayer] = []
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    func addPlayer(_ player: SoccerPlayer) {
        players.append(player)
        player.addTeam(self)
    }
    
    func countPlayers() -> Int {
        return players.count
    }
 }

let realMadrid = SoccerTeam(name: "Real Madrid", country: "Spain")

print("Team: ", realMadrid.name)
print("Country: ", realMadrid.country)
print("Count players real madrid: ", realMadrid.countPlayers())

let viniciusJunior = SoccerPlayer(name: "Vinicius junior",
                                  height: 176,
                                  weight: 70,
                                  position: "forward")

realMadrid.addPlayer(viniciusJunior)

print("Count players real madrid: ", realMadrid.countPlayers())
print("Vinicius junior has a team ?", viniciusJunior.hasTeam())




