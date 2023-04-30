module cift_yonlu_bellek (
    input clk,
    input we,                      // tetikleyici
    input [3:0] adres, 
    input [15:0] yaz, 
    output reg [15:0] oku
);

reg [15:0] bellek [0:15];          // 16 satırlı 16 bit veri obegi

always @(posedge clk) begin        // yukselen kenar yaz
    if (we) begin
        bellek[adres] <= yaz;
    end
end

always @(negedge clk) begin        // alcalan kenar oku
    oku <= bellek[adres];
end

endmodule