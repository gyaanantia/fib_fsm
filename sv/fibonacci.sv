module fibonacci(
  input logic clk, 
  input logic reset,
  input logic [15:0] din,
  input logic start,
  output logic [15:0] dout,
  output logic done );

  // TODO: Add local logic signals
  enum logic [1:0] {init, add, finish} state, next_state;
  logic done_c, dout_c;
  logic [15:0] minus_1, minus_2;
  logic [15:0] minus_1_c, minus_2_c;
  logic count;

  always_ff @(posedge clk, posedge reset)
  begin
    if ( reset == 1'b1 ) begin
       state <= init;
       dout <= 16'b0;
       done <= 1'b0;
       minus_1 <= 16'b0;
       minus_2 <= 16'b0;
    end else begin
       state <= next_state;
       dout <= dout_c;
       done <= done_c;
       minus_1 <= minus_1_c;
       minus_2 <= minus_2_c;
    end
  end

  always_comb 
  begin
    case (state)
       init:
            if (start == 1'b1) begin
              done_c = 1'b0;
              if (din > 1) begin
                count = 1;
                minus_2_c = 0;
                minus_1_c = 1;
                next_state = add;
              end
              else begin
                dout_c = din;
                next_state = finish;
              end
            end
        add:
          begin
            dout_c = minus_2 + minus_1;
            minus_2_c = minus_1;
            minus_1_c = minus_2 + minus_1;
            count = count + 1;
            if (count == din) next_state = finish;
            else next_state = add;
          end
        finish:
          begin
            done_c = 1'b1;
            next_state = init;
          end
        default: next_state = init;

    endcase
  end
endmodule
