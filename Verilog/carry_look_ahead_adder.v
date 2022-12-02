module carry_look_ahead_adder(s, cout, a, b, cin);
    input [3:0] a, b;
    input cin;
    output [3:0] s;
    output cout;
    wire [3:0] p, g, c;
    assign p = a ^ b;
    assign g = a & b;
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
    assign s = p ^ c;
endmodule

module cla_stimulus;
	reg [3:0] a, b;
	reg cin;
	wire [3:0] s;
	wire cout;
	carry_look_ahead_adder cla1(s, cout, a, b, cin);
	initial
	begin
	    a = 4'b0000; b = 4'b0000; cin = 1'b0;
	#50 a = 4'b0001; b = 4'b0001;
	#50 a = 4'b0001; b = 4'b0001; cin = 1'b1;
	#50 a = 4'b1010; b = 4'b0101; cin = 1'b0;
	#50 a = 4'b0111; b = 4'b0101;
	#50 a = 4'b1000; b = 4'b1001;
	#50 a = 4'b0011; b = 4'b0011;
	#50 a = 4'b0011; b = 4'b0011; cin = 1'b1;
	#50 a = 4'b1010; b = 4'b0101;
	#200 $finish;
	end
endmodule
