#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int random(int min_num, int max_num){
    int result=0,low_num=0,hi_num=0;
    if(min_num<max_num){
      low_num=min_num;
      hi_num=max_num+1;
    }else{
      low_num=max_num+1;
       hi_num=min_num;
    }
    result = (rand()%(hi_num-low_num))+low_num;
    return result;
}

char* imiona[] = {"Adam", "Agata", "Alan", "Aleksandra", "Alicja", "Amelia", "Anastazja", "Andrzej", "Antoni", "Bartek", "Beata",
                    "Borys", "Cecylia", "Cezary", "Dominik", "Emil", "Ewa", "Fabian", "Feliks", "Franciszek", "Fryderyk", "Grzegorz",
                    "Halina", "Igor", "Izabela", "Jakub", "Jan", "Joanna", "Jozef", "Julia", "Justyna", "Kacper", "Kamila", "Karol",
                    "Kinga", "Klara", "Krzysztof", "Lucja", "Lukasz", "Magdalena", "Maja", "Marek", "Maria", "Marta", "Mateusz",
                    "Michal", "Nadia", "Natalia", "Nikodem", "Nina"};//50

char* nazwiska[] = {"Nowak", "Kowalski", "Wisniewski", "Dabrowski", "Lewandowski", "Wojcik", "Kaminski", "Kowalczyk", "Zielinski",
                    "Szymanski", "Wozniak", "Kozlowski", "Jankowski", "Mazur", "Wojciechowski", "Kwiatkowski", "Krawczyk", "Kaczmarek",
                    "Piotrowski", "Grabowski", "Nowakowski", "Pawlowski", "Michalski", "Nowicki", "Adamczyk", "Dudek", "Zajac",
                    "Wieczorek", "Jablonski", "Krol", "Majewski", "Olszewski", "Jaworski", "Wrobel", "Malinowski", "Pawlak",
                    "Witkowski", "Walczak", "Stepien", "Gorski", "Rutkowski", "Michalak", "Sikora", "Ostrowski", "Baran", "Duda",
                    "Szewczyk", "Tomaszewski", "Pietrzak", "Marciniak", "Wroblewski", "Zalewski", "Jakubowski", "Jasinski", "Zawadzki"};//50

char* ulice[]={"Lipowa", "Parkowa", "S³oneczna", "Zielona", "Kwiatowa", "Spokojna", "Sosnowa", "M³yñska", "Dêbowa", "Wiejska", "Leœna",
                "Jagodowa", "Jasna", "Cicha", "Dworcowa", "£¹kowa", "Pocztowa", "Skwerowa", "Sk³odowskiej-Curie", "Marsza³kowska",
                "Pi³sudskiego", "Kopernika", "Sienkiewicza", "Reymonta", "Szpitalna", "Koszykowa", "Mickiewicza", "S³owackiego",
                "Konopnickiej", "Radziwi³³owska", "Placowa", "Plac Grunwaldzki", "Plac Wolnoœci", "Plac Koœciuszki", "Plac Jana Paw³a II",
                "Plac Jana Matejki", "Plac Zwyciêstwa", "Plac Szewczyka", "Plac Kolegiacki", "Plac Inwalidów", "Plac Bohaterów", "Plac Sobieskiego",
                "Plac Kiliñskiego", "Plac Niepodleg³oœci", "Plac Targowy", "Plac Stary Ratusz", "Plac Katedralny", "Plac Koœcieleckiego",
                "Plac Jana Kazimierza", "Plac Franciszkañski"};//50


char* wojewodztwa[]={"Swietokrzyskie","Dolnoslaskie","Kujawsko-pomorskie","Lubelskie","Lubuskie","Lodzkie","Malopolskie",
                     "Mazowieckie","Opolskie","Podkarpacie","Podlaskie","Pomorskie","Slaskie","Warminsko-mazurskie",
                     "Wielkopolskie","Zachodniopomorskie"};//16


char* miasta[]={"Warszawa", "Krakow", "Lodz", "Wroclaw", "Poznan", "Gdansk", "Szczecin", "Bydgoszcz", "Lublin", "Bialystok",
                "Katowice", "Gdynia", "Czêstochowa", "Radom", "Sosnowiec", "Torun", "Kielce", "Rzeszow", "Gliwice", "Zabrze",
                "Olsztyn", "Bielsko-Biala", "Bytom", "Ruda Slaska", "Rybnik", "Tychy", "Dabrowa Gornicza", "Opole", "Gorzow Wielkopolski",
                "Elblag", "Plock", "Walbrzych", "Wloclawek", "Tarnow", "Chorzow", "Koszalin", "Kalisz", "Legnica", "Grudziadz",
                "Slupsk", "Jaworzno", "Jastrzebie-Zdroj", "Nowy Sacz", "Jelenia Gora", "Piotrkow Trybunalski", "Inowroclaw",
                "Lubin", "Myslowice", "Siedlce", "Gniezno", "Stargard Szczecinski", "Konin", "Pila", "Ostrow Wielkopolski", "Elk"};//50


char* marki[]={"Toyota", "Ford", "Nissan", "Honda", "Mazda", "Hyundai", "Kia", "Volkswagen", "Renault", "Peugeot", "Mercedes-Benz",
                "Opel", "Audi", "BMW", "Fiat", "Skoda", "Suzuki", "Citroen", "Dacia", "Mitsubishi", "Subaru", "Seat", "Jeep", "Volvo",
                "Chevrolet", "Smart", "Daewoo", "Porsche", "Lamborghini", "Bentley", "Bugatti", "Ferrari", "Maserati", "Land Rover",
                "Jaguar", "Mini", "Saab", "Dodge", "Isuzu", "Lexus"};//40


char* modele[]={"Accord", "Camry", "Civic", "Corolla", "Fiesta", "Focus", "Forte", "Accent", "Alhambra", "Sonata", "Sentra", "A4",
                "Mazda3", "Mazda6", "Jetta", "Passat", "Golf", "Toledo", "Legacy", "xc90", "Forester", "xc60", "RAV4", "Corvette",
                "Mustang", "Camaro", "Charger", "Malibu", "Cruze", "Spark", "Sonic", "Astra", "Polo", "Corsa", "Insygnia",
                "5008", "Mazda MX-5", "A3", "306", "508", "208", "Ibiza", "Leon", "307", "Tucson", "Sportage",
                "Sorento", "Partner", "Soul", "Optima", "K5", "Stelvio", "A5", "Tiguan", "A3", "V60", "GranTurismo",
                "Aventador", "Huracan", "V40", "Sprinter", "A8", "Avensis", "Yaris", "Auris", "A2"};//50


char* kolory[]={"czarny", "bialy", "szary", "czerwony", "pomaranczowy", "zolty", "zielony", "niebieski", "fioletowy",
                "brazowy", "bezowy", "rozowy", "turkusowy", "lawendowy", "morski", "fuksja", "magenta", "indygo",
                "szmaragdowy", "srebrny", "zloty", "bordowy" "miedziany", "blekitny"};//24


char* litery[]={"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
                "S", "T", "U", "V", "W", "X", "Y", "Z"};//26

char* typy[]={"Sedan", "Hatchback", "Kombi", "VAN", "Minivan", "Coupe", "SUV", "PICK UP", "Cabriolet"};//9

char* typypaliwa[]={"Diesel", "95", "98", "95+gaz", "elektryczny"};//5

char* stanowiska[]={"ksiegowy", "sprzedawca", "kierownik","obsluga", "informatyk", "mechanik" };//6

char* wolny[]={"Tak", "Nie"};


void wojewodztwo(){
	FILE* plik = fopen("wojewodztwo.csv","w");

    for(int i = 1; i <= 16; i++){
          char* wojewodztwo = wojewodztwa[i-1];
          fprintf(plik, "%d,%s\n", i,wojewodztwo);
    }
	fclose(plik);
}

void miasto(){
	FILE* plik = fopen("miasto.csv","w");

    for(int i = 1; i <= 50; i++){
          char* miasto = miasta[i-1];
          fprintf(plik, "%d,%s\n", i,miasto);
    }
	fclose(plik);
}

void marka(){
	FILE* plik = fopen("marka.csv","w");

    for(int i = 1; i <= 40; i++){
          char* marka = marki[i-1];
          fprintf(plik, "%d,%s\n", i,marka);
    }
	fclose(plik);
}

void model(){
	FILE* plik = fopen("model.csv","w");

    for(int i = 1; i <= 50; i++){
          char* model = modele[i-1];
          fprintf(plik, "%d,%s\n", i,model);
    }
	fclose(plik);
}

void typ(){
	FILE* plik = fopen("typ.csv","w");

    for(int i = 1; i <= 9; i++){
          char* typ = typy[i-1];
          fprintf(plik, "%d,%s\n", i,typ);
    }
	fclose(plik);
}

void typpaliwa(){
	FILE* plik = fopen("typpaliwa.csv","w");

    for(int i = 1; i <= 5; i++){
          char* typpaliwa = typypaliwa[i-1];
          fprintf(plik, "%d,%s\n", i,typpaliwa);
    }
	fclose(plik);
}

void kolor(){
	FILE* plik = fopen("kolor.csv","w");

    for(int i = 1; i <= 24; i++){
          char* kolor = kolory[i-1];
          fprintf(plik, "%d,%s\n", i,kolor);
    }
	fclose(plik);
}

void stanowisko(){
	FILE* plik = fopen("stanowisko.csv","w");

    for(int i = 1; i <= 6; i++){

        char* stanowisko = stanowiska[i-1];;

        fprintf(plik, "%d,%s\n",i,stanowisko);
    }
	fclose(plik);
}

void cennik(){
	FILE* plik = fopen("cennik.csv","w");

    for(int i = 1; i <= 100; i++){

        double ulamek= random(1, 99);
        ulamek = ulamek/100;

        double cenazadobe=random(100, 1000) + ulamek;

          fprintf(plik, "%d,%0.2f\n", i,cenazadobe);
    }
	fclose(plik);
}

void samochod(){
	FILE* plik = fopen("samochod.csv","w");

    for(int i = 1; i <= 1000; i++){

        double ulamek= random(1, 9);
        ulamek = ulamek/10;

        double pojemnoscsilnika=random(0, 5) + ulamek;

        int x=random(0,1);


        fprintf(plik, "%d,%0.1f,%d,%d,%d,%d,%d,%d,%s \n", i,pojemnoscsilnika,random(1,100),random(1,5),random(1,40) ,
                random(1,24),random(1,9), random(1,50),wolny[x]);
    }
	fclose(plik);
}

void rejestracja(){
	FILE* plik = fopen("rejestracja.csv","w");

    for(int i = 1; i <= 1000; i++){

        int x1=random(0,25);
        int x2=random(0,25);

        fprintf(plik, "%s%s%d%d%d%d%d,%d\n",litery[x1], litery[x2], random(0,9), random(0,9),
                random(0,9), random(0,9), random(0,9),i);
    }
	fclose(plik);
}

void adresklienta(){
	FILE* plik = fopen("adresklienta.csv","w");

    for(int i = 1; i <= 1000; i++){

        int x=random(0,49);


        fprintf(plik, "%d,%s,%d,%d,%d%d-%d%d%d,%d,%d\n",i,ulice[x], random(1,400), random(1,200),
                random(0,9), random(0,9), random(0,9), random(0,9), random(0,9),random(1,16), random(1,50) );
    }
	fclose(plik);
}

void adrespracownika(){
	FILE* plik = fopen("adrespracownika.csv","w");

    for(int i = 1; i <= 100; i++){

        int x=random(0,49);

        fprintf(plik, "%d,%s,%d,%d,%d%d-%d%d%d,%d,%d\n",i,ulice[x], random(1,400), random(1,200),
                random(0,9), random(0,9), random(0,9), random(0,9), random(0,9),random(1,16), random(1,50) );
    }
	fclose(plik);
}

void adresplacowki(){
	FILE* plik = fopen("adresplacowki.csv","w");

    for(int i = 1; i <= 70; i++){

        int x=random(0,49);

        fprintf(plik, "%d,%s,%d,%d,%d%d-%d%d%d,%d,%d\n",i,ulice[x], random(1,400), random(1,200),
                random(0,9), random(0,9), random(0,9), random(0,9), random(0,9),random(1,16), random(1,50) );
    }
	fclose(plik);
}

void pracownik(){
	FILE* plik = fopen("pracownik.csv","w");

    for(int i = 1; i <= 100; i++){

        int x1=random(0,49);
        int x2=random(0,49);

        double ulamek= random(1, 99);
        ulamek = ulamek/100;
        double pensja = random(3500, 10000) + ulamek;

        fprintf(plik, "%d,%s,%s,%d%d%d%d%d%d%d%d%d%d%d,%d%d%d%d%d%d%d%d%d,%0.2f,%d,%d\n",i,imiona[x1], nazwiska[x2],
                random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9),//pesel
                random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9),//numer tel
                pensja,random(1,6), i);
    }
	fclose(plik);
}

void klient(){
	FILE* plik = fopen("klient.csv","w");

    for(int i = 1; i <= 1000; i++){

        int x1=random(0,49);
        int x2=random(0,49);


        int y1=random(0,25);
        int y2=random(0,25);
        int y3=random(0,25);

        int y4=random(0,25);
        int y5=random(0,25);

        fprintf(plik, "%d,%s,%s,%d%d%d%d%d%d%d%d%d%d%d,%s%s%s%d%d%d%d%d%d,%d%d%d%d%d%d%d%d%d,%s%s%d%d%d%d%d%d%d,%d\n",i,imiona[x1], nazwiska[x2],
                random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9),//pesel
                litery[y1], litery[y2], litery[y3],random(0,9), random(0,9), random(0,9),random(0,9), random(0,9), random(0,9), //numer dowodu
                random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9),//numer tel
                litery[y5], litery[y5], random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), random(0,9), //numer prawa jazdy
                i);
    }
	fclose(plik);
}

void placowka(){
	FILE* plik = fopen("placowka.csv","w");

    for(int i = 1; i <= 70; i++){

        fprintf(plik, "%d,Fila nr %d,%d\n",i,i,i );

    }
	fclose(plik);
}

void wypozyczeniaizwrot(){
	FILE* plik1 = fopen("wypozyczenia.csv","w");
    FILE* plik2 = fopen("zwrot.csv","w");


    for(int i = 1; i <= 10000; i++){

        int idklienta= random(1,1000);
        int idsamochodu= random(1,1000);

        double ulamek= random(1, 99);
        ulamek = ulamek/100;

        double cena=random(100, 10000) + ulamek;

        fprintf(plik1, "%d,%d,%d,%d,%d,%d\n", i, random(1,70), random(1,100), idklienta, idsamochodu, i  );
        fprintf(plik2, "%d,%0.2f,%d,%d,%d,%d,%d,%d\n",i, cena, random(1,70),random(1,100),idklienta, idsamochodu, i , i );


    }
	fclose(plik1);
	fclose(plik2);
}

void datawypozyczeniaizwrot(){
	FILE* plik1 = fopen("datazwrot.csv","w");
	FILE* plik2 = fopen("datawypozyczenia.csv","w");

    for(int i = 1; i <= 10000; i++){

        int dzien=random(1,30);
        int miesiac=random(1,12);
        int rok=random(2010,2023);

        if (dzien>28 && miesiac==2){

            miesiac=miesiac+1;
        }

        fprintf(plik1, "%d,%d-%d-%d\n",i,dzien,miesiac,rok );
        fprintf(plik2, "%d,%d-%d-%d\n",i,dzien,miesiac,rok );

    }
	fclose(plik1);
	fclose(plik2);
}
int main()
{
    srand(time(NULL));

    wojewodztwo();
    miasto();
    marka();
    model();
    typ();
    typpaliwa();
    kolor();
    stanowisko();
    cennik();
    samochod();
    rejestracja();
    adresklienta();
    adrespracownika();
    adresplacowki();
    pracownik();
    klient();
    placowka();
    wypozyczeniaizwrot();
    datawypozyczeniaizwrot();

    return 0;
}
