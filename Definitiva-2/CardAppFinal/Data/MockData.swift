import Foundation

class MockData {
    
    static let shared = MockData()

    private init() {
        personas = loadPersonas()
        users = loadUsers()
        deckYugi = loadCardYugi()
        deckPokemon = loadCardPokemon()
        deckMagic = loadCardMagic()
        ofertas = loadOfertas()
        
    }
    
    var collectionDeck: [Carta] = []
    var collectionUser: [Carta] = []
    
    var deckPokemon: [Carta] = []
    var deckYugi: [Carta] = []
    var deckMagic: [Carta] = []
    
    var personas: [Persona] = []
    var users: [Persona] = []
    
    var ofertas: [Oferta] = []
    
    
    
    func loadOfertas() -> [Oferta] {
       let filename = "ofertas.json"
       var data: Data
       
       
       guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
       else {
               fatalError("Couldn't find \(filename) in main bundle.")
       }
           
       do {
               data = try Data(contentsOf: file)
       } catch {
               fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
       }
       
       
       do {
           let decoder = JSONDecoder()
           return try decoder.decode([Oferta].self, from: data)
       } catch {
           fatalError("Couldn't parse \(filename) as \(Oferta.self):\n\(error)")
       }
       
   }
    
    
    
    func loadUsers() -> [Persona] {
       let filename = "Users.json"
       var data: Data
       
       
       guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
       else {
               fatalError("Couldn't find \(filename) in main bundle.")
       }
           
       do {
               data = try Data(contentsOf: file)
       } catch {
               fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
       }
       
       
       do {
           let decoder = JSONDecoder()
           return try decoder.decode([Persona].self, from: data)
       } catch {
           fatalError("Couldn't parse \(filename) as \(Persona.self):\n\(error)")
       }
       
   }
    
    func loadPersonas() -> [Persona] {
       let filename = "personas.json"
       var data: Data
       
       
       guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
       else {
               fatalError("Couldn't find \(filename) in main bundle.")
       }
           
       do {
               data = try Data(contentsOf: file)
       } catch {
               fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
       }
       
       
       do {
           let decoder = JSONDecoder()
           return try decoder.decode([Persona].self, from: data)
       } catch {
           fatalError("Couldn't parse \(filename) as \(Persona.self):\n\(error)")
       }
       return [Persona]()
   }
    
    
    
     func loadCardPokemon() -> [Carta] {
        let filename = "Cards.json"
        var data: Data
        
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
            
        do {
                data = try Data(contentsOf: file)
        } catch {
                fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Carta].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(Carta.self):\n\(error)")
        }
        
    }
    
    
    func loadCardMagic() -> [Carta] {
       let filename = "CardsMagic.json"
       var data: Data
       
       
       guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
       else {
               fatalError("Couldn't find \(filename) in main bundle.")
       }
           
       do {
               data = try Data(contentsOf: file)
       } catch {
               fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
       }
       
       
       do {
           let decoder = JSONDecoder()
           return try decoder.decode([Carta].self, from: data)
       } catch {
           fatalError("Couldn't parse \(filename) as \(Carta.self):\n\(error)")
       }
       
   }
    
    func loadCardYugi() -> [Carta] {
       let filename = "CardsYugi.json"
       var data: Data
       
       
       guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
       else {
               fatalError("Couldn't find \(filename) in main bundle.")
       }
           
       do {
               data = try Data(contentsOf: file)
       } catch {
               fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
       }
       
       
       do {
           let decoder = JSONDecoder()
           return try decoder.decode([Carta].self, from: data)
       } catch {
           fatalError("Couldn't parse \(filename) as \(Carta.self):\n\(error)")
       }
       
   }
}
