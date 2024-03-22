# Here I generate the hexSticker for EcoCoupleR package:

library(hexSticker) # hexagon sticker package
library(tidyverse)  # data manipulation
library(viridis)    # color palette
library(showtext)   # for using Google fonts

## Loading Google fonts (http://www.google.com/fonts)
font_add_google("The Girl Next Door")

## Automatically use showtext to render text
showtext_auto()

# Generate data:
x <- c(1, 2, 3, 4, 5, 6)
y <- c(5, 6, 7.5, 10, 9, 6)
# To make groups and color the value within the envelope:
z <- c(0, 0, 1, 0, 0, 0)

# Make a data frame of x, y and z:
df <- data.frame(x, y, z)

# Set colors (different color for envelope point):
point_colors <- ifelse(df$z == 1, "white", "#44bf70")

# Plot:
p <- ggplot(df, aes(x = x, y = y)) +
  geom_line(color = "#22a884") +
  geom_point(size = 1.5, color = point_colors) +
  geom_ribbon(aes(ymin = 7, ymax = 8), alpha = 0.5, fill = "#44bf70") +
  # y and x lim
  ylim(3, 12) + xlim(0, 7) +
  guides(color = FALSE)

# Erase all the aesthetics:
p <- p + theme_void() + theme_transparent()

# Print:
p

# Final sticker:
sticker(p, package = "EcoCoupleR", p_size = 20,
        s_x = 1, s_y = .8, s_width = 1.9, s_height=1.3,
        filename="sticker/ecocoupler_logo.png",
        h_fill = "#482475", h_color = "#4ec36b", h_size = 2,
        p_family = "The Girl Next Door")
