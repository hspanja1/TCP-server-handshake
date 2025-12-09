# TCP Server Handshake – Projekat

Kratak, jasan opis TCP server handshake-a

TCP je komunikacijski protokol koji standardizira kako se ostvaruje prenos podataka između klijenta i servera koristeći 3-way handshake. 
3-way handshake se zasniva na tome da klijent šalje IP paket u čijem header-u na poziciji SYN je aktivirana zastavica, šalje broj paketa (koji je nasumično generisan - broj X), a taj paket ne sadrži podatke.
Server nakon što primi paket, šalje odgovor paketom u kojem su aktivni SYN i ACK, te sadrži inicijalizacijski broj paketa za server (Y) i kao potvrdu šalje broj paketa koji očekuje. Nakon što klijent
primi server-ov paket, klijent šalje potvrdu da je primio paket u vidu paketa koji ima zastavicu ACK i broj narednog paketa koji očekuje (ACKNUM=y+1).


    
Tok izgleda ovako:

Korak 1 – Klijent → Server: SYN

Klijent inicira konekciju slanjem TCP paketa sa segmentima :<br>
    SYN = 1<br>
    SEQ = x (nasumično generisan ISN – Initial Sequence Number)<br>
TCP paket ne nosi podatke (bez payload).

Server, kada primi flag SYN, prepoznaje pokušaj uspostave veze.

Korak 2 – Server → Klijent: SYN-ACK

Server odgovara sa TCP paketom koji ima segmente:<br>
    SYN = 1<br>
    ACK = 1<br>
    SEQ = y (serverov ISN)<br>
    ACKNUM = x + 1<br>
Ova poruka potvrđuje primitak klijentovog SYN-a i šalje serverov početni redni broj (y).

Korak 3 – Klijent → Server: ACK

Klijent vraća zadnji paket:<br>
    ACK = 1<br>
    SEQ = x + 1<br>
    ACKNUM = y + 1<br>
Ovim odgovaraju serveru: "Primio sam tvoj SYN-ACK."

Uspješna konekcija se smatra uspostavljenom nakon što server primi ovaj ACK.

## Struktura repozitorija
- 'docs/' – dijagrami (FSM, WaveDrom, sekvence poruka)
- 'src/' – VHDL kod (entitet, arhitektura)
- 'tb/' – testbench fajlovi
- 'sim/' – rezultati simulacije (screenshotovi)
  

