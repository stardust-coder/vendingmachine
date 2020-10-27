// Code your design here
// Code your design here
module sodamachine(insert_100_yen_coin,insert_500_yen_coin,insert_1000_yen,pull_change,push_A_button,push_B_button,pop_A,pop_B,pop_100_yen_coin,clock,reset);
  input insert_100_yen_coin;
  input insert_500_yen_coin;
  input insert_1000_yen;
  input pull_change;
  input wire push_A_button;
  input wire push_B_button;
  output reg pop_A;
  output reg pop_B;
  output reg [3:0]pop_100_yen_coin;
  input wire clock, reset;
  reg [3:0]state;

  always @(posedge clock or posedge reset)
  begin
    if (reset) begin
      pop_A <= 1'b0;
      pop_B <= 1'b0;
      pop_100_yen_coin <= 4'b0000;
      state <= 4'b0000;
    end else begin
      pop_100_yen_coin <= 4'b0;
      if (state==0) begin
        pop_A <= 1'b0;
        pop_B <= 1'b0;
      end
      if (pull_change == 1) begin
          pop_100_yen_coin <= state;
          state <= 0;
      end else
      if (insert_100_yen_coin == 1) begin
        if (state >= 15)begin
          pop_100_yen_coin <= 1;
        end else
        state <= state + 1;
      end else
      if (insert_500_yen_coin == 1) begin
        if (state >= 11)begin
          pop_100_yen_coin <= 5;
        end else
        state <= state + 5;
      end else
      if (insert_1000_yen == 1) begin
        if (state >= 6)begin
          pop_100_yen_coin <= 10;
        end else
        state <= state + 10;
      end else

      if (state==1) begin
        if (push_A_button == 1) begin
          state <= 0;
          pop_A <= 1'b1;
        end
      end else
      if (state==2) begin
        if (push_A_button == 1) begin
          pop_A <= 1;
          pop_100_yen_coin <= 1;
          state <= 0;
        end
        if (push_B_button == 1) begin
          pop_B <= 1;
          state <= 0;
        end
      end else
      if (state>2) begin
        if (push_A_button == 1) begin
          pop_A <= 1;
          pop_100_yen_coin <= state-1;
          state <= 0;
        end
        if (push_B_button == 1) begin
          pop_B <= 1;
          pop_100_yen_coin <= state-2;
          state <= 0;
        end
      end
    end
  end
endmodule
