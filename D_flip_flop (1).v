module d_flipflop(
    input D,             // Data input to store
    input clk,           // Clock input (posedge triggers state change)
    input reset,          // reset button
    output reg Q,        // Stored output
    output Qn            // Inverted output
);

    // defined startup state
    initial  begin
        Q = 0;
    end

    // Edge-sensitive behavior:
    // Trigger when clk transitions from 0 to 1 or when reset from 0 to 1
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else
            Q <= D;
    end

    // Continuous assignment for logical inversion of Q
    assign Qn = ~Q;

endmodule