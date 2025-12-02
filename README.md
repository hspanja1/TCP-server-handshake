# TCP-server-handshake
VHDL modul koji implementira serversku stranu uspostavljanja TCP konekcije. Parametri servera se zadaju prilikom instanciranja modula. Uspješna konekcija se indicira signalom is_connected, a podaci o klijentu pomoću signala client_mac, client_ip i client_port. Za prijem i slanje TCP poruka se koriste Avalon-ST interfejsi sa ready/valid rukovanjem.
