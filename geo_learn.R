
# libraries =================================================================

#install.packages("spDataLarge", repos = "https://nowosad.r-universe.dev")

library("sf")
library("terra")
library("spData")
library("spDataLarge")
library("tidyverse")

# playing with world =======================================================

class(world)
names(world)

plot(world)
ggplot(data = world) +
  geom_sf()

plot(world %>% filter(name_long == "Israel"))
world %>% filter(name_long == "Israel") %>%
  ggplot() +
  geom_sf()

plot(world["pop"])

world_asia = world[world$continent == "Asia", ]
asia = st_union(world_asia)
plot(world["pop"], reset = FALSE)
plot(asia, add = TRUE, col = "red")

plot(world["continent"], reset = FALSE)
cex = sqrt(world$pop) / 10000
world_cents = st_centroid(world, of_largest = TRUE)
plot(st_geometry(world_cents), add = TRUE, cex = cex)

israel = world[world$name_long == "Israel", ]
plot(st_geometry(israel), expandBB = c(1, 1, 1, 1), col = "gray", lwd = 3)
plot(world[0], add = TRUE)
