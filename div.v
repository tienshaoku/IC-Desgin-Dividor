`timescale 1ns / 10ps
module div(out, in1, in2, dbz);

parameter width = 6;

input   [width-1:0] in1; // Dividend
input   [width-1:0] in2; // Divisor
output reg [width-1:0] out; // Quotient
output reg dbz;

reg [11:0] tem[0:11];
reg [5:0] temre;

always@ (*) begin
dbz= in2==0;

tem[0][5:0]= in1;
tem[0][11:6]= 6'b000000;


tem[1]=tem[0]<<1;
if(tem[1][11:6]>= in2) begin
	temre[5]=1;
	tem[2]= {tem[1][11:6]- in2, tem[1][5:0]};
end
else begin
	temre[5]=0;
	tem[2]= tem[1];
end


tem[3]=tem[2]<<1;
if(tem[3][11:6]>= in2) begin
	temre[4]=1;
	tem[4]= {tem[3][11:6]- in2, tem[3][5:0]};
end
else begin
	temre[4]=0;
	tem[4]= tem[3];
end

tem[5]=tem[4]<<1;
if(tem[5][11:6]>= in2) begin
	temre[3]=1;
	tem[6]= {tem[5][11:6]- in2, tem[5][5:0]};
end
else begin
	temre[3]=0;
	tem[6]= tem[5];
end


tem[7]=tem[6]<<1;
if(tem[7][11:6]>= in2) begin
	temre[2]=1;
	tem[8]= {tem[7][11:6]- in2, tem[7][5:0]};
end
else begin
	temre[2]=0;
	tem[8]= tem[7];
end


tem[9]=tem[8]<<1;
if(tem[9][11:6]>= in2) begin
	temre[1]=1;
	tem[10]= {tem[9][11:6]- in2, tem[9][5:0]};
end
else begin
	temre[1]=0;
	tem[10]= tem[9];
end

tem[11]=tem[10]<<1;
if(tem[11][11:6]>= in2) 
	temre[0]=1;
else
	temre[0]=0;
	
out= temre;

end
endmodule