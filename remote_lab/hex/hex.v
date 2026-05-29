`default_nettype none

module top_module (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] SW,
    input  wire [1:0] KEY,
    output wire [7:0] HEX_23, 
    output wire [7:0] HEX_01  
);

    // mach phat hien suong xuong
    reg key0_d1, key0_d2;
    always @(posedge clk) begin
        key0_d1 <= KEY[0];
        key0_d2 <= key0_d1;
    end
    wire key0_pressed = (key0_d2 & ~key0_d1);

    // counter 16 bit
    reg [15:0] counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 16'd0;
        end else if (key0_pressed) begin
            counter <= counter + 1'b1;
        end
    end

    
    // HEX_01 hien thi 2 so thap, HEX_23 hien thi 2 so cao.
    assign HEX_01 = counter[7:0];   // HEX1 = counter[7:4], HEX0 = counter[3:0]
    assign HEX_23 = counter[15:8];  // HEX3 = counter[15:12], HEX2 = counter[11:8]

endmodule