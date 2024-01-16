% Skrypt do wywoływania funkcji atmosferycznych i generowania wykresów

fprintf('Wybierz funkcję do obliczeń:\n');
fprintf('1. Obliczenie temperatury dla zadanej wysokości\n');
fprintf('2. Obliczenie ciśnienia dla zadanej wysokości\n');
fprintf('3. Obliczenie gęstości powietrza dla zadanej wysokości\n');
fprintf('4. Obliczenie prędkości dźwięku dla zadanej wysokości\n');

wybor = input('Podaj numer funkcji do obliczeń (1-4): ');

wysokosc = input('Podaj wysokość (w metrach): ');

switch wybor
    case 1
        temperatura_atmosfery(wysokosc);
    case 2
        cisnienie_atmosfery(wysokosc);
    case 3
        gestosc_powietrza_atmosfery(wysokosc);
    case 4
        predkosc_dzwieku_atmosfery(wysokosc);
    otherwise
        disp('Podano niepoprawny numer funkcji.');
end
