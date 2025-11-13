module modulo_divider(
    input        clk,     
    input        reset,   
    output [2:0] state,   
    output       out      
);
    // Current counter value
    wire [2:0] count_q;
    // Next counter value
    wire [2:0] count_d;
    // Sum = count_q + 1
    wire [2:0] sum;
    wire c1, c2, c3;

    //  3-bit incrementer using full adders: sum = count_q + 1
    full_adder fa0 (
        .A    (count_q[0]),
        .B    (1'b1),
        .Cin  (1'b0),
        .Y    (sum[0]),
        .Cout (c1)
    );

    full_adder fa1 (
        .A    (count_q[1]),
        .B    (1'b0),
        .Cin  (c1),
        .Y    (sum[1]),
        .Cout (c2)
    );

    full_adder fa2 (
        .A    (count_q[2]),
        .B    (1'b0),
        .Cin  (c2),
        .Y    (sum[2]),
        .Cout (c3) // unused
    );

    // Detect terminal count = 5 (binary 101)
    wire is_5;
    assign is_5 = count_q[2] & ~count_q[1] & count_q[0];

    // Next count value:
    //  - If reset:        next = 0
    //  - Else if count=5: next = 0 (wrap)
    //  - Else:            next = sum (count + 1)
    assign count_d = reset ? 3'b000 :
                      (is_5 ? 3'b000 : sum);

    // D flip-flops for counter bits
    wire qn0, qn1, qn2;

    d_flipflop dff0 (
        .D   (count_d[0]),
        .clk (clk),
        .reset (reset),
        .Q   (count_q[0]),
        .Qn  (qn0)
    );

    d_flipflop dff1 (
        .D   (count_d[1]),
        .clk (clk),
        .reset (reset),
        .Q   (count_q[1]),
        .Qn  (qn1)
    );

    d_flipflop dff2 (
        .D   (count_d[2]),
        .clk (clk),
        .reset(reset),
        .Q   (count_q[2]),
        .Qn  (qn2)
    );

    // Output flip-flop toggles on count 5
    wire out_q;
    wire out_d;
    wire out_qn;

    // If reset:         out = 0
    // Else if count=5:  out = ~out
    // Else:             out = out
    assign out_d = reset  ? 1'b0 :
                   (is_5 ? ~out_q : out_q);

    d_flipflop dff_out (
        .D   (out_d),
        .clk (clk),
        .reset (reset),
        .Q   (out_q),
        .Qn  (out_qn)
    );

    assign state = count_q;
    assign out   = out_q;

endmodule
