
# Digital System Design with Verilog
### Reference Books:
* Verilog HDL - Samir Palnitkar
* Digital Logic and Computer Design - M. Morris Mano

### Contents (listed alphabetically)
* [Adder Subtractor](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/adder_subtractor.v)
* [BCD to Excess3](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/bcd_to_excess_3.v)
* [Carry Look Ahead Adder](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/carry_look_ahead_adder.v)
* [Demultiplexer (1-to-4)](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/demux_1_to_4.v)
* [Excess3 to BCD](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/excess_3_to_bcd.v)
* [JK Flip Flop (master slave)](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/jk_flip_flop.v)
* [Mod-10 Asynchronous Counter](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/mod_10_async_counter.v)
* [Multiplexer (4-to-1)](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/mux_4_to_1.v)
* [Ripple Carry Counter (4-bit/Mod-16)](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/ripple_carry_counter.v)
* [Synchronous Up Down Counter (3-bit)](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/sync_up_down_counter.v)
* [Random Sequence (4-bit)](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/random_sequence.v)

## BCD to Excess-3 code converter
![bcd_to_excess_3](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/bcd_to_excess_3.jpg)
# Code

```verilog
module bcd_to_excess_3(b, a);
	input [3:0] a;
	output [3:0] b;
	wire p, q;
	assign b[0] = ~a[0];
	xnor(b[1], a[1], a[0]);
	or(p, a[1], a[0]);
	xor(b[2], a[2], p);
	and(q, a[2], p);
	or(b[3], a[3], q);
endmodule

module bcd_stimulus;
	reg [3:0] a;
	wire [3:0] b;
	bcd_to_excess_3 bcd(b, a);
	initial
	begin
	    a = 4'b0000;
	#50 a = 4'b0001;
	#50 a = 4'b0010;
	#50 a = 4'b0011;
	#50 a = 4'b0100;
	#50 a = 4'b0101;
	#50 a = 4'b0110;
	#50 a = 4'b0111;
	#50 a = 4'b1000;
	#50 a = 4'b1001;
	#50 $finish;
	end
endmodule
```

## Excess-3 to  BCD code converter
![excess3_to_bcd](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/excess_3_to_bcd.jpg)
# Code

```verilog
module excess_3_to_bcd(b, a);
	input [3:0] a;
	output [3:0] b;
	assign b[0] = ~a[0];
	xor(b[1], a[1], a[0]);
	xor(b[2], a[2], (~a[1] | ~a[0]));
	and(b[3], a[3], (a[2] | (a[1] & a[0])));
endmodule

module excess3_stimulus;
	reg [3:0] a;
	wire [3:0] b;
	excess_3_to_bcd excess(b, a);
	initial
	begin
	    a = 4'b0011;
	#50 a = 4'b0100;
	#50 a = 4'b0101;
	#50 a = 4'b0110;
	#50 a = 4'b0111;
	#50 a = 4'b1000;
	#50 a = 4'b1001;
	#50 a = 4'b1010;
	#50 a = 4'b1011;
	#50 a = 4'b1100;
	#50 $finish;
	end
endmodule
```

## Master slave jk flip flop
![jk_flip_flop](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/jk_flip_flop.jpg)
# Code 

```verilog
module jk_flip_flop(q, q_bar, j, k, clear, clk);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar, c_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(y, a, y_bar);
	nand(y_bar, y, clear, b);
	not(c_bar, clk);
	nand(c, y, c_bar);
	nand(d, y_bar, c_bar);
	nand(q, c, q_bar);
	nand(q_bar, q, clear, d);
endmodule
```

## 4-bit ripple carry counter
![ripple_carry_counter](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/ripple_carry_counter.jpg)
# Code

```verilog
module ripple_carry_counter(q, clear, clk);
	input clk, clear;
	output [3:0] q;
	jk_flip_flop jk1(q[0], , 1, 1, clear, clk);
	jk_flip_flop jk2(q[1], , 1, 1, clear, q[0]);
	jk_flip_flop jk3(q[2], , 1, 1, clear, q[1]);
	jk_flip_flop jk4(q[3], , 1, 1, clear, q[2]);
endmodule

module jk_flip_flop(q, q_bar, j, k, clear, clk);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar, c_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(y, a, y_bar);
	nand(y_bar, y, clear, b);
	not(c_bar, clk);
	nand(c, y, c_bar);
	nand(d, y_bar, c_bar);
	nand(q, c, q_bar);
	nand(q_bar, q, clear, d);
endmodule
```

## Mod 10 Asynchronous counter circuit
![Mod-10-async](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/mod_10_async_counter.jpg)
# Code

```verilog
module mod_10_asyn_counter(q, clear, clk);
    input clear, clk;
    output [3:0] q;
    wire a;
    nand(a, q[1], q[3]);
    jk_flip_flop jk0(q[0],,1,1,(clear && a), clk);
    jk_flip_flop jk1(q[1],,1,1,(clear && a), q[0]);
    jk_flip_flop jk2(q[2],,1,1,(clear && a), q[1]);
    jk_flip_flop jk3(q[3],,1,1,(clear && a), q[2]);
endmodule

module jk_flip_flop(q, q_bar, j, k, clear, clk);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar, c_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(c, a, d);
	nand(d, c, clear, b);
	not(c_bar, clk);
	nand(y, c, c_bar);
	nand(y_bar, d, c_bar);
	nand(q, y, q_bar);
	nand(q_bar, q, clear, y_bar);
endmodule
```

## 3-bit synchronous up/down counter
![sync_up_down_counter](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/sync_up_down_counter.jpg)
# Code

```verilog
module sync_up_down_counter(q, ud, clear, clk);
    input ud, clear, clk; //ud means up/down: 0=down, 1=up
    output [2:0] q;
    wire a, b, c, d;
    jk_flip_flop jk1(q[0],,1,1,clear,clk);
    xnor(a, ud, q[0]);
    jk_flip_flop jk2(q[1],,a,a,clear, clk);
    and(b, !q[1], !q[0], !ud);
    and(c, q[1], q[0], ud);
    or(d, b, c);
    jk_flip_flop jk3(q[2],,d,d,clear,clk);
endmodule

module jk_flip_flop(q, q_bar, j, k, clear, clk);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar, c_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(y, a, y_bar);
	nand(y_bar, y, clear, b);
	not(c_bar, clk);
	nand(c, y, c_bar);
	nand(d, y_bar, c_bar);
	nand(q, c, q_bar);
	nand(q_bar, q, clear, d);
endmodule
```

## Random sequence by synchronous counter (4-bit)
### 0000->1101->1011->1001->0110->1100->0011->1111->0000
#### Circuit is too complicated. Verilog implementation from boolean function of inputs
# Code
```verilog
//0000->1101->1011->1001->0110->1100->0011->1111->0000
module random_sequence(q, clear, clk);
    input clear, clk;
    output [3:0] q;
    jk_flip_flop jk1(q[0],,(q[3]&q[2]&~q[1]|~q[3]&~q[2]&~q[1]),(~q[2]&~q[1]|~q[3]&q[2]|q[2]&q[1]),clear,clk);
    jk_flip_flop jk2(q[1],,(q[3]&q[2]|q[3]&q[0]),(q[3]|q[2]|~q[0]),clear,clk);
    jk_flip_flop jk3(q[2],,(q[3]&~q[1]&q[0]|~q[3]&~q[1]&~q[0]|~q[3]&q[1]&q[0]),(q[3]|~q[1]|q[0]),clear,clk);
    jk_flip_flop jk4(q[3],,(~q[2]&~q[1]&~q[0]|~q[2]&q[1]&q[0]|q[2]&q[1]&~q[0]), (~q[2]&~q[1]|~q[1]&~q[0]|q[1]&~q[0]|q[2]&q[1]),clear,clk);
endmodule

module jk_flip_flop(q, q_bar, j, k, clear, clk);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar, c_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(y, a, y_bar);
	nand(y_bar, y, clear, b);
	not(c_bar, clk);
	nand(c, y, c_bar);
	nand(d, y_bar, c_bar);
	nand(q, c, q_bar);
	nand(q_bar, q, clear, d);
endmodule
```

## 4-bit binary adder subtractor
![adder_subtractor](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/adder_subtractor.jpg)
# Code

```verilog
module adder_subtractor(s, cout, a, b, mode);
    input [3:0] a, b;
    input mode;
    output [3:0] s;
    output cout;
    wire c0, c1, c2;
    full_adder fa1(s[0], c0, a[0], (b[0]^mode), mode);
    full_adder fa2(s[1], c1, a[1], (b[1]^mode), c0);
    full_adder fa3(s[2], c2, a[2], (b[2]^mode), c1);
    full_adder fa4(s[3], cout, a[3], (b[3]^mode), c2);
endmodule

module full_adder(s, cout, a, b, cin);
    input a, b, cin;
    output s, cout;
    wire p, q, r;
    half_adder ha1(p, q, a, b);
    half_adder ha2(s, r, p, cin);
    or(cout, q, r);
endmodule

module half_adder(s, cout, a, b);
    input a, b;
    output s, cout;
    xor(s, a, b);
    and(cout, a, b);
endmodule
```

## 4-to-1 multiplexer
![mux_4_to_1](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/mux_4_to_1.jpg)
# Code

```verilog
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
```

## 1-to-4 demultiplexer
![demux_1_to_4](https://github.com/mehedihasanshakil7/Digital-System-Design/blob/main/Verilog/demux_1_to_4.jpg)
# Code

```verilog
module demux_1_to_4(d, x, s);
	input x;
	input [1:0] s;
	output [3:0] d;
	wire s1_bar, s0_bar;
	not(s0_bar, s[0]);
	not(s1_bar, s[1]);
	and(d[0], x, s0_bar, s1_bar);
	and(d[1], x, s[0], s1_bar);
	and(d[2], x, s0_bar, s[1]);
	and(d[3], x, s[0], s[1]);
endmodule
```
