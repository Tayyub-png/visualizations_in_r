#Solution 1: multiple plots using cowplot
##Solution 1.a: density plots
p_beer <- ggdensity(data_vis, x = "beer", fill = "ISLAND", color = "ISLAND", add = "mean", rug = T, palette = c("#00AFBB", "#E7B800"), xlab = expression("Consumption (l"/"y"~")"), title = "Beer", facet.by = "Continent")
p_wine <- ggdensity(data_vis, x = "wine", fill = "ISLAND", color = "ISLAND", add = "mean", rug = T, palette = c("#00AFBB", "#E7B800"), xlab = expression("Consumption (l"/"y"~")"), title = "Wine", facet.by = "Continent")
p_spirits <- ggdensity(data_vis, x = "spirits", fill = "ISLAND", color = "ISLAND", add = "mean", rug = T, palette = c("#00AFBB", "#E7B800"), xlab = expression("Consumption (l"/"y"~")"), title = "Spirits", facet.by = "Continent")
plot_grid(p_beer, p_wine, p_spirits)

##Solution 1.b: violin plots
p_beer <- ggviolin(data_vis, x = "ISLAND", y = "beer", fill = "ISLAND", add = c("boxplot","jitter"), palette = c("#00AFBB", "#E7B800"), ylab = expression("Consumption (l"/"y"~")"), title = "Beer", add.params = list(alpha = .2), facet.by = "Continent", rremove = list(xlab))
p_wine <- ggviolin(data_vis, x = "ISLAND", y = "wine", fill = "ISLAND", add = c("boxplot","jitter"), palette = c("#00AFBB", "#E7B800"), ylab = expression("Consumption (l"/"y"~")"), title = "Wine", add.params = list(alpha = .2), facet.by = "Continent", rremove = list(xlab))
p_spirits <- ggviolin(data_vis, x = "ISLAND", y = "spirits", fill = "ISLAND", add = c("boxplot","jitter"), palette = c("#00AFBB", "#E7B800"), ylab = expression("Consumption (l"/"y"~")"), title = "Spirits", add.params = list(alpha = .2), facet.by = "Continent", rremove = list(xlab))
plot_grid(p_beer, p_wine, p_spirits)

#Solution 2: single plot with facetting - need to make our data tidy first!
data_vis2 <- data_vis %>% gather('beer', 'wine', 'spirits', key = 'alcohol_type', value = 'consumption')
data_vis2

##Solution 2.a: density plot
p <- ggdensity(data_vis2, x = "consumption", fill = "ISLAND", color = "ISLAND", add = "mean", rug = T, palette = c("#00AFBB", "#E7B800"), xlab = expression("Consumption (l"/"y"~")"), facet.by = c("alcohol_type", "Continent"))
p

##Solution 3.a: violin plot
p <- ggviolin(data_vis2, x = "ISLAND", y = "consumption", fill = "ISLAND", add = c("boxplot","jitter"), palette = c("#00AFBB", "#E7B800"), ylab = expression("Consumption (l"/"y"~")"), add.params = list(alpha = .2), facet.by = c("alcohol_type", "Continent"), rremove = list(xlab))
p
