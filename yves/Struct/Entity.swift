class Entity {
    // Properties

    let letterMap: [Character: Int] = [
        "a": 1, "j": 1, "s": 1,
        "b": 2, "k": 2, "t": 2,
        "c": 3, "l": 3, "u": 3,
        "d": 4, "m": 4, "v": 4,
        "e": 5, "n": 5, "w": 5,
        "f": 6, "o": 6, "x": 6,
        "g": 7, "p": 7, "y": 7,
        "h": 8, "q": 8, "z": 8,
        "i": 9, "r": 9,
    ]

    private var _name: String
    private var _mappedNameArray: Array<Character>
    private var _total: Int

    // Getters and Setters
    var name: String {
        get { return _name }
        set {
            _name = newValue
            _total = calculateTotal() // Calculate total whenever name is set
            _mappedNameArray = mappedName() // Mapped named with numbers
        }
    }

    var total: Int {
        get { return _total }
    }
    
    var mappedNameValue: Array<Character> {
        get {return _mappedNameArray}
    }

    // Constructor
    init(name: String) {
        self._name = name
        self._total = 0
        self._mappedNameArray = []
        self._mappedNameArray = mappedName() // Map letters to number
        self._total = calculateTotal() // Calculate total when initializing
        
    }
    
    // Function to split the name into its characters
    private func mappedName() -> Array<Character> {
        let nameCharacters = Array(_name.folding(options: .diacriticInsensitive, locale: .current).lowercased())
        return nameCharacters
    }

    // Function to calculate total
    // doesn't handle ACCENT(ex: é)
    private func calculateTotal() -> Int {
        var total = 0
        for char in _mappedNameArray {
            if let value = letterMap[char] {
                total += value
            }
        }
        return total
    }
}
