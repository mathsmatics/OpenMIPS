//////////////////////////////////////////////////////////////////////
// Description: 除法模块
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module div(
	input wire						clk,
	input wire						rst,
	
	input wire						signed_div_i,
	input wire[31:0]				opdata1_i,
	input wire[31:0]				opdata2_i,
	input wire						start_i,
	input wire						annul_i,
	
	output reg[63:0]				result_o,
	output reg						ready_o
);

	wire[32:0] div_temp;	// {1+32}
	reg[5:0] cnt;
	reg[64:0] dividend;		// {1+32+32}
	reg[1:0] state;
	reg[31:0] divisor;	 
	reg[31:0] temp_op1;
	reg[31:0] temp_op2;
	
	// 符号位扩展
	assign div_temp = {1'b0,dividend[63:32]} - {1'b0,divisor};

	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			state <= `DivFree;
			ready_o <= `DivResultNotReady;
			result_o <= {`ZeroWord,`ZeroWord};
		end 
		else begin
			case (state)
			`DivFree: begin //DivFree状态
				if(start_i == `DivStart && annul_i == 1'b0) begin
					if(opdata2_i == `ZeroWord) begin
						state <= `DivByZero;
					end 
					else begin
						state <= `DivOn;
						cnt <= 6'b000000;
						// 判断有符号/无符号除法(用assign语句另外写会更简洁)
						if(signed_div_i == 1'b1 && opdata1_i[31] == 1'b1 ) begin
							temp_op1 = ~opdata1_i + 1;
						end else begin
							temp_op1 = opdata1_i;
						end
						if(signed_div_i == 1'b1 && opdata2_i[31] == 1'b1 ) begin
							temp_op2 = ~opdata2_i + 1;
						end else begin
							temp_op2 = opdata2_i;
						end
						dividend <= {`ZeroWord,`ZeroWord};
						dividend[32:1] <= temp_op1;
						divisor <= temp_op2;
					end
				end 
				else begin
					ready_o <= `DivResultNotReady;
					result_o <= {`ZeroWord,`ZeroWord};
				end
			end
			`DivByZero: begin //DivByZero状态
				dividend <= {`ZeroWord,`ZeroWord};// 位数不匹配？
				state <= `DivEnd;
		  	end
		  	`DivOn: begin //DivOn状态
				if(annul_i == 1'b0) begin
					if(cnt != 6'b100000) begin
						if(div_temp[32] == 1'b1) begin
							// dividend << 1
							dividend <= {dividend[63:0] , 1'b0};
						end else begin
							dividend <= {div_temp[31:0] , dividend[31:0] , 1'b1};
						end
						cnt <= cnt + 1;
					end else begin						
						// 符号判断
						if((signed_div_i == 1'b1) && ((opdata1_i[31] ^ opdata2_i[31]) == 1'b1)) begin
							dividend[31:0] <= (~dividend[31:0] + 1);
						end
						if((signed_div_i == 1'b1) && ((opdata1_i[31] ^ dividend[64]) == 1'b1)) begin              
							dividend[64:33] <= (~dividend[64:33] + 1);
						end
						state <= `DivEnd;
						cnt <= 6'b000000;
					end
				end else begin
					state <= `DivFree;
				end	
			end
		  	`DivEnd: begin //DivEnd状态
				result_o <= {dividend[64:33], dividend[31:0]};  
				ready_o <= `DivResultReady;
				if(start_i == `DivStop) begin
					state <= `DivFree;
					ready_o <= `DivResultNotReady;
					result_o <= {`ZeroWord,`ZeroWord};
				end		  	
		  	end
		  	endcase
		end
	end

endmodule