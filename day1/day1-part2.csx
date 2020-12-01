#!/usr/bin/env dotnet-script

var expenses = File.ReadAllLines(@"inputs.txt").Select(l => int.Parse(l));

foreach (int outer in expenses) {
	foreach (int inner in expenses)	{
 		foreach (int part2 in expenses) {
			if (inner + outer + part2 == 2020) {
				Console.WriteLine($"pair: {inner} and {outer} and {part2}; product: {inner * outer * part2}");
				return;
			}
		}
	}
}
