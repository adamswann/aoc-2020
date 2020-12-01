#!/usr/bin/env dotnet-script

var expenses = File.ReadAllLines(@"inputs.txt").Select(l => int.Parse(l));

foreach (int outer in expenses) {
	foreach (int inner in expenses)	{
        if (inner + outer == 2020) {
            Console.WriteLine($"pair: {inner} and {outer}; product: {inner * outer}");
            return;
        }
	}
}