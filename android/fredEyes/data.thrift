namespace cpp Data


struct Location{
	1: i32 x,
	2: i32 y,
	3: i32 z
}

service FredEyes{
	void setFocus(1:Location focus),
	void setHappiness(1: i32 happyIndex)
}
