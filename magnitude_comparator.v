module magnitude_comparator(g, e, s, a, b);
    input [1:0] a, b;
    output g, e, s; // g = (A>B), e = (A=B), s = (A<B)
    or(g, (a[1] & ~b[1]), (a[1] & a[0] & ~b[0]), (a[0] & ~b[1] & ~b[0]));
    and(e, ~(a[1] ^ b[1]), ~(a[0] ^ b[0]));
    or(s, (~a[1] & b[1]), (~a[1] & ~a[0] & b[0]), (~a[0] & b[1] & b[0]));
endmodule

module comparator_stimulus;
    reg [1:0] a, b;
    wire g, e, s;
    magnitude_comparator m1(g, e, s, a, b);
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
