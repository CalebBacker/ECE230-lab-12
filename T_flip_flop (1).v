module t_flipflop(
    input T,             // Toggle control
    input clk,           // Clock input
    input reset,         // reset
    output reg Q,        // Stored output
    output Qn            // inverted output
);

    //  startup state
    initial begin
        Q = 0;
    end

    // Toggle logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
    
    assign Qn = ~Q;

endmodule