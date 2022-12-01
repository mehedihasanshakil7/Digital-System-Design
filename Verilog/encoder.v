module encoder(y, x);
    input [7:0] x;
    output [2:0] y;
    or(y[0], x[1], x[3], x[5], x[7]);
    or(y[1], x[2], x[3], x[6], x[7]);
    or(y[2], x[4], x[5], x[6], x[7]);
endmodule

module encoder_stimulus;
    reg [7:0] x;
    wire [2:0] y;
    encoder en1(y, x);
    initial
    begin
         x = a'b00000001;
    #100 x = 8'b00000010;
    #100 x = 8'b00000100;
    #100 x = 8'b00001000;
    #100 x = 8'b00010000;
    #100 x = 8'b00100000;
    #100 x = 8'b01000000;
    #100 x = 8'b10000000;
    #200 $finish;
    end
endmodule
