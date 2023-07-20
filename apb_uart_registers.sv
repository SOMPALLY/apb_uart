//////////////////////////////////////////////////////////////////////
//                                                                  //
//  File name : apb_uart_registers.sv                               //
//  Author    : Bhaskara Naidu                                      //
//  Course    : System and Functional Verification Using UVM 	    //
//  Date      : 20 Jul 2023             			    //
//                                                                  //
////////////////////////////////////////////////////////////////////// 
///////////////RECEIVE BUFFER REGISTER/////////////////////////////////////////
class apb_uart_rb_register extends uvm_reg;
	//Fields of receive buffer 
	rand uvm_reg_field RSVD_RBR;
	rand uvm_reg_field RBR;

	//register to the factory
	`uvm_object_utils(apb_uart_rb_register)

	//constructor
	function new(input string name="apb_uart_rb_register");
		super.new(name,32,UVM_NO_COVERAGE);
	endfunction:new

	//build
	virtual function void build();
		RSVD_RBR = uvm_reg_field::type_id::create("RSVD_RBR");
		RBR = uvm_reg_field::type_id::create("RBR");

		//instance specific configuration
		////parent,size,lsb,access,volatility,reset,has_reset,rand,individually_accessable
		RSVD_RBR.configure(this,23,9,"RO",0,1'b0,1,1,0);
		RBR.configure(this,9,0,"RO",0,1'b0,1,1,0);
	endfunction:build
endclass:apb_uart_rb_register

////////////////////////////DIVISOR LATCH LOW REGISTER/////////////////////////
class apb_uart_dll_register extends uvm_reg;
	//fields of the divisor latch low register
	rand uvm_reg_field RSVD_DLL_31to8;
	rand uvm_reg_field DLL;

	//register to the factory
	`uvm_object_utils(apb_uart_dll_register)

	//constructor
	function new(input string name="apb_uart_dll_register");
		super.new(name,32,UVM_NO_COVERAGE);
	endfunction:new

	//build
	virtual function void build();
		RSVD_DLL_31to8 = uvm_reg_field::type_id::create("RSVD_DLL_31to8");
		DLL = uvm_reg_field::type_id::create("DLL");

		//instance specific configuration
		//parent,size,lsb,access,volatility,reset,has_reset,rand,individually_accessable
		RSVD_DLL_31to8.configure(this,24,8,"RO",0,1'b0,1,1,0);
		DLL.configure(this,8,0,"RW",0,1'b0,1,1,0);
	endfunction:build
endclass:apb_uart_dll_register

