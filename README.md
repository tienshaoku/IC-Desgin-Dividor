# Dividor
Verilog Code of a dividor without clock signal

My method of implemeneting Dividor is to use “carry”.
First I put the “input in1” into a “reg tem[0:11]'s [5:0] position”, then by each iteration shift left “tem” by one bit and compare its [11:6] value to “input in2”.
If it’s bigger than in2, substract in2 from in1[11:6], and add 1 to “temre[5:0]'s highest position(ex: [5] in first iteration)”; else, assign 0 to temre’s corresponding position and pass current value of tem to the next run.
Repete this process for 6 turns(length of in1, in2).

1. Description.pdf: the description of the requirement of the dividor
2. Review.pdf: review over the process of coding
3. div.v: verilog code of the dividor
4. div_tb.v: testbench
5. cycloneii_atoms.v, div.vo: files for simulations
