############### Haplotype Network in pegas package ###########################

# Load library
library(pegas)
library(ape)

# Read data (vcf file from https://www.datadryad.org/resource/doi:10.5061/dryad.803q8)
dat <- read.vcf("../data/Repeat_filtered.vcf")  #by default it reads the first 10,000 loci.
class(dat) #object class "loci", "data.frame"


## Convert to haplotype.loci
y <- haplotype(dat)
class(y)


## Convert to DNAbin so haplotype net can be created
h <- as.DNAbin(y)
class(h)

## Dna.bin and haplotype
w <- haplotype(h)
class(w)

## Create network
net <- haploNet(w)
plot(net)