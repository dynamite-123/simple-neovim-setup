local s = require("luasnip").snippet
local t = require("luasnip").text_node

return {
	s("cppt", {
		t({
			"#include <bits/stdc++.h>",
			"using namespace std;",
			"",
			"int main() {",
			"    ios::sync_with_stdio(false);",
			"    cin.tie(NULL);",
			"",
			"    return 0;",
			"}",
		}),
	}),
}
