module sync_up_down_counter(q, ud, clear, clk);
    input ud, clear, clk; //ud means up/down: 0=down, 1=up
    output [2:0] q;
    wire a, b, c, d;
    jk_flip_flop jk1(q[0],,1,1,clear,clk);
    xnor(a, ud, q[0]);
    jk_flip_flop jk2(q[1],,a,a,clear, clk);
    and(b, !q[1], !q[0], !ud);
    and(c, q[1], q[0], ud);
    or(d, b, c);
    jk_flip_flop jk3(q[2],,d,d,clear,clk);
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
