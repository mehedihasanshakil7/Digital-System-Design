module demux_1_to_4(d, x, s);
	input x;
	input [1:0] s;
	output [3:0] d;
	wire s1_bar, s0_bar;
	not(s0_bar, s[0]);
	not(s1_bar, s[1]);
	and(d[0], x, s0_bar, s1_bar);
	and(d[1], x, s[0], s1_bar);
	and(d[2], x, s0_bar, s[1]);
	and(d[3], x, s[0], s[1]);
endmodule
