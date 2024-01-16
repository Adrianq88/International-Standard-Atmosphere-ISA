function predkosc_dzwieku = predkosc_dzwieku_atmosfery(H)
    % Dane z tabeli
    H_tablica = [0, 11000, 20000, 32000, 47000, 51000, 71000, 80000];
    T_tablica = [288.15, 216.65, 216.65, 228.65, 270.65, 270.65, 214.65, 196.65];
    beta_tablica = [-0.0065, 0.0000, 0.0010, 0.0028, 0.0000, -0.0028, -0.0020];
    R = 287.05287; % indywidualna stała gazowa [J/(K * kg)]
    gamma = 1.4; % adiabatyczny wykładnik sprężania dla powietrza

    % Zaktualizowane wartości ciśnienia bazowego dla różnych przedziałów wysokościowych
    Pb_tablica = [101325, 22632, 5474.9, 868.02, 110.91, 66.939, 3.9564, 0.3734];

    % Sprawdzenie, czy podana wysokość mieści się w przedziale tabeli
    if H < 0 || H > 80000
        error('Podano wysokość spoza zakresu tabeli.');
    end
    
    % Obliczenie temperatury dla podanej wysokości H
    for i = 1:length(H_tablica)-1
        if H >= H_tablica(i) && H <= H_tablica(i+1)
            Tb = T_tablica(i);
            beta = beta_tablica(i);
            Hb = H_tablica(i);
            
            % Obliczenie temperatury
            temperatura = Tb + beta * (H - Hb);
            
            % Obliczenie prędkości dźwięku
            predkosc_dzwieku = sqrt(gamma * R * temperatura);
            disp(['Prędkość dźwięku na wysokości ' num2str(H) ' metrów wynosi: ' num2str(predkosc_dzwieku) ' m/s']);

            return;
        end
    end
end