package cache_define;

//Snoop Results of other caches
`define NOHIT 2'b11
`define HIT 2'b00
`define HITM 2'b01

//"---00= HIT,   ---01 = HitM        ---10   or  ---11 = NoHit"

`define READ 1
`define WRITE 2
`define INVALIDATE 3
`define RWIM 4 

 //L2 to L1 Messages
`define GETLINE 1 
`define SENDLINE 2 
`define INVALIDATELINE 3 
`define EVICTLINE 4 

//MESI bits
`define I 2'b00
`define E 2'b01
`define M 2'b10
`define S 2'b11

PARAMETER CACHE_WIDTH = 32;
PARAMETER WAYS = 16;          
PARAMETER OFFSET_BITS = 6;
PARAMETER CACHE_SIZE = 2**CACHE_WIDTH;
PARAMETER CACHE_LINE_SIZE = 2**OFFSET_BITS;
PARAMETER TOTAL_LINES = CACHE_SIZE / CACHE_LINE_SIZE;

PARAMETER SETS = 2**(TOTAL_LINES/WAYS);          
PARAMETER INDEX_BITS = $clog2(SETS);
PARAMETER PLRU_BITS = WAYS-1;

typedef struct packed {
  bit [1:0]MESI;           
  bit [INDEX_BITS-3:0] tag;
} cache_entry_t;

// typedef enum [1:0]{READ, WRITE, INVALIDATE, RWIM} Bus_Ops;
// typedef enum [1:0]{NOHIT, HIT, HITM} Snoop_Results;
// typedef enum [1:0]{GETLINE, SENDLINE, INVALIDATELINE, EVICTLINE} L2_to_L1;

endpackage

