initial begin
  int bool_a,valid_count,cache_read_hits;
  for(int j=0; j<16; j++)
          begin
            if(cache[SET][j].valid==1)begin 
               valid_count=+1;
              if(input_tag==cache[index][j].tag) begin
                cache_read_hits=+1;
                $display("Number of cache read hits = %d",cache_read_hits);
                 bool_a=1;
                break;
            end
              end
            if(bool_a==0 && valid_count!=16) begin
               for(j=0; j<16; j++) begin
               if(cache[SET][j].valid==0) begin
                 cache[SET][j].valid=1;
                 input_tag==cache[index][j].tag; 
                 break;
               end
                 end
                   end
            if( valid_count==16) begin
               for(j=0; j<16; j++) begin
                 if(cache[SET][j].valid==1 && input_tag!==cache[index][j].tag) begin
                 cache[SET][j].valid=1;
                 input_tag==cache[index][j].tag; 
                   //evict cache line
                 break;
               end
                 end
                   end

