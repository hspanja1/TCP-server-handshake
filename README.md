# TCP Server Handshake – Projekat

## Struktura repozitorija
- 'docs/' – dijagrami (sekvencijalni, WaveDrom, FSM)
- 'src/' – VHDL kod (entitet, arhitektura)
- 'tb/' – testbench fajlovi
- 'sim/' – rezultati simulacije (screenshotovi)
---
# TCP 

**TCP (Transmission Control Protocol)** je temeljni komunikacijski protokol koji omogućava pouzdanu razmjenu podataka između dva uređaja u mreži. Za razliku od jednostavnijih protokola poput UDP-a, TCP garantuje da će svi podaci stići tačno, redoslijedom kojim su poslani, bez gubitaka ili duplikata.

TCP koristi **mehanizam kontrole toka, potvrda prijema (ACK) i ponovnog slanja** kako bi osigurao pouzdanost. Ključni dio tog procesa je **trostruko rukovanje (three-way handshake)** — inicijalna razmjena poruka kojom se uspostavlja konekcija između klijenta i servera.

Prilikom uspostavljanja veze, TCP koristi tri koraka:

**1. SYN** – Klijent šalje zahtjev za konekciju.

**2. SYN-ACK** – Server potvrđuje prijem i šalje vlastiti zahtjev.

**3. ACK** – Klijent potvrđuje i konekcija je uspostavljena.

Ovaj proces omogućava obje strane da se usaglase o početnim parametrima komunikacije, uključujući početne sekvence, portove i IP adrese. Na slici ispod prikazan je tok stanja i razmjena poruka tokom TCP three-way handshakea, kako bi se vizualno pojasnio proces uspostavljanja konekcije. [4]

<p align="center"> <img src="https://user-content.gitlab-static.net/d1f2cbdbc064b2cfa0acc4fe483cd8fd4fac931c/687474703a2f2f746370697067756964652e636f6d2f667265652f6469616772616d732f7463706f70656e337761792e706e67" width="600"/> </p>
<p align="center"><i>Slika 1. 3 way handshaking [4] </i></p>

----
## Struktura TCP segmenta 
Pakete u transportnom sloju nazivamo segmentima. Struktura TCP segmenta izgleda ovako (Slika 2) [2].

<p align="center">
  <img src="docs/Struktura%20TCP%20segmenta.jpg" width="600"/>
</p>
<p align="center"><i>Slika 2. Struktura TCP segmenta </i></p>



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

TCP handshake protokol omogućava pouzdano uspostavljanje konekcije između klijenta i servera putem trostrukog rukovanja (SYN, SYN-ACK, ACK), gdje server prima SYN paket, odgovara SYN-ACK, a zatim potvrđuje klijentov ACK, aktivirajući signale is_connected, client_mac, client_ip i client_port. U kontekstu VHDL modula tcp_server, komunikacija se odvija preko Avalon-ST interfejsa (in_data/valid/sop/eop/ready i out_data/valid/sop/eop/ready), gdje server obrađuje ulazne pakete i generiše izlazne bez podataka u fazi handshake-a. Identificirani scenariji uključuju uspješan handshake i greške poput timeout ili RST i duplikovani SYN (SYN FLOOD ZAŠTITA).


###  Generički parametri
Parametri se zadaju prilikom instanciranja modula i predstavljaju identitet servera:

- **SERVER_MAC** – fizička adresa mrežnog interfejsa servera.
- **SERVER_IP** – IP adresa servera.
- **SERVER_PORT** – TCP port na kojem server „sluša“ konekcije.

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

## 1. Uspješan Handshake scenarij:

#### 1. Klijent šalje SYN

- Klijent inicira vezu tako što šalje paket sa zastavicom SYN=1 na Avalon-ST ulaz servera (in_sop='1', in_valid='1'). U tom paketu postavlja početni broj sekvence (seq=x). **Server je u stanju LISTEN i čeka SYN.** Nakon slanja, klijent prelazi u stanje SYN‑SENT. [4] 

#### 2. Server odgovara sa SYN‑ACK

- Server prepoznaje SYN, postavlja klijentske parametre (client_mac/ip/port). Ako server prihvati vezu, šalje paket sa zastavicama SYN=1 i ACK=1 (out_sop='1', out_valid='1'). Server postavlja svoj broj sekvence (seq=y) i potvrđuje klijentov broj (ack=x+1). **Server prelazi u stanje SYN‑RCVD.** [4] 


#### 3. Klijent šalje završni ACK

- Klijent potvrđuje prijem SYN‑ACK paketa slanjem ACK=1. U tom paketu stoji seq=x+1 i ack=y+1. Nakon primljenog ACK-a, server postavlja is_connected='1' - oba kraja prelaze u **ESTABLISHED** stanje (veza je uspostavljena) i izlaze klijentovi podatci (client_mac, client_ip, client_port). [4] 

Razmjena se prikazuje sekvencijskim dijagramom.

<p align="center">
  <img src="docs/Scenarij1_potpuni_paketi.jpg" width="600"/>
</p>
<p align="center"><i>Slika 3. Uspješan Handshake scenarij </i></p>

## Wavedrom dijagram

<p align="center">
  <img src="docs/SYN_paket.png" width="600"/>
</p>
<p align="center"><i>Slika 4. Wavedrom dijagram za SYN - scenarij uspješne konekcije </i></p>

<p align="center">
  <img src="docs/SYN_ACK_paket.png" width="600"/>
</p>
<p align="center"><i>Slika 5. Wavedrom dijagram za SYN-ACK - scenarij uspješne konekcije </i></p>

<p align="center">
  <img src="docs/ACK_paket.png" width="600"/>
</p>
<p align="center"><i>Slika 6. Wavedrom dijagram za ACK - scenarij uspješne konekcije </i></p>


Cijela konekcija je podijeljena na **tri Wavedrom dijagrama radi preglednosti**, pri čemu svaki dijagram jasno prikazuje jednu fazu procesa: SYN, SYN-ACK i ACK. Prije nego klijent inicira konekciju, server se nalazi u **CLOSED** stanju. Kada klijent inicira konekciju, signal **in_valid** zajedno sa **in_sop** označava početak paketa, dok se u polju **in_data** pojavljuje oznaka *SYN paket*. Server u ovom trenutku još uvijek se nalazi u **LISTEN** stanju. Server nakon primitka SYN paketa prelazi u stanje **SYN_RECEIVED** i šalje kombinirani **SYN+ACK paket** kroz izlazne signale **out_valid, out_sop i out_data**. Time potvrđuje prijem inicijalnog zahtjeva i priprema uspostavljanje konekcije. Završni korak uključuje slanje **ACK paketa** od strane klijenta. Tek nakon što server pošalje ili obradi ACK paket, signal **is_connected** prelazi u visoko stanje, što označava da je TCP konekcija **uspješno uspostavljena**, a server ulazi u stanje **ESTABLISHED**.

Signali **in_ready** i **out_ready** definišu spremnost za prijem i slanje podataka, dok **sop** (start of packet) i **eop** (end of packet) precizno označavaju granice paketa. Klijentski metapodaci (**client_mac, client_ip, client_port**) pojavljuju se nakon završetka handshakinga, čime se potvrđuje da je konekcija aktivna i spremna za daljnji prijenos podataka.


U Scenariju 1 (SYN paket i završni ACK paket) bajtovi koji ulaze kroz signal in_data imaju sljedeće značenje:
- **E1–E22 (Ethernet header)**  
  - E1–E7: Preambula
  - E8: Start of Frame Delimiter (SFD) - početak stvarnog Ethernet okvira
  - E9-E14: Destination MAC Address
  - E15-E20: Source MAC Address
  - E21-E22: EtherType / Length
- **I1-I20 (IPv4 header)**
  - I1: verzija i dužina zaglavlja  
  - I2: ToS (Type of Service)  
  - I3-I4: Ukupna dužina paketa
  - I5-I20: ostala IPv4 polja (identifikacija, TTL, protokol, IP adrese)  
- **T1-T20 (TCP header)**
  - T1-T2: Source port
  - T3-T4: Destination port
  - T5-T8: Sequence number - označava redni broj prvog bajta u segmentu (koristi se za praćenje podataka)
  - T9-T12: Acknowledgment Number - označava sljedeći očekivani bajt od pošiljaoca. Aktivno samo kada je ACK flag postavljen.
  - T13-T16: Kontrola toka i flagovi
  - T17-T20: Checksum + Urgent pointer
- **E23-E26 (CRC Checksum)**

Izlazni paket SYN+ACK (out_data) prenosi se bajt po bajt i sadrži sva odgovarajuća zaglavlja, uključujući polja koja potvrđuju prijem inicijalnog SYN paketa.



## 2. Neuspješna konekcija: Nepostojeći Port

- Klijent šalje **SYN** na port koji server ne sluša **(npr. SERVER_PORT mismatch)**, server odgovara **RST-ACK** (seq=0, ack=seq_klijent+1) i odbija konekciju. Modul ostaje u **LISTEN** stanju bez promjene stanja. Ovo sprječava neovlašteni pristup. [1]​

<p align="center">
  <img src="docs/Scenarij2_potpuni_paketi.jpg" width="600"/>
</p>
<p align="center"><i>Slika 7. Neuspješna konekcija: Nepostojeći port </i></p>

## Wavedrom dijagram

<p align="center">
  <img src="docs/Scenarij2.png" width="600"/>
</p>
<p align="center"><i>Slika 8. Neuspješna konekcija: Nepostojeći port </i></p>


## 3. Duplikovani SYN (SYN flood zaštita)
- Klijent prvo šalje **SYN** s početnim sekvencijskim brojem x, na što server odgovara **SYN-ACK** paketom sa svojim brojem y i potvrdom klijentovog broja (ack=x+1). Klijent zatim šalje završni **ACK** (ack=y+1), čime se veza formalno uspostavlja. Međutim, nakon toga stiže **novi SYN** s istim brojem kao prvi — duplikat koji može nastati zbog retransmisije, greške ili zlonamjerne radnje. Budući da server već ima aktivnu vezu s tim parametrima, prepoznaje duplikat i šalje **RST (reset)** paket s brojem y+1 kako bi odbacio taj zahtjev. TCP dizajn omogućava da se takvi duplikati ignoriraju bez prekida postojeće sesije, čime se osigurava stabilnost i sigurnost komunikacije. [1]

<p align="center">
  <img src="docs/Scenarij3_potpuni_paketi.jpg" width="600"/>
</p>
<p align="center"><i>Slika 8. Neuspješna konekcija: duplikovani SYN </i></p>

## Wavedrom dijagram

<p align="center">
  <img src="docs/SYN_paket.png" width="600"/>
</p>
<p align="center"><i>Slika 8. SYN paket </i></p>

<p align="center">
  <img src="docs/SYN_ACK_paket.png" width="600"/>
</p>
<p align="center"><i>Slika 9. SYN-ACK paket </i></p>

<p align="center">
  <img src="docs/ACK_paket.png" width="600"/>
</p>
<p align="center"><i>Slika 10. ACK paket </i></p>

<p align="center">
  <img src="docs/SYN_duplicate_RST_paketi.png" width="600"/>
</p>
<p align="center"><i>Slika 11. SYN (duplicate) + RST paket </i></p>
---

# TCP stanja

Tijekom procesa trostrukog rukovanja postoji 6 vrsta TCP stanja koja se nazivaju: CLOSED, LISTEN, SYN-SENT, SYN-ACK SENT, SYN RCVD i ESTABLISHED. Donja tabela navodi detalje svakog stanja: (Slika 9) [3]
<p align="center">
  <img src="docs/TCP%20stanja.jpg" width="600"/>
</p>
<p align="center"><i>Slika 12. Tabela stanja za TCP [3] </i></p>

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

## Konačni automat

Konačni automat (engl. Finite State Machine) predstavlja ključnu tehniku modeliranja sekvencijalnih logičkih sklopova koja omogućava precizno upravljanje stanjima sistema u zavisnosti od ulaznih signala. Za potrebe implementacije TCP Server Handshake protokola, dizajniran je automat koji upravlja tokom podataka kroz Avalon-ST interfejs, vršeći inspekciju mrežnih paketa na nivou Ethernet, IP i TCP zaglavlja. Specifičnost ovog automata je upotreba indikatorskih signala (tzv. "blur" flagova) koji omogućavaju sklopu da tokom prijema paketa "zapamti" bitne informacije (poput prisustva SYN ili ACK flegova, te ispravnosti adresa), kako bi se konačna odluka o prelasku u naredno stanje donijela isključivo na kraju paketa (signal  `in_eop`). Ovakav pristup osigurava robustnost sistema i sprečava neželjene prelaze usljed šuma ili nekompletnih podataka.

Dizajnirani automat obuhvata ukupno pet stanja:

- **LISTEN**: Inicijalno stanje u kojem server čeka dolazni SYN paket,
- **SYN_RCVD**: Stanje u kojem server šalje SYN-ACK odgovor klijentu,
- **WAIT_ACK**: Čekanje na finalni ACK paket od strane klijenta,
- **ESTABLISHED**: Stanje uspostavljene veze u kojem je signal `is_connected` aktivan,
- **CLOSED**: Pomoćno stanje za slanje RST (Reset) paketa u slučaju greške ili raskida veze.

Proces započinje u stanju **LISTEN**, gdje automat ostaje sve dok signal `reset` ne vrati sistem u bazu. Dolaskom prvog bajta paketa (`in_sop = '1'`), aktivira se brojač bajtova koji omogućava parsiranje zaglavlja. Unutar ovog stanja vrši se validacija `SERVER_MAC`, `SERVER_IP` i `SERVER_PORT` parametara. Ukoliko se bilo koji od ovih parametara ne podudara sa očekivanim vrijednostima, aktivira se `flag_error`. Na kraju paketa (`in_eop = '1'`), automat provjerava status flagova: ako je detektovana greška, prelazi se u stanje **CLOSED**, a ako je primljen ispravan SYN paket bez grešaka, prelazi se u **SYN_RCVD**. U stanjima **SYN_RCVD** i **CLOSED** automat preuzima ulogu transmitera. Koristeći brojač `tx_pos` i uvažavajući `out_ready signal` (backpressure mehanizam), server šalje generisani paket od 62 bajta. Iz stanja **SYN_RCVD**, nakon uspješnog slanja, prelazi se u **WAIT_ACK**, dok se iz stanja **CLOSED** sistem vraća u **LISTEN**.

U stanju **WAIT_ACK**, automat ponovo vrši inspekciju dolaznog paketa tražeći ACK fleg. Ukoliko se detektuje validan ACK na kraju paketa, automat prelazi u finalno stanje **ESTABLISHED**, čime se indicira uspješno uspostavljena konekcija i omogućava nulto kašnjenje signala `is_connected`. Automat podržava i scenario detekcije duplog SYN paketa unutar stanja **ESTABLISHED**; u tom slučaju, sistem prepoznaje zahtjev za resetovanjem, prelazi u stanje **CLOSED** kako bi poslao RST paket klijentu, te se vraća u stanje **LISTEN**. 

Grafički prikaz konačnog automata (FSM dijagram) kreiran je upotrebom alata **draw.io**, dok je verifikacija logičkih prelaza potvrđena kroz **State Machine Viewer** unutar Intel Quartus Prime okruženja.

<p align="center">
  <img src="docs/FSM.png" width="600"/>
</p>
<p align="center"><i>Slika 13. FSM dijagram </i></p>

---

## Modeliranje sklopa u VHDL-u

Na osnovu prethodno definisanih signala i dijagrama stanja, sklop je modeliran korištenjem jezika za opis hardvera – VHDL. Arhitektura modula zasnovana je na sekvencijalnom procesu koji sinhrono upravlja stanjima automata, brojačima i unutrašnjim registrima na uzlaznu ivicu takta. Za razliku od parsera koji odluke o prelazima donose trenutno, ovaj dizajn implementira tehniku indikatorskih flagova (engl. blur flags). Ovi flagovi tokom prijema paketa akumuliraju informacije o validnosti odredišne MAC adrese, IP adrese i TCP porta, kao i prisustvu specifičnih TCP flagova (SYN, ACK). Finalna odluka o tranziciji u naredno stanje donosi se isključivo na granici paketa, odnosno kada signal `in_eop` postane aktivan. Ovakav pristup osigurava visoku otpornost na neispravne pakete i sprječava trke signala (race conditions).

Posebna pažnja posvećena je implementaciji Avalon-ST interfejsa. Izlazni signali poput `out_valid`, `out_sop` i `out_eop` definisani su konkurentnim dodjelama izvan glavnog procesa kako bi se eliminisale kombinatorne petlje između `valid` i `ready` signala, što je strogi zahtjev Avalon-ST standarda. Za generisanje odgovora servera (SYN-ACK ili RST paketa) korištena je pomoćna funkcija `get_tx_byte`. Ova funkcija na osnovu trenutne pozicije brojača `tx_pos` i selektovanog tipa paketa precizno konstruiše mrežni okvir bajt po bajt, uključujući Ethernet, IP i TCP zaglavlja. Signal `is_connected` je takođe modeliran kombinatorno van procesa, čime je omogućena njegova trenutna aktivacija čim automat pređe u stanje `ESTABLISHED`, bez dodatnog kašnjenja od jednog takta.

U nastavku je prikazan detaljan izvještaj o procesu kompilacije dizajna (engl. compilation report).

<p align="center">
  <img src="docs/Compilation_Report.png" width="600"/>
</p>
<p align="center"><i>Slika 14. Compilation Report </i></p>


## Verifikacija pomoću preglednika stanja

Preglednik stanja (engl. State Machine Viewer) pruža grafički prikaz konačnog automata koji je Intel Quartus Prime alat sintetizovao na osnovu napisanog VHDL koda. Ovaj alat je ključan za verifikaciju hardverske reprezentacije dizajna jer omogućava uvid u to kako je kompajler interpretirao logiku prelazaka. Preglednik stanja je otvoren putem menija Tools, odabirom Netlist Viewers i klikom na State Machine Viewer, ili direktno iz RTL Viewera.

<p align="center">
  <img src="docs/State_Machine_Viewer.png" width="600"/>
</p>
<p align="center"><i>Slika 15. State Machine Viewer </i></p>

---

## Verifikacija pomoću simulacijskog alata ModelSim



## Literatura


[1] "TCP Connection Establishment and Termination" [Na internetu].  
Dostupno:(https://people.na.infn.it/~garufi/didattica/CorsoAcq/Trasp/Lezione9/tcpip_ill/tcp_conn.htm) [pristupljeno: 14-pro-2025].

[2] "TCP/IP – Transportni sloj," u *Mreže – Layer-X*. [Na internetu].  
Dostupno: http://mreze.layer-x.com/s040100-0.html#google_vignette [pristupljeno: 14-pro-2025].

[3] "TCP 3-Way Handshake Process," u *NetworkWalks*. [Na internetu].  
Dostupno: https://networkwalks.com/tcp-3-way-handshake-process/ [pristupljeno: 14-pro-2025].

[4] "TCP 3-Way Handshaking," u *Wireshark Wiki*. [Na internetu].  
Dostupno: https://wiki.wireshark.org/TCP_3_way_handshaking [pristupljeno: 14-pro-2025].

[5] "Avalon® Interface Specifications - Intel" [Na internetu].  
Dostupno: (https://cdrdv2-public.intel.com/667068/mnl_avalon_spec-683091-667068.pdf) [pristupljeno: 14-pro-2025].

[6] "RFC 9293: Transmission Control Protocol (TCP)" [Na internetu].  
Dostupno: (https://datatracker.ietf.org/doc/html/rfc9293) [pristupljeno: 29-pro-2025].






