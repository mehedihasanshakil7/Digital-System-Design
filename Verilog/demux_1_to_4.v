module demux_1_to_4(d, x, s);
    input x;
    input [1:0] s;
    output [3:0] d;
    and(d[0], x, ~s[0], ~s[1]);
    and(d[1], x, ~s[1], s[0]);
    and(d[2], x, s[1], ~s[0]);
    and(d[3], x, s[1], s[0]);
endmodule

module demux_stimulus;
    reg x;
    reg [1:0] s;
    wire [3:0] d
    demux_1_to_4 d1(d, x, s);
    initial
    begin
    x = 1'b0;
    #50 x = 1'b1; s = 2'b00;
    #50 s = 2'b01;
    #50 s = 2'b10;
    #50 s = 2'b11;
    #200 $finish;
    end
endmodule
