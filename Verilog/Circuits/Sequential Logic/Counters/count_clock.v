module top_module(
    input wire clk,
    input wire reset,
    input wire ena,
    output reg pm,
    output reg [7:0] hh, // BCD: two digits for hours
    output reg [7:0] mm, // BCD: two digits for minutes
    output reg [7:0] ss  // BCD: two digits for seconds
);

always @(posedge clk) begin
    if (reset) begin
        // Reset the clock to 12:00:00 AM
        hh <= 8'b00010010; // 12
        mm <= 8'b00000000; // 00
        ss <= 8'b00000000; // 00
        pm <= 0; // AM
    end else if (ena) begin
        // Increment seconds
        if (ss[3:0] == 4'b1001) begin
            ss[3:0] <= 4'b0000;
            if (ss[7:4] == 4'b0101) begin
                ss[7:4] <= 4'b0000;
                // Increment minutes
                if (mm[3:0] == 4'b1001) begin
                    mm[3:0] <= 4'b0000;
                    if (mm[7:4] == 4'b0101) begin
                        mm[7:4] <= 4'b0000;
                        // Increment hours
                        if (hh == 8'b00010001) begin // 11
                            hh <= 8'b00010010; // 12
                            pm <= ~pm; // Toggle AM/PM
                        end else if (hh == 8'b00010010) begin // 12
                            hh <= 8'b00000001; // 01
                        end else if (hh[3:0] == 4'b1001) begin
                            hh[3:0] <= 4'b0000;
                            hh[7:4] <= hh[7:4] + 1;
                        end else begin
                            hh[3:0] <= hh[3:0] + 1;
                        end
                    end else begin
                        mm[7:4] <= mm[7:4] + 1;
                    end
                end else begin
                    mm[3:0] <= mm[3:0] + 1;
                end
            end else begin
                ss[7:4] <= ss[7:4] + 1;
            end
        end else begin
            ss[3:0] <= ss[3:0] + 1;
        end
    end
end

endmodule


                