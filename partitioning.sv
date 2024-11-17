module partition(
  input  logic [31:0] memory_ref,     
  output logic [5:0]  byte_select,     
  output logic [13:0] index,          
  output logic [11:0] tag              
);

  always_comb begin
    byte_select = memory_ref[5:0];    
    index = memory_ref[19:6];          
    tag = memory_ref[31:20];          
  end

endmodule

/*module partition_tb;
  logic [31:0] memory_ref;
  logic [5:0]  byte_select;
  logic [13:0] index;
  logic [11:0] tag;

  partition dut (memory_ref,byte_select,index,tag);
  initial begin
    memory_ref = 32'hFFFFFFFF;
    #1;
    $display("Memory Ref: %h", memory_ref);
    $display("Byte Select: %h", byte_select);
    $display("Index: %h", index);
    $display("Tag: %h", tag);
  end
endmodule
*/
