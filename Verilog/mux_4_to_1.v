module mux_4_to_1(f, i, s);
    input [3:0] i;
    input [1:0] s;
    output f;
    wire a, b, c, d;
    and(a, i[0], ~s[1], ~s[0]);
    and(b, i[1], ~s[1], s[0]);
    and(c, i[2], s[1], ~s[0]);
    and(d, i[3], s[1], s[0]);
    or(f, a, b, c, d);
endmodule

module mux_stimulus;
    reg [3:0] i;
    reg [1:0] s;
    wire f;
    mux_4_to_1 m1(f, i, s);
    initial
    begin
    i = 4'b1110; s = 2'b00;
    #50 i = 4'b1001;
    #50 i = 4'b0101; s = 2'b01;
    #50 i = 4'b0010;
    #50 i = 4'b1011; s = 2'b10;
    #50 i = 4'b0100;
    #50 i = 4'b0111; s = 2'b11;
    #50 i = 4'b1000;
    #200 $finish;
    end
endmodule
