module gray_to_binary(g, b);
	input [3:0] b;
	output [3:0] g;
	assign g[3] = b[3];
	xor(g[2], g[3], b[2]);
	xor(g[1], g[2], b[1]);
	xor(g[0], g[1], b[0]);
endmodule

module gray_stimulus;
    reg [3:0] b;
    wire [3:0] g;
    gray_to_binary b1(g, b);
    initial
    begin
        b = 4'b0000;
    #50 b = 4'b0001;
    #50 b = 4'b0011;
    #50 b = 4'b0010;
    #50 b = 4'b0110;
    #50 b = 4'b0111;
    #50 b = 4'b0101;
    #50 b = 4'b0100;
    #50 b = 4'b1100;
    #50 b = 4'b1101;
    #50 b = 4'b1111;
    #50 b = 4'b1110;
    #50 b = 4'b1010;
    #50 b = 4'b1011;
    #50 b = 4'b1001;
    #50 b = 4'b1000;
    #200 $finish;
    end
endmodule
