module mux_4_to_1(out, i0, i1, i2, i3, s1, s0);
    output out;
    input i0, i1, i2, i3, s1, s0;
    wire s1_bar, s0_bar, a, b, c, d;
    
    not(s1_bar, s1);
    not(s0_bar, s0);
    
    and(a, i0, s1_bar, s0_bar);
    and(b, i1, s1_bar, s0);
    and(c, i2, s1, s0_bar);
    and(d, i3, s1, s0);
    
    or(out, a, b, c, d);
endmodule
