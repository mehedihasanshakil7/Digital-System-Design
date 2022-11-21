//0000->1101->1011->1001->0110->1100->0011->1111->0000
module custom_sequence(q, clear, clk);
    input clear, clk;
    output [3:0] q;
    jk_flip_flop jk1(q[0],,(q[3]&q[2]&~q[1]|~q[3]&~q[2]&~q[1]),(~q[2]&~q[1]|~q[3]&q[2]|q[2]&q[1]),clear,clk);
    jk_flip_flop jk2(q[1],,(q[3]&q[2]|q[3]&q[0]),(q[3]|q[2]|~q[0]),clear,clk);
    jk_flip_flop jk3(q[2],,(q[3]&~q[1]&q[0]|~q[3]&~q[1]&~q[0]|~q[3]&q[1]&q[0]),(q[3]|~q[1]|q[0]),clear,clk);
    jk_flip_flop jk4(q[3],,(~q[2]&~q[1]&~q[0]|~q[2]&q[1]&q[0]|q[2]&q[1]&~q[0]), (~q[2]&~q[1]|~q[1]&~q[0]|q[1]&~q[0]|q[2]&q[1]),clear,clk);
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
