local s = require("luasnip").snippet
local t = require("luasnip").text_node
local i = require("luasnip").insert_node

return {
	s("pyt", {
		t({
			"import sys",
			"from collections import defaultdict, deque, Counter",
			"from bisect import bisect_left, bisect_right",
			"from heapq import heappush, heappop, heapify",
			"from math import gcd, lcm, sqrt, ceil, floor",
			"",
			"input = sys.stdin.readline",
			"",
			"def inp():",
			"    return int(input())",
			"",
			"def inlt():",
			"    return list(map(int, input().split()))",
			"",
			"def insr():",
			"    return list(input().strip())",
			"",
			"def invr():",
			"    return map(int, input().split())",
			"",
			"def ins():",
			"    return input().strip()",
			"",
			"def solve():",
			"    ",
		}),
		i(1, "# Your solution here"),
		t({
			"",
			"    pass",
			"",
			"if __name__ == '__main__':",
			"    t = inp()",
			"    for _ in range(t):",
			"        solve()",
		}),
	}),
}