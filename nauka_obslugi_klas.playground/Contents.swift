import UIKit

enum Stan{
    case Zly, Lakomy, Zmeczony, Wykonczony
    mutating func next()
    {
        switch self {
        case .Zly:
            self = .Lakomy
        case .Lakomy:
            self = .Zmeczony
        case .Zmeczony:
            self = .Wykonczony
        case .Wykonczony:
            self = .Wykonczony
        }
    }
}
struct Owca
{
    var zycie:Bool = true
    var siarka:Int
    func becz()
    {
        print("Owca: beee")
    }
}

struct Smok
{
    var ilosc_siarki = 0
    var stan = Stan.Zly
    func powitaj(mieszkanca m: Mieszkaniec)
    {
        switch stan {
        case .Zly:
            print("Smok: FRUUUUU (OGIEN)")
            m.przypal()
        case .Zmeczony:
            print("Smok:TUR TUR (LEKKI OGIEN)")
            m.lekkoprzypal()
        case .Wykonczony:
            print("Smok -> (x.x)")
            m.radosc()
        default:
            m.przypal()
        }
    }
    mutating func zjedz(owce o: Owca)
    {
        self.ilosc_siarki += o.siarka
        if(self.ilosc_siarki >= 20)
        {
            self.stan = .Wykonczony
        }else if(self.ilosc_siarki >= 10)
        {
            self.stan = .Zmeczony
        }
    }
}

struct Mieszkaniec
{
    func powitaj(smoka s: Smok)
    {
        print("Mieszkaniec: Witaj smoku")
        s.powitaj(mieszkanca: self)
    }
    func przypal(){
        print("Mieszkaniec: Auuu! Nie czuje nog, juz nigdy nie zaspiewam w operze")
    }
    func lekkoprzypal(){
        print("Mieszkaniec: nie jest tak zle, prawie jak sauna")
    }
    func radosc()
    {
        print("Przeżyte! Weee!")
    }
}

struct Szewc
{
    mutating func daj_owce(smokowi s:inout Smok, owce o: Owca)
    {
        print("Szewc: Oto dar dla Ciebie czcigodny stworze")
        s.zjedz(owce: o)
        if(s.stan != .Wykonczony)
        {
            print("Smok: mniam mniam mniamś")
            print("Smok: Moze byc, a teraz spadaj")
        }else
        {
            print("Smok: Idz juz stad, nie widzisz ze zgonuje")
        }
    }
}

var stado = [Owca(siarka:2),
Owca(siarka:1),
Owca(siarka:1),
Owca(siarka:2),
Owca(siarka:3),
Owca(siarka:2),
Owca(siarka:1),
Owca(siarka:2),
Owca(siarka:1),
Owca(siarka:2),
Owca(siarka:1),
Owca(siarka:5),
Owca(siarka:2),
Owca(siarka:1),
Owca(siarka:2),
Owca(siarka:1),
Owca(siarka:2),
Owca(siarka:5),
Owca(siarka:5)]

var motloch = Mieszkaniec()
var smoczek = Smok()
var Dratewka = Szewc()
motloch.powitaj(smoka: smoczek)

for owca in stado
{
    Dratewka.daj_owce(smokowi: &smoczek, owce: owca)
    motloch.powitaj(smoka: smoczek)
}

