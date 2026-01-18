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


Cijela konekcija je podijeljena na **tri Wavedrom dijagrama radi preglednosti**, pri čemu svaki dijagram jasno prikazuje jednu fazu procesa. Kada klijent inicira konekciju, signal **in_valid** zajedno sa **in_sop** označava početak paketa, dok se u polju **in_data** pojavljuje oznaka *SYN paket*. Server odgovara kombiniranim *SYN+ACK paketom* kroz izlazne signale **out_valid, out_sop i out_data**, čime potvrđuje prijem inicijalnog zahtjeva. Završni korak prikazan je kroz dolazak *ACK paketa* od klijenta, nakon čega signal **is_connected** ostaje u visokom stanju, što označava uspješno uspostavljenu konekciju.

Signali **in_ready** i **out_ready** definišu spremnost za prijem i slanje podataka, dok **sop** (start of packet) i **eop** (end of packet) precizno označavaju granice paketa. Klijentski metapodaci (**client_mac, client_ip, client_port**) pojavljuju se nakon završetka handshakinga, čime se potvrđuje da je konekcija aktivna i spremna za daljnji prijenos podataka.




## 2. Neuspješna konekcija: Nepostojeći Port

- Klijent šalje **SYN** na port koji server ne sluša **(npr. SERVER_PORT mismatch)**, server odgovara **RST-ACK** (seq=0, ack=seq_klijent+1) i odbija konekciju. Modul ostaje u **LISTEN** stanju bez promjene stanja. Ovo sprječava neovlašteni pristup. [1]​

<p align="center">
  <img src="docs/Scenarij2_potpuni_paketi.jpg" width="600"/>
</p>
<p align="center"><i>Slika 7. Neuspješna konekcija: Nepostojeći port </i></p>

## Wavedrom dijagram

<p align="center">
  <img src="docs/syn paket sa port greskom.png" width="600"/>
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
  <img src="docs/duplikovani syn.png" width="600"/>
</p>
<p align="center"><i>Slika 8. Neuspješna konekcija: Nepostojeći port </i></p>

---

# TCP stanja

Tijekom procesa trostrukog rukovanja postoji 6 vrsta TCP stanja koja se nazivaju: CLOSED, LISTEN, SYN-SENT, SYN-ACK SENT, SYN RCVD i ESTABLISHED. Donja tabela navodi detalje svakog stanja: (Slika 9) [3]
<p align="center">
  <img src="docs/TCP%20stanja.jpg" width="600"/>
</p>
<p align="center"><i>Slika 9. Tabela stanja za TCP [3] </i></p>

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

Konačni automat (Finite State Machine – FSM) je tehnika modeliranja sekvencijalnih logičkih sklopova koja se može predstaviti dijagramom stanja ili hardverskom implementacijom. Dijagram stanja prikazuje sva moguća stanja sistema, uslove prelaza i izlazne vrijednosti, što olakšava vizualizaciju i razumijevanje logike rada. 

Dijagram prikazuje ponašanje TCP servera kroz konačni automat (FSM) sa četiri osnovna stanja: **CLOSED**, **LISTEN**, **SYN_RCVD** i **ESTABLISHED**. U početnom stanju **CLOSED** server je neaktivan ili resetovan. Kada se inicijalizuje **(reset='0')**, prelazi u stanje **LISTEN**, gdje čeka dolazne konekcije. Ako nema validnog SYN paketa **(in_valid='0')**, ostaje u **LISTEN**; ali ako stigne validan SYN **(in_valid='1', in_sop='1')**, prelazi u **SYN_RCVD**. U tom stanju čeka završni ACK kako bi potvrdio konekciju. Ako ACK nije primljen, ostaje u **SYN_RCVD**; ako jeste (ACK flag sa validnim sekvencama), prelazi u **ESTABLISHED**. U **ESTABLISHED** stanju server aktivno komunicira dok su ulazi validni **(in_valid='1', out_ready='1')**. Konekcija se zatvara i vraća u **CLOSED** ako stigne RST, ako ACK prestane stizati, ili ako adrese više ne odgovaraju. FSM omogućava preciznu kontrolu toka TCP konekcije, osiguravajući stabilnu i sigurnu komunikaciju između servera i klijenta. Grafik konačnog automata korištenog za simulaciju TCP konekcije kreiran je upotrebom draw.io, besplatnog online alata za crtanje dijagrama.

<p align="center">
  <img src="docs/FSM.jpg" width="600"/>
</p>
<p align="center"><i>Slika 10. FSM dijagram </i></p>
---


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






