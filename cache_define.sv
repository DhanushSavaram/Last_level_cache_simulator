package cache_define;

parameter SILENT_MODE = 0, NORMAL_MODE = 1;

//Snoop Results of other caches
parameter NOHIT = 2'b11;
parameter HIT = 2'b00;
parameter HITM = 2'b01;

//"---00= HIT,   ---01 = HitM        ---10   or  ---11 = NoHit"

parameter READ = 1;
parameter WRITE = 2;
parameter INVALIDATE = 3;
parameter RWIM = 4; 

 //L2 to L1 Messages
parameter GETLINE = 1;
parameter SENDLINE = 2; 
parameter INVALIDATELINE = 3;
parameter EVICTLINE = 4; 

//MESI bits
parameter I = 2'b00;
parameter E = 2'b01;
parameter M = 2'b10;
parameter S = 2'b11;

parameter CACHE_WIDTH = 32;
parameter WAYS = 16;          
parameter OFFSET_BITS = 6;
parameter CACHE_SIZE = 2**CACHE_WIDTH;
parameter CACHE_LINE_SIZE = 2**OFFSET_BITS;
parameter TOTAL_LINES = CACHE_SIZE / CACHE_LINE_SIZE;

parameter SETS = 2**(TOTAL_LINES/WAYS);          
parameter INDEX_BITS = $clog2(SETS);
parameter PLRU_BITS = WAYS-1;

typedef struct packed {
  bit [1:0]MESI;           
  bit [INDEX_BITS-3:0] tag;
} cache_entry_t;

// typedef enum [1:0]{READ, WRITE, INVALIDATE, RWIM} Bus_Ops;
// typedef enum [1:0]{NOHIT, HIT, HITM} Snoop_Results;
// typedef enum [1:0]{GETLINE, SENDLINE, INVALIDATELINE, EVICTLINE} L2_to_L1;

endpackage
