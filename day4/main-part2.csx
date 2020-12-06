using System.Text.RegularExpressions;

var content = File.ReadAllText(@"input.txt");
var fields = new List<string> { "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid" };
var passports = content.Split(new string[] { Environment.NewLine + Environment.NewLine }, StringSplitOptions.None);

int validCount = 0;
foreach (var passport in passports) {

    var cells = Regex.Split(passport.Trim(), @"\s+");

    var myFields = new string[fields.Count];
    fields.CopyTo(myFields);
    var myFields2 = myFields.ToList();

    var passportIsValid = true;
    Console.WriteLine("---");
    foreach(var cell in cells) {
        var parts = cell.Split(':');
        myFields2.Remove(parts[0]);

        var key = parts[0];
        var value = parts[1];

        bool partIsValid = false;
        switch (key) {
            case "byr":
                try {
                    var year = int.Parse(value);
                    if (year >= 1920 && year <= 2002)
                        partIsValid = true;
                } catch {}

                break;
            case "iyr":
                try {
                    var year = int.Parse(value);
                    if (year >= 2010 && year <= 2020)
                        partIsValid = true;
                } catch {}
                
                break;
            case "eyr":
                try {
                    var year = int.Parse(value);
                    if (year >= 2020 && year <= 2030)
                        partIsValid = true;
                } catch {}
                break;
            case "hgt":
                var m = Regex.Match(value, @"^(\d+)(cm|in)$");
                if (m.Success) {
                    var measure = int.Parse(m.Groups[1].Value);
                    var unit = m.Groups[2].Value;

                    if (unit == "cm") {
                        if (measure >= 150 && measure <= 193)
                            partIsValid = true;
                    } else if (unit == "in") {
                        if (measure >= 59 && measure <= 76)
                            partIsValid = true;
                    }
                }
                break;
            case "hcl":
                var m2 = Regex.Match(value, @"^#[0-9a-f]{6}$");
                if (m2.Success)
                    partIsValid = true;
                break;
            case "ecl":
                var m3 = Regex.Match(value, @"^(amb|blu|brn|gry|grn|hzl|oth)$");
                if (m3.Success)
                    partIsValid = true;
                break;
            case "pid":
                var m4 = Regex.Match(value, @"^[0-9]{9}$");
                if (m4.Success)
                    partIsValid = true;
                break;
            case "cid":
                partIsValid = true; // Ignored, missing or not.
                break;
        }

                if (!partIsValid)
                    Console.WriteLine($"{key}: {partIsValid}: {value}");


        if (!partIsValid)
            passportIsValid = false;

    }

    if (passportIsValid) {
        if ((myFields2.Count == 0) || (myFields2.Count == 1 && myFields2.Contains("cid"))) {
            validCount++;
        }
    }

}

Console.WriteLine($"ValidCount: {validCount}");

