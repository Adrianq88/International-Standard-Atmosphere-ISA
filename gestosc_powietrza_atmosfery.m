function gestosc_powietrza = gestosc_powietrza_atmosfery(H)
    % Dane z tabeli
    H_tablica = [0, 11000, 20000, 32000, 47000, 51000, 71000, 80000];
    T_tablica = [288.15, 216.65, 216.65, 228.65, 270.65, 270.65, 214.65, 196.65];
    beta_tablica = [-0.0065, 0.0000, 0.0010, 0.0028, 0.0000, -0.0028, -0.0020];
    g = 9.80665; % przyspieszenie ziemskie [m/s^2]
    R = 287.05287; % indywidualna stała gazowa [J/(K * kg)]

    % Zaktualizowane wartości ciśnienia bazowego dla różnych przedziałów wysokościowych
    Pb_tablica = [101325, 22632, 5474.9, 868.02, 110.91, 66.939, 3.9564, 0.3734];

    % Sprawdzenie, czy podana wysokość mieści się w przedziale tabeli
    if H < 0 || H > 80000
        error('Podano wysokość spoza zakresu tabeli.');
    end 
    
    % Obliczenie temperatury i ciśnienia dla podanej wysokości H
    for i = 1:length(H_tablica)-1
        if H >= H_tablica(i) && H <= H_tablica(i+1)
            Tb = T_tablica(i);
            beta = beta_tablica(i);
            Hb = H_tablica(i);
            Pb = Pb_tablica(i); % Aktualizacja wartości ciśnienia bazowego
            
            % Obliczenia temperatury
            temperatura = Tb + beta * (H - Hb);
            
            % Obliczenia ciśnienia
            cisnienie = Pb * ((1 + beta * (H - Hb) / Tb) ^ (-g / (beta * R)));

            % Obliczenie gęstości powietrza
            gestosc_powietrza = cisnienie / (R * temperatura);
            disp(['Gęstość powietrza na wysokości ' num2str(H) ' metrów wynosi: ' num2str(gestosc_powietrza) ' kg/m^3']);

            return;
        end
    end
end