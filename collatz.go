package main

import (
	"flag"
	"fmt"
	"runtime"
	"time"
)

func collatz(n int) int {
	var count int

	for {
		count++
		if n == 1 {
			break
		} else if n%2 == 0 {
			n /= 2
		} else {
			n *= 3
			n++
		}
	}
	return count
}

func main() {
	bound := flag.Int("b", 40, "chain length boundary")
	start := flag.Int("s", 100, "maximum starting number")
	flag.Parse()

	memStats := &runtime.MemStats{}
	var chainCount int
	startNano := time.Now().UnixNano()
	for i := 2; i <= *start; i++ {
		if collatz(i) > *bound {
			chainCount++
		}
	}
	stopNano := time.Now().UnixNano()
	runTime, err := time.ParseDuration(fmt.Sprintf("%dns", stopNano-startNano))
	if err != nil {
		fmt.Printf("[!] bad duration: %v\n", err)
		return
	}
	runtime.ReadMemStats(memStats)
	fmt.Printf("Number of chains: %d\n", chainCount)
	fmt.Printf("Execution took %s\n", runTime)
	fmt.Printf("Total memory allocated: %d bytes\n", memStats.TotalAlloc)
}
