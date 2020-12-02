var lines = File.ReadAllLines(@"C:\Users\adam\inputs.txt").Select(l => l.Trim());

Console.WriteLine("Executing...");
var regex = new Regex(@"(\d+)-(\d+) (\w): (\w+)");

int validCount = 0;

foreach (var line in lines) {

	var result = regex.Match(line);
	
	var minCount = int.Parse(result.Groups[1].Value);
	var maxCount = int.Parse(result.Groups[2].Value);
	var searchChar = char.Parse(result.Groups[3].Value);
	var password = result.Groups[4].Value;

	int count = password.Where(c => c == searchChar).Count();

	bool valid = (count >= minCount && count <= maxCount);

	if (valid) 
		validCount++;

	Console.WriteLine($"{password} -- {searchChar} -- {count}: {valid}");

}

Console.WriteLine($"ValidCount: {validCount}");
