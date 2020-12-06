using System.Text.RegularExpressions;

var passes = File.ReadAllLines(@"input.txt");

long max = 0;
foreach (var pass in passes) {
    var row = BinaryParse(pass.Trim().Substring(0, 7), 'F', 'B');
    var seat = BinaryParse(pass.Trim().Substring(7, 3), 'L', 'R');
    var seatId = row * 8 + seat;
    Console.WriteLine($"{pass} -> {row} -> {seat} -> {seatId}");
    
    max = Math.Max(max, seatId);
}

Console.WriteLine($"Max = {max}");

long BinaryParse(string pass, char zero, char one) {
    var rowCode = pass;
    rowCode = rowCode.Replace(zero, '0');
    rowCode = rowCode.Replace(one, '1');
    return Convert.ToInt64(rowCode, 2);
}