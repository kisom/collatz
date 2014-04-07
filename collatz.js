function chain(n) {
	var count = 0;
	while (n > 1) {
		count++;
		if (n % 2 == 0)
			n /= 2;
		else
			n = (n * 3) + 1;
	}
	return count;
}

function num_chains(start, bound) {
	var i = 0;
	var count = 0;

	for (i = 0; i <= start; i++) {
		if (chain(i) > bound)
			count++;
	}
	return count;
}

var start = new Date;
var count = num_chains(100000, 40);
var end = new Date;
console.log('Number of chains: ', count);
console.log('Run time in ms: ', (end - start));
console.log('Heap used: ', process.memoryUsage().heapTotal);
