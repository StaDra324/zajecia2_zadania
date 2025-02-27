# Wczytaj dane tekstowe
# Wczytaj plik tekstowy z lokalnego dysku
text <- readLines("Biden_speech_2024")
text

library(qdap)

frequent_terms <- freq_terms(text)
frequent_terms
frequent_terms <- freq_terms(text, stopwords = Top200Words)
#print(frequent_terms)
png("frequent_terms_plot_2024.png", width = 800, height = 600, res = 100)
plot(frequent_terms)
dev.off()

# Tworzenie chmury słów za pomocą pakietu wordcloud
library(wordcloud)

# Utwórz chmurę słów
png("wordcloud_basic_2024.png", width = 800, height = 600, res = 100)
wordcloud(frequent_terms$WORD, frequent_terms$FREQ)
dev.off()


# Opcje chmury słów
?wordcloud
# Zmiana wartości min.freq i max.words w celu wyświetlenia mniejszej/większej liczby słów.
# min.freq: słowa o częstości poniżej tej wartości nie będą wyświetlane
# max.words: maksymalna liczba słów do wyświetlenia

# Ograniczenie liczby słów w chmurze poprzez określenie minimalnej częstości
png("wordcloud_min_freq_2024.png", width = 800, height = 600, res = 100)
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4)
dev.off()

# Ograniczenie liczby słów w chmurze poprzez określenie maksymalnej liczby słów
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5)

library(RColorBrewer)

# Dodanie różnych palet kolorystycznych
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Blues"))
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Reds"))
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))

# Optymalizacja i dostosowanie wyników
# Dodanie koloru do chmury słów dla lepszej wizualizacji
# Dodanie koloru
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(8,"Dark2"))
# Dodanie koloru
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))
?brewer.pal
brewer.pal.info