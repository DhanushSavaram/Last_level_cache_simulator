module cache_mem;

    `define INIT_STATE
    localparam int ROWS = 2**14;          
    localparam int COLS = 16;          
    localparam int INDEX_BITS = 14;
    localparam int PLRU_BITS = 15;

   
    typedef struct packed {
        bit valid;  
        bit dirty;              
        bit [INDEX_BITS-1:0] tag;
        bit [PLRU_BITS-1:0] plru;
    } cache_entry_t;
 
    cache_entry_t cache [ROWS][COLS];
   initial begin
   `ifdef INIT_STATE
     begin
for (int i = 0; i < ROWS; i++)
begin
            for (int j = 0; j < COLS; j++)
begin
$display("cache[%0d][%0d]: valid=%b, tag=%b, plru=%b valid=%b dirty=%b",i, j, cache[i][j].valid, cache[i][j].tag, cache[i][j].plru,cache[i][j].valid,cache[i][j].dirty);
end
end
     end
   `endif
   end

    initial begin
      for (int i = 0; i < ROWS; i++)
begin
            for (int j = 0; j < COLS; j++)
begin
cache[i][j].valid = '0;
cache[i][j].dirty = '0;
cache[i][j].tag = '0;
cache[i][j].plru = '0;
               // $display("cache[%0d][%0d]: valid=%b, tag=%h, plru=%b valid=%b dirty=%b",i, j, cache[i][j].valid, cache[i][j].tag, cache[i][j].plru,cache[i][j].valid,cache[i][j].dirty);
            end
        end
    end
endmodule
