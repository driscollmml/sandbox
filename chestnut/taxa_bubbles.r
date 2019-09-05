#! /usr/local/bin/R


library(dplyr)
library(tidyr)
library(ggplot2)


datatab <- read.table("/Users/tpd0001/github/sandbox/chestnut/bytaxa.composite.txt", stringsAsFactors = FALSE, header = TRUE, sep = "\t")

vars <- c("Cherry", "Chestnut", "Oak")

#gather(datatab[1:3, c('taxon', vars)], key = variable, value = value, -taxon)

df <- datatab[!is.na(datatab$Taxon), c('Taxon', 'Phylum', vars)] %>% # only select the columns we need
  gather(key = variable, value = value, -Taxon, -Phylum) %>%       # make a long table format: gather columns in rows
  filter(!is.na(value)) %>%                               # remove rows with NA-values -> those will be empty spots in the plot
  arrange(Taxon)                                           # order by Taxon
  
# add a "row" column which will be the y position in the plot: group by taxon, then set "row" as group index
df <- df %>% mutate(row = group_indices_(df, .dots=c('Taxon', 'Phylum')))

# add a "col" column which will be the x position in the plot: group by variable, then set "col" as group index
df <- df %>% mutate(col = group_indices_(df, .dots=c('variable')))

# get character vector of variable names for the x axis. the order is important, hence arrange(col)!
vars_x_axis <- c(df %>% arrange(col) %>% select(variable) %>% distinct())$variable
# get character vector of observation names for the y axis. again, the order is important but "df" is already ordered
names_y_axis <- c(df %>% group_by(row) %>% distinct(Taxon) %>% ungroup() %>% select(Taxon))$Taxon


ggplot(df, aes(x=factor(col), y=factor(row), color=Phylum, size=value, alpha=value)) +
  geom_point() +    # plot as points
  geom_text(aes(label=value, x=col + 0.25), alpha=1.0, size=3) +   # display the value next to the "balloons"
  scale_alpha_continuous(range=c(0.4, 0.9)) +
  scale_size_area(max_size = 8) +
  scale_x_discrete(breaks=1:length(vars_x_axis), labels=vars_x_axis, position='top') +   # set the labels on the X axis
  scale_y_discrete(breaks=1:length(names_y_axis), labels=names_y_axis) +                 # set the labels on the Y axis
  theme_bw() +
  theme(text = element_text(family = "Arial"), 
  			axis.line = element_blank(),            # disable axis lines
        axis.title = element_blank(),           # disable axis titles
        panel.border = element_blank(),         # disable panel border
        panel.grid.major.x = element_blank(),   # disable lines in grid on X-axis
        panel.grid.minor.x = element_blank())   # disable lines in grid on X-axis


#  geom_text(aes(label=value, x=col + 0.25), alpha=1.0, size=3) +   # display the value next to the "balloons"

