
# load packages and fireflies -----------------------------------------------------------

library(tidyverse)

firefly_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")

firefly_data
# A tibble: 35 x 1
#> spermatophoreMass
#> <dbl>
#> 1             0.047
#> 2             0.037
#> 3             0.041
#> 4             0.045
#> 5             0.039
#> 6             0.064
#> 7             0.064
#> 8             0.065
#> 9             0.079
#> 10             0.07 
# ... with 25 more rows

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass), binwidth = 0.005,
                 fill = "#C5351B", color = "black") +
  labs(x = "Mass of Spermatophore (mg)", y = "Frequency (number of fireflies)") +
  theme_classic() +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )


# Bird Order --------------------------------------------------------------

library(auk)                          # load the auk package
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B") + 
  labs(x = "Order", y = "Frequency (number of birds)", 
       title = "Number of Birds in an Order") +
  scale_y_continuous(limits = c(0, 7000), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )