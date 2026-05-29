module top_module (
    input clk,
    input rst_n,
    input [7:0] SW,
    input [1:0] KEY,
    output [7:0] LEDR,
    output [7:0] HEX_01
);

    reg key0_d1, key0_d2;
    always @(posedge clk) begin
        key0_d1 <= KEY[0];     
        key0_d2 <= key0_d1;    
    end
    
    // Phat hien suon xuong
    wire key0_pressed = (key0_d2 & ~key0_d1 );

    // Dung key1 de reset, dung key0 de tang gia tri 
    reg [7:0] count;
    always @(posedge clk or negedge KEY[1]) begin
        if (!KEY[1]) begin
            count <= 8'd0;
        end else if (key0_pressed) begin
            // cong 1 lan
            count <= count + 1'b1;
        end
    end
    
    assign LEDR = count;
    assign HEX_01 = 8'hFF; // hien ra led 7 doan FF

endmodule