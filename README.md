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
Struktura TCP segmenta izgleda ovako:
<p align="center"> <img src="[https://intronetworks.cs.luc.edu/current/uhtml/_images/tcp_header.svg" width="600]"/> </p>


### Scenariji komunikacije
 → nema prijenosa.  

