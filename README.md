# TCP Server Handshake – Projekat

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
  

