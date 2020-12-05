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

    foreach(var cell in cells) {
        var parts = cell.Split(':');
        myFields2.Remove(parts[0]);
    }


    if ((myFields2.Count == 0) || (myFields2.Count == 1 && myFields2.Contains("cid"))) {
        validCount++;
    }

}

Console.WriteLine($"ValidCount: {validCount}");

