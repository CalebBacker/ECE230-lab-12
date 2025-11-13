
module top(
    input        btnU,      
    input        btnC,       
    output [6:0] led         
);
    // Ripple counter outputs
    wire [2:0] ripple_q;

    // Modulo divider outputs
    wire [2:0] mod_state;
    wire       mod_out;

    // ripple counter
    ripple_counter ripple_counter_inst (
        .clk   (btnC),
        .reset (btnU),
        .q     (ripple_q)
    );

    // divider
    modulo_divider modulo_divider_inst (
        .clk   (btnC),
        .reset (btnU),
        .state (mod_state),
        .out   (mod_out)
    );

    // LED outputs
    assign led[0] = ripple_q[0];
    assign led[1] = ripple_q[1]; 
    assign led[2] = ripple_q[2]; 

    // LED outputs
    assign led[3] = mod_state[0];
    assign led[4] = mod_state[1]; 
    assign led[5] = mod_state[2]; 
    assign led[6] = mod_out;      

endmodule
