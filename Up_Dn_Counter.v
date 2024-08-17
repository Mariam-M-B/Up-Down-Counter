module Up_Dn_Counter (
input wire [4:0] IN ,
input wire Load,
input wire Up,
input wire Down,
input wire Clk,
output reg High,
output reg Low ,
output reg [4:0] Counter 
);

	
always @(posedge Clk)
	begin
		if(Load)
			begin
				Counter <= IN;
			end
		else if((Down|Down&&Up)&&!Low)
			begin
				Counter<= Counter - 5'd1;
			end		
		else if(Up&&!High)
			begin
				Counter<= Counter + 5'd1;
			end
	end
	
	
always @ (*)
	begin
		if(Counter==5'd0)
			begin
				Low= 1'b1;
			end
		else if (Counter==5'd31)
			begin
				High= 1'b1;
			end
		else
			begin
				Low= 1'b0;
		    		High= 1'b0;
			end
	end
	
	
	
endmodule
