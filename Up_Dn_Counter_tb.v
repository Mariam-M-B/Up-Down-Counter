`timescale 1ns/1ps

module Up_Dn_Counter_tb();
reg [4:0] IN ;
reg Load;
reg Up;
reg Down;
reg Clk;
wire  [4:0] Counter;
wire High;
wire Low ;


Up_Dn_Counter DUT(
.IN(IN), 
.Load(Load), 
.Up(Up), 
.Down(Down), 
.Clk(Clk),
.High(High), 
.Low (Low ), 
.Counter(Counter)
);



always #5 Clk=~Clk;


initial 
begin
$dumpfile("UpDnCounter.vcd");
$dumpvars;
Clk = 1'b0;
Load = 1'b0;
Up = 1'b0;
Down = 1'b0;
IN = 5'd5;
$display ("TEST CASE 1") ;  

#8
Load = 1'b1;
IN = 5'd9;
#3
if (Counter==5'd9)
	begin
		$display ("TEST CASE 2") ;
	end
else
	begin
	$display ("Failed CASE 2") ;
	end


#100
$stop;
end
 
 
endmodule
