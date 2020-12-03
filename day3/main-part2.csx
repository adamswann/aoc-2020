

var lines = File.ReadAllLines(@"input.txt").Select(l => l.Trim());

List<List<bool>> map = new List<List<bool>>();

foreach (var line in lines) {
    if (line.Length > 0) {
            var row = line.Trim().ToCharArray().Select(c => (c == '#' ? true : false));
            map.Add(row.ToList());
    }
}

var answer1 = CountTrees(1, 1, map);
var answer2 = CountTrees(3, 1, map);
var answer3 = CountTrees(5, 1, map);
var answer4 = CountTrees(7, 1, map);
var answer5 = CountTrees(1, 2, map);

var product = answer1*answer2*answer3*answer4*answer5;

Console.WriteLine($"Product: {product}");


int CountTrees(int right, int down, List<List<bool>> map) {

    int x = 0;
    int y = 0;
    int stride = map[0].Count;


    int treeCount = 0;
    while (true) {

        x += right;
        y += down;

        if (y >= map.Count)
            break;

        if (map[y][x % stride]) {
            treeCount++;
            //Console.WriteLine($"({x},{y}: Tree");
        }

    }

    Console.WriteLine($"For {right}, {down}, TreeCount = {treeCount}");
    return treeCount;
    
}
