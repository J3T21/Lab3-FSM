module sigdelay# (
    parameter A_WIDTH = 9, //8 bit adress/data width
                D_WIDTH = 8
)(
    input logic [D_WIDTH-1:0] offset,
    input logic clk,
    input logic rst,
    input logic en,
    input logic wr,
    input logic rd,
    input logic [D_WIDTH-1:0] mic_signal,
    output logic [D_WIDTH-1:0] delayed_signal//output data
);

    logic [A_WIDTH-1:0] address;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (offset),
    .count (address)
);

ram2ports sineRam (
    .clk (clk),
    .wr_en(wr),
    .rd_en(rd),
    .wr_addr(address+offset),
    .rd_addr(address),
    .din(mic_signal),
    .dout(delayed_signal)
);

endmodule

