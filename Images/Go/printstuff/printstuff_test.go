package printstuff

import "testing"


func TestPrintStuff (t *testing.T){
	cases := []struct {
		in, want string
	}{
		{"a","a"},
		{"test","test"},
		{"hello world", "hello world"},
		{"this fails","."},
	}
	for _,c := range cases{
		got := Printstuff(c.in)
		if got != c.want {
			t.Errorf("Printstuff(%q) == %q, want %q", c.in, got, c.want)
		}
	}
}