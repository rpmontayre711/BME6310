load yeastdata.mat
emptySpots = strcmp('EMPTY',genes);
yeastvalues(emptySpots,:) = [];
genes(emptySpots) = [];
nanIndices = any(isnan(yeastvalues),2);
yeastvalues(nanIndices,:) = [];
genes(nanIndices) = [];
mask = genevarfilter(yeastvalues);
yeastvalues = yeastvalues(mask,:);
genes = genes(mask);
[mask, yeastvalues, genes] = genelowvalfilter(yeastvalues,genes,'absval',log2(4));
[mask, yeastvalues, genes] = geneentropyfilter(yeastvalues,genes,'prctile',15);
