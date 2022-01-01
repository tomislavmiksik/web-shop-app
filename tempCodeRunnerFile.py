
""" 2. Napišite program vjezba5_zd02.py koji od korisnika traži unos prirodnog broja n (n>0) te
potom ispisuje sve djelitelje broj n. Ukoliko je n prost broj (djeljiv samo sa 1 i sa samim
sobom) tada program na kraju treba ispisati da je n prost, a ako je složen onda treba ispisati
da je složen i koliko ima djelitelja (napomena: broj 1 nije niti prost niti složen). """


if __name__ == '__main__':
    
    
    print("Unesite broj iznad 0:")
    n = int(input()) 
    
    while n <= 0:
        print("Pogresan unos, pokusajte ponovo:")
        n = int(input())
    
    brojac = 0
    for i in range(1, n):
        if n % i == 0:
            brojac += 1
            print("djelitelj broja", n, "je", i)
            
        
    
    if brojac == 2:
        print("Broj je prost")
    if n == 1:
        print("Broj nije ni prost ni slozen")
    else:
        print("Broj je slozen sa " + str(brojac) + " djelitelja" )
    print(n)
    
    