
var lines = File.ReadAllLines(@"input.txt").Select(l => l.Trim());

List<List<bool>> map = new List<List<bool>>();

foreach (var line in lines) {
    if (line.Length > 0) {
            var row = line.Trim().ToCharArray().Select(c => (c == '#' ? true : false));
            map.Add(row.ToList());
    }
}


int x = 0;
int y = 0;

int stride = map[0].Count;

int treeCount = 0;
while (true) {

    x += 3;
    y += 1;

    if (y >= map.Count)
        break;

    if (map[y][x % stride]) {
        treeCount++;
        Console.WriteLine($"({x},{y}: Tree");
    }

}

Console.WriteLine($"TreeCount = {treeCount}");

