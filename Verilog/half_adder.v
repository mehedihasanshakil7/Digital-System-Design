module half_adder(s, c, a, b);
    input a, b;
    output s, c;
    xor(s, a, b);
    and(c, a, b);
endmodule

module half_adder_stimulus;
    reg a, b;
    wire s, c;
    half_adder ha1(s, c, a, b);
    initial
    begin
    a = 1'b0; b = 1'b0;
    #50 b = 1'b1;
    #50 a = 1'b1; b = 1'b0;
    #50 b = 1'b1;
    #200 $finish;
    end
endmodule
