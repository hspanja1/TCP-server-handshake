# TCP Server Handshake – Projekat

## Struktura repozitorija
- 'docs/' – dijagrami (FSM, WaveDrom, sekvence poruka)
- 'src/' – VHDL kod (entitet, arhitektura)
- 'tb/' – testbench fajlovi
- 'sim/' – rezultati simulacije (screenshotovi)
---
**TCP (Transmission Control Protocol)** je transportni protokol orijentiran na konekciju. Njegova glavna uloga je da podaci koje aplikacije šalju preko mreže stignu **pouzdano, u pravom redoslijedu i bez grešaka**. Aplikacije ne moraju brinuti o tehničkim detaljima prijenosa – TCP se brine o svemu, od uspostavljanja veze do kontrole toka podataka.

Prije nego što se podaci počnu slati, TCP uspostavlja vezu između pošiljatelja i primatelja kroz postupak **trosmjernog rukovanja (3 way handshake)**. Kada se veza uspostavi, TCP dijeli poruke na manje segmente, pakira ih u IP pakete i šalje kroz mrežu. Na odredištu TCP ponovno slaže segmente u ispravan redoslijed i predaje ih aplikaciji. Ako neki paket nestane, stigne oštećen ili izvan redoslijeda, TCP to otkriva i traži ponovni prijenos, čime osigurava da primljeni podaci budu identični onima koji su poslani.

Ovaj protokol koristi tehniku potvrde prijema – primatelj mora potvrditi svaki paket, a pošiljatelj vodi evidenciju i ponovno šalje podatke ako potvrda ne stigne na vrijeme. Takav pristup daje visoku pouzdanost, ali može uzrokovati kašnjenja, pa TCP nije idealan za aplikacije u stvarnom vremenu poput internetskih poziva ili online igara. Za takve slučajeve koristi se UDP, koji daje prednost brzini nad pouzdanošću.

----
## Struktura TCP segmenta 
Struktura TCP segmenta izgleda ovako:
<p align="center"> <img src="https://intronetworks.cs.luc.edu/current/uhtml/_images/tcp_header.svg" width="600"/> </p>

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
- **Padding** - dopuna nulama do **32 bita**.



### Scenariji komunikacije
 → nema prijenosa.  

