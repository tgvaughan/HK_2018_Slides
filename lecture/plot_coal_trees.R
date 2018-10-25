library(ape)

N <- 20
rows <- 5
cols <- 1

trees <- list()
heights <- c()
for (i in 1:(rows*cols)) {
    trees[[i]] <- rcoal(N)
    heights[i] <- max(node.depth.edgelength(trees[[i]]))
}
maxheight <- max(heights)
print(maxheight)

svg("simulated_coal_trees.svg", width=3, height=5)
par(mfcol=c(rows,cols), mar=c(1,0,0,0))

for (i in 1:(rows*cols)) {
    delta <- maxheight-heights[i]
    plot(trees[[i]], show.tip.label=F, x.lim=c(-delta, heights[i]), root.edge=T, lwd=2)
}

dev.off()
