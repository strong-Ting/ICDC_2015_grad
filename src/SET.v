module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );

input clk, rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output busy;
output valid;
output [7:0] candidate;

reg busy;
reg valid;
reg [7:0] candidate;

reg [4:0] current_state,next_state;
//state
parameter INIT = 4'd0;
parameter IDLE = 4'd1;
parameter COMMAND = 4'd2;
parameter OP_0 = 4'd3;
parameter OP_1 = 4'd4;
parameter OP_2 = 4'd5;
parameter OP_3 = 4'd6;
parameter OP_4 = 4'd7;
parameter OP_5 = 4'd8;
parameter RESULT = 4'd9;

//input data reg 
reg signed [3:0] x1,y1,x2,y2,x3,y3,r1,r2,r3;
reg [1:0] mode_buffer;
always@(posedge clk or posedge rst)
begin
    if(rst) 
    begin
        x1 <= 4'd0;
        y1 <= 4'd0;

        x2 <= 4'd0;
        y2 <= 4'd0;

        x3 <= 4'd0;
        y3 <= 4'd0;

        r1 <= 4'd0;
        r2 <= 4'd0;
        r3 <= 4'd0;
    end
    else if(current_state == COMMAND)
    begin
        x1 <= central[23:20];
        y1 <= central[19:16];

        x2 <= central[15:12];
        y2 <= central[11:8];

        x3 <= central[7:4];
        y3 <= central[3:0];

        r1 <= radius[11:8];
        r2 <= radius[7:4];
        r3 <= radius[3:0];
    end
end

always@(posedge clk or posedge rst)
begin
    if(rst) mode_buffer <= 2'd0;
    else if(current_state == COMMAND) mode_buffer <= mode;
end



reg signed [3:0] x,y;

//state switch
always@(posedge clk or posedge rst)
begin
    if(rst) current_state <= IDLE;
    else current_state <= next_state;
end

//next state logic
always@(*)
begin
    case(current_state)
    //INIT: next_state = IDLE;
    IDLE: 
    begin
        if(!en) next_state = IDLE;
        else next_state = COMMAND;
    end
    COMMAND:
    begin
        next_state = OP_0;
    end
    OP_0:
    begin
    	next_state = OP_1;
    end
    OP_1: 
    begin
	    next_state = OP_2;
    end
    OP_2:
    begin
	    next_state = OP_3;
    end
    OP_3:
    begin
	    next_state = OP_4;
    end
    OP_4:
    begin
	    next_state = OP_5;
    end
    OP_5:
        if(x == 4'd8 && y == 4'd8) next_state = RESULT;
        else next_state = OP_0;
    RESULT:
    begin
        next_state = IDLE;
    end
    default: next_state = IDLE;
    endcase
end

//busy
always@(posedge clk or posedge rst)
begin
    if(rst) busy <= 1'd0;
    else if(next_state == COMMAND && next_state == OP_0 && next_state == RESULT) busy <= 1'd1;
    else busy <= 1'd0;
end

//valid
always@(posedge clk or posedge rst)
begin
    if(rst) valid <= 1'd0;
    else if(next_state == RESULT) valid <= 1'd1;
    else valid <= 1'd0;
end

reg signed [3:0] x_a,y_b;
reg signed [8:0] a,b; 
reg signed [8:0] r1pow2;
reg signed [8:0] r2pow2;
reg signed [8:0] r3pow2;
reg signed [8:0] a_add_b;
reg union_A,union_B,union_C;

always@(posedge clk or posedge rst)
begin
    
    if(rst)
    begin
        x_a <= 4'd0;
        y_b <= 4'd1;
        
        a <= 9'd0;
        b <= 9'd0;

        union_A <= 1'd0;
        union_B <= 1'd0;
        union_C <= 1'd0;
    end
    else if(current_state == OP_0)
    begin
	    x_a <= x-x1; //A
    	y_b <= y-y1;
    end
    else if(current_state == OP_1)
    begin    
    	a <= x_a*x_a; //A
    	b <= y_b*y_b;

        x_a <= x-x2; //B
    	y_b <= y-y2;
    end
    else if(current_state == OP_2)
    begin
    	union_A <= ( (a+b) <= r1pow2 ); //A

        a <= x_a*x_a; //B
    	b <= y_b*y_b;

        x_a <= x-x3; //C
    	y_b <= y-y3;
    end
    else if(current_state == OP_3)
    begin
        union_B <= ( (a+b) <= r2pow2 ); //B

        a <= x_a*x_a; //C
    	b <= y_b*y_b;
    end
    else if(current_state == OP_4)
    begin
        union_C <= ( (a+b) <= r3pow2 ); //C
    end
    else if(current_state == OP_5)
    begin
        
    end
end


always@(*)
begin
    case(r1)
    4'd0: r1pow2 = 8'd0;
    4'd1: r1pow2 = 8'd1;
    4'd2: r1pow2 = 8'd4;
    4'd3: r1pow2 = 8'd9;
    4'd4: r1pow2 = 8'd16;
    4'd5: r1pow2 = 8'd25;
    4'd6: r1pow2 = 8'd36;
    4'd7: r1pow2 = 8'd49;
    4'd8: r1pow2 = 8'd64;
    default: r1pow2 = 8'd0; 
    endcase
end

always@(*)
begin
    case(r2)
    4'd0: r2pow2 = 8'd0;
    4'd1: r2pow2 = 8'd1;
    4'd2: r2pow2 = 8'd4;
    4'd3: r2pow2 = 8'd9;
    4'd4: r2pow2 = 8'd16;
    4'd5: r2pow2 = 8'd25;
    4'd6: r2pow2 = 8'd36;
    4'd7: r2pow2 = 8'd49;
    4'd8: r2pow2 = 8'd64;
    default: r2pow2 = 8'd0; 
    endcase
end

always@(*)
begin
    case(r3)
    4'd0: r3pow2 = 8'd0;
    4'd1: r3pow2 = 8'd1;
    4'd2: r3pow2 = 8'd4;
    4'd3: r3pow2 = 8'd9;
    4'd4: r3pow2 = 8'd16;
    4'd5: r3pow2 = 8'd25;
    4'd6: r3pow2 = 8'd36;
    4'd7: r3pow2 = 8'd49;
    4'd8: r3pow2 = 8'd64;
    default: r3pow2 = 8'd0; 
    endcase
end

//candidate
always@(posedge clk or posedge rst)
begin
    if(rst) candidate <= 8'd0; 
    else if(current_state == OP_3 && mode_buffer == 2'b00)
    begin
        if(union_A) candidate <= candidate + 8'd1;
    end
    else if(current_state == OP_4 && mode_buffer == 2'b01)
    begin
        if(union_A && union_B) candidate <= candidate + 8'd1;
    end
    else if(current_state == OP_5 && mode_buffer == 2'b10)
    begin
        if( (union_A && !union_B) || (!union_A && union_B)) candidate <= candidate + 8'd1;
    end
    else if(current_state == OP_5 && mode_buffer == 2'b11)
    begin
        if( !(union_A && union_B && union_C) )
        begin
            if( (union_A && union_B) || (union_B && union_C) || (union_C && union_A))
            begin
                candidate <= candidate + 8'd1;
            end
        end
    end
    else if(current_state == RESULT) candidate <= 8'd0;
end

//x y counter
always@(posedge clk or posedge rst)
begin
    if(rst) x <= 4'd1;
    else if(current_state == OP_5 && x == 4'd8) x <= 4'd1;
    else if(current_state == OP_5) x <= x + 4'd1;
    else if(current_state == RESULT) x <= 4'd1;
end

always@(posedge clk or posedge rst)
begin
    if(rst) y <= 4'd1;
    else if(current_state == OP_5 && x == 4'd8) y <= y + 4'd1;
    else if(current_state == RESULT) y <= 4'd1;
end

endmodule


