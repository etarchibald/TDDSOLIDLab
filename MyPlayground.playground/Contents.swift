
import Foundation

// MARK: Single Responsibility
protocol HasEngine: AnyObject {
  var isEngineOn: Bool { get set }
  func startEngine()
}

extension HasEngine {
  func startEngine() {
    isEngineOn = true
  }
}

//protocol HasMotor {
//  var hasCharge: <# Type #> { get }
//}

class Car: HasEngine {
  var isEngineOn: Bool
  init(isEngineOn: Bool) {
    self.isEngineOn = isEngineOn
  }
//  func startEngine() {
//    isEngineOn = true
//  }
}


// MARK: Open Closed Principle
protocol Vehicle {
  func calculateDoors() -> Int
}

class LiftedTruck: Vehicle {
  func calculateDoors() -> Int {
    return 4
  }
}

class SportsCar: Vehicle {
  func calculateDoors() -> Int {
    return 2
  }
}

class CalculateNumberOfDoors {
  var vehicles: [Vehicle]
  init(vehicles: [Vehicle]) {
    self.vehicles = vehicles
  }
  func totalNumberOfDoors() -> Int {
    var total = 0
    for vehicle in vehicles {
      total += vehicle.calculateDoors()
    }
    return total
  }
}


// MARK: Liskov Substitution Principle
class BigTruck: Car {
  func startEngine() {
    print("*Diesel Sound*")
  }
}

class SmolCar: Car {
//  override func startEngine() {
//    print("*Mouse squeaking Sound*")
//  }
}

func startYourEngines(car: Car) {
  car.startEngine()
}

let truck = BigTruck(isEngineOn: false)
truck.startEngine()
truck.isEngineOn

// MARK: Interface Segregation
protocol Carnivore {
  func chomp() -> String
}

protocol Herbivore {
  func munch() -> String
}

class TRex: Carnivore {
  func chomp() -> String {
    return "Just a nibble, I swear!"
  }
}

class Brontosaurus: Herbivore {
  func munch() -> String {
    return "Animals are friends not food."
  }
}

class Oviraptor: Brontosaurus, Carnivore {
  func chomp() -> String {
    return "When I feel like it."
  }
}

class DigestiveSystem {
}

let oviraptor = Oviraptor()
//oviraptor.chomp()
//oviraptor.munch()
//
