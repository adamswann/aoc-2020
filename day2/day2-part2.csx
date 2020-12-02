var lines = File.ReadAllLines(@"C:\Users\adam\sample.txt").Select(l => l.Trim());

Console.WriteLine("Executing...");
var regex = new Regex(@"(\d+)-(\d+) (\w): (\w+)");

int validCount = 0;

foreach (var line in lines) {

	var result = regex.Match(line);
	
	var minCount = int.Parse(result.Groups[1].Value);
	var maxCount = int.Parse(result.Groups[2].Value);
	var searchChar = char.Parse(result.Groups[3].Value);
	var password = result.Groups[4].Value.ToCharArray();

    bool valid  = ((password[minCount-1] == searchChar) ^ (password[maxCount-1] == searchChar))

	if (valid) 
		validCount++;

	Console.WriteLine($"{password} -- {searchChar} : {valid}");

}

Console.WriteLine($"ValidCount: {validCount}");
