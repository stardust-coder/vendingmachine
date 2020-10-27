// Code your testbench here
// or browse Examples
module testbench_sodamachine;
  reg in,inin,ininin,state,lever;
  reg a,b;
  reg x,y;
  wire outa,outb,change;

  sodamachine sodamachine_test(
    .insert_100_yen_coin(in),
    .insert_500_yen_coin(inin),
    .insert_1000_yen(ininin),
    .pull_change(lever),
    .push_A_button(a),
    .push_B_button(b),
    .clock(x),
    .reset(y),
    .pop_A(outa),
    .pop_B(outb),
    .pop_100_yen_coin(change)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,sodamachine_test);
    $monitor(in,in,ininin,lever,state,a,b,x,y,outa,outb,change);
    lever = 0;
    in = 0;
    inin = 0;
    ininin = 0;
    x = 0;
    state = 0;
    a = 0;
    b = 0;
    y = 1;
    #5
    y=0;
    #5
    x = 1;
    inin = 1;
    #10
    x = 0;
    #10
    inin = 0;

    x = 1;
    lever = 1;
    #10
    x = 0;
    #10
    lever = 0;

    x = 1;
    inin = 1;
    #10
    x = 0;
    #10
    inin = 0;

    x = 1;
    a = 1;
    #10
    x = 0;
    #10
    a = 0;


    x = 1;
    ininin = 1;
    #10
    x = 0;
    #10
    ininin = 0;

    x = 1;
    b = 1;
    #10
    x = 0;
    #10
    b = 0;

    x = 1;
    ininin = 1;
    #10
    x = 0;
    #10
    ininin = 0;

    x = 1;
    in = 1;
    #10
    x = 0;
    #10
    in = 0;

    x = 1;
    in = 1;
    #10
    x = 0;
    #10
    in = 0;

    x = 1;
    inin = 1;
    #10
    x = 0;
    #10
    inin = 0;

    x = 1;
    lever=1;
    #10
    x = 0;
    #10
    lever=0;

    $finish;
  end
endmodule
