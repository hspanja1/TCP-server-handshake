# TCP Server Handshake – Projekat

## Struktura repozitorija
- 'docs/' – dijagrami (FSM, WaveDrom, sekvence poruka)
- 'src/' – VHDL kod (entitet, arhitektura)
- 'tb/' – testbench fajlovi
- 'sim/' – rezultati simulacije (screenshotovi)
---
# TCP 

**TCP (Transmission Control Protocol)** je transportni protokol orijentiran na konekciju. Njegova glavna uloga je da podaci koje aplikacije šalju preko mreže stignu **pouzdano, u pravom redoslijedu i bez grešaka**. Aplikacije ne moraju brinuti o tehničkim detaljima prijenosa – TCP se brine o svemu, od uspostavljanja veze do kontrole toka podataka.

Prije nego što se podaci počnu slati, TCP uspostavlja vezu između pošiljatelja i primatelja kroz postupak **trosmjernog rukovanja (3 way handshake)**. Kada se veza uspostavi, TCP dijeli poruke na manje segmente, pakira ih u IP pakete i šalje kroz mrežu. Na odredištu TCP ponovno slaže segmente u ispravan redoslijed i predaje ih aplikaciji. Ako neki paket nestane, stigne oštećen ili izvan redoslijeda, TCP to otkriva i traži ponovni prijenos, čime osigurava da primljeni podaci budu identični onima koji su poslani.

Ovaj protokol koristi tehniku potvrde prijema – primatelj mora potvrditi svaki paket, a pošiljatelj vodi evidenciju i ponovno šalje podatke ako potvrda ne stigne na vrijeme. Takav pristup daje visoku pouzdanost, ali može uzrokovati kašnjenja, pa TCP nije idealan za aplikacije u stvarnom vremenu poput internetskih poziva ili online igara. Za takve slučajeve koristi se UDP, koji daje prednost brzini nad pouzdanošću.

----
## Struktura TCP segmenta 
Struktura TCP segmenta izgleda ovako (Slika 1) [2].

<p align="center"> <img src="https://intronetworks.cs.luc.edu/current/uhtml/_images/tcp_header.svg" width="600"/> </p>
<p align="center"><i>Slika 1. Struktura TCP segmenta</i></p>



TCP segment sadrži sljedeća polja:

- **Source port** - Broj porta izvora **(16 bita)**
- **Destination port** - Broj porta odredišta **(16 bita)**
- **Sequence number** - Ako je SYN zastavica postavljena na (1), tada je ovo početni redni broj. Redni broj stvarnog prvog bajta podataka i potvrđeni broj u odgovarajućem ACK-u tada su ovaj redni broj plus 1. Ako je SYN zastavica postavljena na (0), tada je ovo akumulirani slijedni broj prvog bajta podataka ovog segmenta za trenutnu sesiju. **(32 bita)**
- **Acknowledgment number** - Sljedeći očekivani bajt preko TCP protokola **(32 bita)**
- **Data Offset** - Određuje veličinu TCP zaglavlja u 32-bitnim riječima . Minimalna veličina zaglavlja je 5 riječi, a maksimalna 15 riječi, što daje minimalnu veličinu od 20 bajtova, a maksimalnu od 60 bajtova, dopuštajući do 40 bajtova opcija u zaglavlju. **(4 bita)**
- **Reserved** - Ima značenje 0 **(3 bita)**
- **Control bits** - Upravljaju funkcijama podešavanja, kontrolom zagušenja mreže i završetak seanse-sesije **(9 bita)**. Poseban bit koji ima određenu svrhu, često se naziva zastavicom.
- **Window Size** - Veličina prozora za prijem , koja određuje broj jedinica veličine prozora koje pošiljatelj ovog segmenta trenutno želi primiti. **(16 bita)**
- **Checksum** - Izračunata kontrolna suma zaglavlja i podataka. Koristi se za provjeru pogrešaka TCP zaglavlja, korisnog tereta i IP pseudo-zaglavlja. **(16 bita)** 
- **Urgent Pointer** - Ovo polje označava na kraj hitnih podataka **(16 bita)** 
- **Options** - Mogu, a ne moraju biti uključene; ako postoje, veličine su x×8 bita **(0 ili 32 bita, ako je dostupno)**
- **Padding** - Dopuna nulama do **32 bita**.
---

## Opis projekta i popis signala

Ovaj projekat razvija VHDL modul koji simulira ponašanje TCP servera na nivou hardvera. Modul je zamišljen da prepozna dolazne pakete, provjeri da li su namijenjeni serveru i da kroz standardni TCP three‑way handshake uspostavi vezu sa klijentom. Kada je konekcija ostvarena, modul jasno signalizira stanje povezivanja (is_connected) i izdvaja osnovne podatke o klijentu – njegovu MAC adresu, IP adresu i port. Za prijem i slanje poruka koristi se Avalon‑ST interfejs sa ready/valid rukovanjem.


##  Generički parametri
Parametri se zadaju prilikom instanciranja modula i predstavljaju identitet servera:

- **SERVER_MAC** – fizička adresa mrežnog interfejsa servera.
- **SERVER_IP** – IP adresa servera.
- **SERVER_PORT** – TCP port na kojem server „sluša“ konekcije.


## Popis signala

### Ulazni signali
- `clock` – glavni takt sistema.
- `reset` – resetuje modul u početno stanje.
- `in_data (8 bita)` – bajt podataka koji dolazi sa mreže.
- `in_valid` – označava da je `in_data` trenutno validan.
- `in_sop` – „start of packet“ – početak paketa.
- `in_eop` – „end of packet“ – kraj paketa.
- `out_ready` – dolazi od prijemnika; označava da je spreman da primi izlazne podatke.

### Izlazni signali
- `is_connected` – pokazuje da je TCP konekcija uspješno uspostavljena.
- `client_mac` – MAC adresa klijenta.
- `client_ip` – IP adresa klijenta.
- `client_port` – TCP port klijenta.
- `in_ready` – govori da je server spreman da primi ulazne podatke.
- `out_data (8 bita)` – bajt podataka koji server šalje ka klijentu.
- `out_valid` – označava da je `out_data` validan.
- `out_sop` – početak paketa koji server šalje.
- `out_eop` – kraj paketa koji server šalje.

---


## Scenariji komunikacije

## Upostavljanje veze:

## 1. Klijent šalje SYN

- Klijent inicira vezu tako što šalje paket sa zastavicom SYN=1.

- U tom paketu postavlja početni broj sekvence (seq=x).

- Nakon slanja, klijent prelazi u stanje SYN‑SENT.


## 2. Server odgovara sa SYN‑ACK

- Ako server prihvati vezu, šalje paket sa zastavicama SYN=1 i ACK=1.

- Server postavlja svoj broj sekvence (seq=y) i potvrđuje klijentov broj (ack=x+1).

- Server prelazi u stanje SYN‑RCVD.

- Ako odbije vezu, šalje RST paket.


## 3. Klijent šalje završni ACK

- Klijent potvrđuje prijem SYN‑ACK paketa slanjem ACK=1.

- U tom paketu stoji seq=x+1 i ack=y+1.

- Nakon toga, oba kraja prelaze u ESTABLISHED stanje – veza je uspostavljena.

- Na narednoj slici prikazan je cjelokupni proces 3 way handshake- a. (Slika 2) [4]

<p align="center"> <img src="https://user-content.gitlab-static.net/d1f2cbdbc064b2cfa0acc4fe483cd8fd4fac931c/687474703a2f2f746370697067756964652e636f6d2f667265652f6469616772616d732f7463706f70656e337761792e706e67" width="600"/> </p>
<p align="center"><i>Slika 2. 3 way handshaking </i></p>
---

# TCP dijagram stanja

Na narednoj slici se nalazi dijagram stanja za TCP. (Slika 3) [1]

<p align="center"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Tcp_state_diagram_fixed_new.svg/1280px-Tcp_state_diagram_fixed_new.svg.png" width="600"/> </p>
<p align="center"><i>Slika 3. Dijagram stanja za TCP</i></p>

# TCP stanja

Tijekom procesa trostrukog rukovanja postoji 6 vrsta TCP stanja koja se nazivaju: CLOSED, LISTEN, SYN-SENT, SYN-ACK SENT, SYN RCVD i ESTABLISHED. Donja tabela navodi detalje svakog stanja: (Slika 4) [3]
<p align="center">
  <img src="docs/TCP%20stanja.jpg" width="600"/>
</p>
<p align="center"><i>Slika 4. Tabela stanja za TCP </i></p>

## TCP stanja – serverska strana

U prethodnoj tabeli prikazana su **sva TCP stanja** koja se pojavljuju tokom uspostavljanja i prekida veze, uključujući i klijentsku stranu.

Kako je naš projekat fokusiran na **TCP server handshake**, u nastavku su izdvojena samo ona stanja koja se tiču **serverske strane** i koja su relevantna za implementaciju u ovom modulu.

<div align="center">
  
| TCP stanje       | Uloga servera                                                                 |
|------------------|-------------------------------------------------------------------------------|
| CLOSED           | Server nema aktivnu konekciju (resetovan ili konekcija završena).             |
| LISTEN           | Server pasivno čeka SYN od klijenta na definisanom portu.                     |
| SYN_RCVD         | Server je primio SYN i poslao SYN‑ACK; sada čeka završni ACK od klijenta.     |
| ESTABLISHED      | Veza je uspostavljena; server i klijent mogu razmjenjivati podatke.           |

</div>

---


## Literatura


[1] "Transmission Control Protocol," u *Wikipedia, the Free Encyclopedia*. [Na internetu].  
Dostupno: https://en.wikipedia.org/wiki/Transmission_Control_Protocol [pristupljeno: 14-pro-2025].

[2] "TCP/IP – Transportni sloj," u *Mreže – Layer-X*. [Na internetu].  
Dostupno: http://mreze.layer-x.com/s040100-0.html#google_vignette [pristupljeno: 14-pro-2025].

[3] "TCP 3-Way Handshake Process," u *NetworkWalks*. [Na internetu].  
Dostupno: https://networkwalks.com/tcp-3-way-handshake-process/ [pristupljeno: 14-pro-2025].

[4] "TCP 3-Way Handshaking," u *Wireshark Wiki*. [Na internetu].  
Dostupno: https://wiki.wireshark.org/TCP_3_way_handshaking [pristupljeno: 14-pro-2025].

[5] "TCP transportni protokol," u *LikeMeAsap Blog*. [Na internetu].  
Dostupno: https://likemeasap.com/hr/blog/TCP-transportni-protokol/ [pristupljeno: 14-pro-2025].

[6] "TCP Three-Way Handshake," u *Study CCNA*. [Na internetu].  
Dostupno: https://study-ccna.com/tcp-three-way-handshake/ [pristupljeno: 14-pro-2025].

