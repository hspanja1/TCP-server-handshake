# TCP Server Handshake – Projekat

Kratak, jasan opis TCP server handshake-a

TCP je komunikacijski protokol koji standardizira kako se ostvaruje prenos podataka između klijenta i servera koristeći 3-way handshake. 
3-way handshake se zasniva na tome da klijent šalje IP paket u čijem header-u na poziciji SYN je aktivirana zastavica, šalje broj paketa (koji je nasumično generisan - broj X), a taj paket ne sadrži podatke.
Server nakon što primi paket, šalje odgovor paketom u kojem su aktivni SYN i ACK, te sadrži inicijalizacijski broj paketa za server (Y) i kao potvrdu šalje broj paketa koji očekuje. Nakon što klijent
primi server-ov paket, klijent šalje potvrdu da je primio paket u vidu paketa koji ima zastavicu ACK i broj narednog paketa koji očekuje (ACKNUM=y+1).

!slika_1.webp

Scenarij 1: Tok uspješne konekcije izgleda ovako:

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

Scenarij 2: Tok neuspješne konekcije izgleda ovako:

U 2. scenariju prva dva koraka su ista međutim 3. korak (paket) nije nikad dostavljen serveru. Server nakon TimeOut vremena odbacuje proces uspostave konekcije. Server se vraća u stanje Listen;  is_connected='0'.​ Alternativno, klijent šalje RST → Konekcija odbijena.​


Scenarij 3: SYN flood zašitita

U 3. scenariju klijent šalje više SYN zahtjeva uzastopno, sa željom da onemogući rad servera. U tom slučaju konekcija se uspostavlja po prvoj SYN poruci, a ostale poruke sa zastavicom SYN od istog klijenta se odbacuju.

Ovaj projekat implementira **serversku stranu TCP konekcije** u VHDL-u.  
Server parametri (`SERVER_MAC`, `SERVER_IP`, `SERVER_PORT`) se zadaju prilikom instanciranja modula.  
Uspješna konekcija se indicira signalom `is_connected`, a podaci o klijentu pomoću signala `client_mac`, `client_ip` i `client_port`.
Za prijem i slanje TCP poruka koriste se **Avalon-ST interfejsi** sa **ready/valid rukovanjem**.

## Ready/valid protokol

Ready/valid protokol za prijenos podataka je jednostavan način da se kontroliše tok informacija u hardveru. Sve se svodi na samo dva kontrolna signala. Prijenos podataka se desi samo kada su i ready i valid postavljeni na „1“ u istom taktu clock-a.

 Ilustracija ready/valid rukovanja:  
<p align="center"> <img src="https://cdn.vhdlwhiz.com/wp-content/uploads/2022/09/axi_ready_valid_handshake_featured.png.webp" width="600"/> </p>

---
Ready/Valid je protokol za prijenos podataka koji ne pamti prošlost. To znači da ni pošiljalac ni primalac ne moraju znati šta se desilo u prethodnim taktovima sata – važno je samo ono što se dešava u trenutnom taktu. Da bi prijenos uspio, obje strane moraju raditi u istom ritmu sata i gledati kontrolne signale na istoj ivici takta. Zbog toga ovaj protokol nije pogodan kada se prelazi iz jedne clock domene u drugu.


### Princip rada
--**Ready** signal je kod primaoca – on odlučuje da li može primiti nove podatke.

--**Valid** i **Data** signale kontroliše pošiljalac – on kaže da li su podaci spremni.

--Prijenos se desi samo kada **oba signala (ready i valid) budu „1“ u istom taktu.**

Na ovaj način i pošiljalac i primalac mogu usporiti ili ubrzati tok podataka, ali prijenos ide tek kada se dogovore.


### Scenariji komunikacije
1. **Slanje i primanje punom brzinom**: `valid=1`, `ready=1` → podaci se prenose. Svaki takt sata donosi jednu transakciju, što znači da prijenos ide maksimalnom brzinom. izgleda kao da uopće nema kontrole toka, jer ništa ne usporava komunikaciju.
   <p align="center"> <img src="https://cdn.vhdlwhiz.com/wp-content/uploads/2022/08/wavedrom_continuous.png.webp" width="600"/> </p>

2. **Spori pošiljalac i brzi primalac**: `valid=0`, `ready=1` → primalac spreman, ali nema podataka. U ovom scenariju imamo situaciju gdje je primalac uvijek spreman da primi podatke (ready = '1'), dok pošiljalac povremeno šalje podatke tako što postavlja valid na „1“. Primalac nikada ne pravi pauzu – stalno je otvoren za prijem. Pošiljalac diktira ritam, jer samo on odlučuje kada su podaci spremni. Kada pošiljalac nema ništa za poslati, valid je „0“ i nema prijenosa, iako je primalac spreman.
 <p align="center"> <img src="https://cdn.vhdlwhiz.com/wp-content/uploads/2022/08/wavedrom_slow_sender.png.webp" width="600"/> </p>
   
3. **Brz pošiljalac i spori primalac**: `valid=1`, `ready=0` → primalac spreman, ali nema podataka. Pošiljalac stalno ima podatke spremne (valid = '1'), ali primalac ne može uvijek da ih primi. On povremeno spušta signal ready na „0“ kako bi usporio tok podataka. To se zove backpressure – kada modul nizvodno (primalac) „pritisne kočnicu“ i zaustavi ili uspori prijenos dok ne bude spreman da nastavi.Tok podataka se nastavlja tek kada primalac ponovo podigne ready na „1“.
   <p align="center"> <img src="https://cdn.vhdlwhiz.com/wp-content/uploads/2022/08/wavedrom_slow_receiver.png.webp" width="600"/> </p>
   
4. `valid=0`, `ready=0` → nema prijenosa.  
-----
### Struktura repozitorija

- 'docs/' – dijagrami (FSM, WaveDrom, sekvence poruka)
- 'src/' – VHDL kod (entitet, arhitektura)
- 'tb/' – testbench fajlovi
- 'sim/' – rezultati simulacije (screenshotovi)
  

