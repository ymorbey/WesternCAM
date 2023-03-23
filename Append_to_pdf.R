# How to append plots to a pdf

# use iris as an example

IDs <- unique(iris$Species)  # create list of IDs
num.plots <- length(IDs)     # this is the number of plots to make
my.plots <- vector(num.plots, mode='list')  # create a list of plots

for (i in 1:num.plots) {
  p1 <- ggplot(data = filter(iris,
                             Species ==IDs[i]), 
               aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point()+
    ggtitle(paste("Iris",IDs[i]))+
    theme_bw() 
    print(p1) # print to graphics device (plot window)
    my.plots[[i]] <- recordPlot() # record plot to list 
}
graphics.off() # this turns off the default graphics device

pdf('iris.pdf', onefile=TRUE)   # set up to print to a pdf, set onefile=TRUE to append 
for (my.plot in my.plots) {     # here, my.plot is just an index, like i
  replayPlot(my.plot)
}
graphics.off() # turn off printing to pdf to reset to default graphics device

