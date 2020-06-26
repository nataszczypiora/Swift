import UIKit

var str = "Hello, playground"

enum wybor:Int
{
case jedwab = 0 , bawelna = 1, welna = 3
    mutating func next()
    {
        switch self {
        case .jedwab:
            self = .bawelna
        case .bawelna:
            self = .welna
        case .welna:
            self = .welna
        }
    }
    mutating func set(a:Int)
    {
        switch a{
        case 0:
            self = .jedwab
        case 1:
            self = .bawelna
        case 2:
            self = .welna
        default:
            self = .jedwab
        }
    }
}

class Silnik
{
    var obr: Obroty
    var pom: Pompa
    init(temp: Int, szybkosc: Int) {
        print("ustawianie obrotow i pompy na temperature: ", temp, " i predkosc: ", szybkosc)
        obr = Obroty(s: szybkosc)
        pom = Pompa(t: temp)
    }
}
class Obroty
{
    var obr: Int
    init(s: Int) {
        obr = s
        print("Obroty ustawiaja sie na predkosc ", s)
    }
}
class Pompa
{
    var temp: Int
    init(t: Int) {
        temp = t
        print("Pompa ustawia temperature wody na: ", t)
    }
}
class Wejscie
{
    var wys: Wyswietlacz
    var ster: Sterownik
    var wyj: Wyjscie
    
    init(ubrania: String) {
        switch ubrania {
            case "jedwab":
                wys = Wyswietlacz(wybrane: 0)
            case "bawelna":
                wys = Wyswietlacz(wybrane: 1)
            case "welna":
                wys = Wyswietlacz(wybrane: 2)
            default:
                wys = Wyswietlacz(wybrane: 0)
                wys.prog.zwroc_oba()
        }
        ster = Sterownik(temp: self.wys.prog.zwroc_temperature(), szybkosc: self.wys.prog.zwroc_szybkosc())
        wyj = Wyjscie(ubr: ubrania)
    }
    
}
class Wyjscie
{
    var ubrania: String
    init(ubr: String) {
        ubrania = ubr
        print("Oto czyste ubrania z: ", ubr)
    }
}
class Sterownik
{
    var sil: Silnik
    init(temp: Int, szybkosc: Int) {
        sil = Silnik(temp: temp, szybkosc: szybkosc)
    }
}
class Wyswietlacz
{
    var wyswietl = "Mozliwy wybor:\n(1) jedwab\n(2) bawelna\n(3) welna\n"
    var wyb = 0;
    var prog: Programy
    init(wybrane:Int)
    {
        print(wyswietl)
        prog =  Programy(wyb: wybrane)
    }
}
class Programy
{
    var szybkosc = 0
    var temperatura = 0
    var prog = wybor.jedwab
    init(wyb: Int) {
        prog.set(a: wyb)
        switch prog
        {
        case .bawelna:
            szybkosc = 600
            temperatura = 40
        case .jedwab:
            szybkosc = 300
            temperatura = 30
        case .welna:
            szybkosc = 600
            temperatura = 60
        }
        print("Szybkosc: ", szybkosc, "\t temperatura: ", temperatura)
    }
    
    func zwroc_szybkosc() ->(Int)
    {
        return self.szybkosc
    }
    func zwroc_temperature() ->(Int)
    {
        return self.temperatura
    }
    func zwroc_oba() ->(Int, Int)
    {
        return (self.szybkosc, self.temperatura)
    }
   
}
class Pralka
{
    var wej: Wejscie
    init() {
        wej = Wejscie(ubrania: "bawelna")
    }
}

var pr = Pralka()
