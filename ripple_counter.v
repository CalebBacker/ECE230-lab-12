module ripple_counter(
    input        clk,    // input clock
    input        reset,  // reset 
    output [2:0] q       // outputs
);
    wire q0, q1, q2;
    wire qn0, qn1, qn2;

   

    // Stage 0
    t_flipflop stage0 (
        .T   (1'b1),
        .clk (clk),
        .reset (reset),
        .Q   (q0),
        .Qn  (qn0)
    );

    // Stage 1
    t_flipflop stage1 (
        .T   (1'b1),
        .clk (q0),
        .reset (reset),
        .Q   (q1),
        .Qn  (qn1)
    );

    // Stage 2
    t_flipflop stage2 (
        .T   (1'b1),
        .clk (q1),
        .reset (reset),
        .Q   (q2),
        .Qn  (qn2)
    );

    assign q = {q2, q1, q0};

endmodule
