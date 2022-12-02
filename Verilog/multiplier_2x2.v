module multiplier_2x2(p, a, b);
	input [1:0] a, b; //b is multiplicand and a is multiplier
	output [3:0] p;
	wire c1;
	assign p[0] = a[0] & b[0];
	half_adder ha1(p[1], c1, a[0]&b[1], a[1]&b[0]);
	half_adder ha2(p[2], p[3], c1, a[1]&b[1]);
endmodule

module half_adder(s, c, a, b);
	input a, b;
	output s,c;
	assign s = a ^ b;
	assign c = a & b;
endmodule

module multiplier_stimulus;
    reg [1:0] a, b;
    wire [3:0] p;
    multiplier_2x2 m1(p, a, b);
    initial
    begin
        a = 2'b00; b = 2'b00;
    #50 a = 2'b00; b = 2'b01;
    #50 a = 2'b00; b = 2'b10;
    #50 a = 2'b00; b = 2'b11;
    #50 a = 2'b01; b = 2'b00;
    #50 a = 2'b01; b = 2'b01;
    #50 a = 2'b01; b = 2'b10;
    #50 a = 2'b01; b = 2'b11;
    #50 a = 2'b10; b = 2'b00;
    #50 a = 2'b10; b = 2'b01;
    #50 a = 2'b10; b = 2'b10;
    #50 a = 2'b10; b = 2'b11;
    #50 a = 2'b11; b = 2'b00;
    #50 a = 2'b11; b = 2'b01;
    #50 a = 2'b11; b = 2'b10;
    #50 a = 2'b11; b = 2'b11;
    #200 $finish;
    end
endmodule
