import UIKit

var cena = 500000
var lata = 30
var oprocentowanie = 5.0
var kredyt:Double = 400000.0
var przyrost = 0.1
var odsetki:[Double] = [Double]()
var ogolne:[Double] = [Double]()
var ilosc_rat:Int = 30 * 12
var ratakapitolowa:Double = kredyt / Double(ilosc_rat)
var do_zaplacenia = 0
var wszystkie_raty:Double = 0
for i in 0...ilosc_rat
{
    if i % 6 == 0
    {
        oprocentowanie += przyrost
    }
    odsetki.append(ratakapitolowa * (oprocentowanie / 100))
    ogolne.append(ratakapitolowa * (1 + (oprocentowanie / 100)))
}

for element in odsetki
{
    kredyt += element
    wszystkie_raty += element
}
print("Raty ogolne: ")
print(ogolne)
print("\nRata kapitalowa: ")
print(ratakapitolowa)
print("\nRata odsetkowa: ")
print(odsetki)
print("Łączna kwota: " + String(kredyt) + "\nRóżnica cen: " + String(wszystkie_raty) + "\n")



