module mod_10_synchronous_counter(q, clear, clk);
    input clear, clk;
    output [3:0] q;
    wire a, b, c, d, e;
    jk_flip_flop jk1(q[0],,1,1,clear,clk);
    and(a, ~q[3], q[0]);
    jk_flip_flop jk2(q[1],,a,a,clear,clk);
    and(b, q[1], q[0]);
    jk_flip_flop jk3(q[2],,b,b,clear,clk);
    and(c, q[0], q[3]);
    and(d, q[2], b);
    or(e, c, d);
    jk_flip_flop jk4(q[3],,e,e,clear,clk);
endmodule

module jk_flip_flop(q, q_bar, j, k, clear, clk);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar, c_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(y, a, y_bar);
	nand(y_bar, y, clear, b);
	not(c_bar, clk);
	nand(c, y, c_bar);
	nand(d, y_bar, c_bar);
	nand(q, c, q_bar);
	nand(q_bar, q, clear, d);
endmodule
