module decoder_3_to_8(d, a, en);
    input [2:0] a;
    input en; //To enable circuit
    output [7:0] d;
    and(d[0], ~a[0], ~a[1], ~a[2], en);
    and(d[1], a[0], ~a[1], ~a[2], en);
    and(d[2], ~a[0], a[1], ~a[2], en);
    and(d[3], a[0], a[1], ~a[2], en);
    and(d[4], ~a[0], ~a[1], a[2], en);
    and(d[5], a[0], ~a[1], a[2], en);
    and(d[6], ~a[0], a[1], a[2], en);
    and(d[7], a[0], a[1], a[2], en);
endmodule

module decoder_stimulus;
    reg en;
    reg [2:0] a;
    wire [7:0] d;
    decoder_3_to_8 d1(d, a, en);
    initial
    begin
    a = 3'b110; en = 1'b0;
    #50 a = 3'b000; en = 1'b1;
    #50 a = 3'b001;
    #50 a = 3'b010;
    #50 a = 3'b011;
    #50 a = 3'b100;
    #50 a = 3'b101;
    #50 a = 3'b110;
    #50 a = 3'b111;
    #50 a = 3'b111; en = 1'b0;
    #200 $finish;
    end
endmodule
    
