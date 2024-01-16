function temperatura_atmosfery(H)
    % Dane z tabeli
    H_tablica = [0, 11000, 20000, 32000, 47000, 51000, 71000, 80000];
    T_tablica = [288.15, 216.65, 216.65, 228.65, 270.65, 270.65, 214.65, 196.65];
    beta_tablica = [-0.0065, 0.0000, 0.0010, 0.0028, 0.0000, -0.0028, -0.0020];
    
    % Zaktualizowane wartości ciśnienia bazowego dla różnych przedziałów wysokościowych
    Pb_tablica = [101325, 22632, 5474.9, 868.02, 110.91, 66.939, 3.9564, 0.3734];
    
    % Sprawdzenie, czy podana wysokość mieści się w przedziale tabeli
    if H < 0 || H > 80000
        error('Podano wysokość spoza zakresu tabeli.');
    end
    
    % Znalezienie odpowiedniego przedziału dla podanej wysokości
    for i = 1:length(H_tablica)-1
        if H >= H_tablica(i) && H <= H_tablica(i+1)
            Tb = T_tablica(i);
            beta = beta_tablica(i);
            Hb = H_tablica(i);
            Pb = Pb_tablica(i); % Aktualizacja wartości ciśnienia bazowego

            % Obliczanie temperatury 
            temperatura = Tb + (beta * (H - Hb));
            disp(['Temperatura na wysokości ' num2str(H) ' metrów wynosi: ' num2str(temperatura) ' K']);
            
            % Generowanie wykresu
            figure;
            hold on;
            plot(H_tablica, T_tablica, 'o-');
            plot(H, temperatura, 'ro', 'MarkerSize', 10);
            hold off;
            title('Zależność temperatury od wysokości');
            xlabel('Wysokość [m]');
            ylabel('Temperatura [K]');
            grid on;
            
            return;
        end
    end
end