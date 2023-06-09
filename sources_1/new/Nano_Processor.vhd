----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:35:10 PM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nano_Processor is
Port (     Clk_In : in STD_LOGIC;
           Reset : in STD_LOGIC;
           OverFlow : out std_logic;
           Zero : out std_logic;
           S_7Seg_out: out std_logic_vector(6 downto 0);
           R7_out: out std_logic_vector(3 downto 0);
           anode_out: out std_logic_vector(3 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is

component R7_7_segment is
   Port ( 
    R7 : in std_logic_vector (3 downto 0);
    S_7Seg : out std_logic_vector (6 downto 0);
    anode : out std_logic_vector (3 downto 0)
   );
end component;

component Register_Bank is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : IN STD_LOGIC ;
           Reset : in STD_LOGIC);
end component;

component MUX_2way_3_Bit is
    Port (
        S  : in STD_LOGIC;  
        D0 : in STD_LOGIC_VECTOR(2 downto 0);  
        D1 : in STD_LOGIC_VECTOR(2 downto 0);  
        Y  : out STD_LOGIC_VECTOR(2 downto 0)
    );
end component;

component MUX_2way_4_Bit is
    Port (
        S  : in STD_LOGIC;  
        D0 : in STD_LOGIC_VECTOR(3 downto 0);  
        D1 : in STD_LOGIC_VECTOR(3 downto 0);  
        Y  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component Mux_8Way_4_Bit is
    Port (
        Sel: in STD_LOGIC_VECTOR(2 downto 0);
        Data: in STD_LOGIC_VECTOR(31 downto 0);
        Output: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component Add_Subtract_4bit is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           CTR : in STD_LOGIC);
end component;

component Instruction_Decoder is
    Port ( Instruction_out : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Select : out STD_LOGIC;
           Immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           Register_select_01 : out STD_LOGIC_VECTOR (2 downto 0);
           Register_select_02 : out STD_LOGIC_VECTOR (2 downto 0);
           ADD_SUB_Select : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Address_to_jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_ROM is
    Port ( memory_add : in STD_LOGIC_VECTOR (2 downto 0);
           instruction_out : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Adder_3bit is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           --B : in STD_LOGIC; -- added because of the change in the 3bit adder
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC);
           --C_out : out STD_LOGIC);
           
end component;

component Program_Counter is
    Port ( MUX_2way3_Bit_out : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           memory_add : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

--clock signals added
signal Clk_slow:STD_LOGIC;
signal Clk: STD_LOGIC;
--register bank signals
signal Reg_en : std_logic_vector (2 downto 0);


 
        signal     LoadSelect : STD_LOGIC;
        signal       AddSubUnit4BitOut : STD_LOGIC_VECTOR (3 downto 0);
        signal       ImmediateValue : STD_LOGIC_VECTOR (3 downto 0);
 -- enable signal
        --signal       EN : STD_LOGIC;
-- output
        signal      valueToRegisters: STD_LOGIC_VECTOR (3 downto 0);

    

    



        -- 8 registers
        signal       R0 : STD_LOGIC_VECTOR (3 downto 0);
        signal       R1 : STD_LOGIC_VECTOR (7 downto 4);         
        signal       R2 : STD_LOGIC_VECTOR (11 downto 8);
        signal       R3 : STD_LOGIC_VECTOR (15 downto 12);
        signal       R4 : STD_LOGIC_VECTOR (19 downto 16);
        signal       R5 : STD_LOGIC_VECTOR (23 downto 20);
        signal       R6 : STD_LOGIC_VECTOR (27 downto 24);
        signal       R7 : STD_LOGIC_VECTOR (31 downto 28);
        

        
       -- output signal
        signal       Output: std_logic_vector (3 downto 0);

    

        signal A : STD_LOGIC_VECTOR (3 downto 0);
        signal       B : STD_LOGIC_VECTOR (3 downto 0);
        signal       AddSub_Select : STD_LOGIC;

    

        signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
        signal       Reg_Check_for_Jump : STD_LOGIC_VECTOR (3 downto 0);
        signal       Reg_Enable: STD_LOGIC_VECTOR (2 downto 0);
        signal       Load_Select: STD_LOGIC;
        signal       Immediate_value: STD_LOGIC_VECTOR (3 downto 0);
        signal       Register_select_01: STD_LOGIC_VECTOR (2 downto 0);
        signal       Register_select_02: STD_LOGIC_VECTOR (2 downto 0);
        signal       ADD_SUB_Select: STD_LOGIC;
        signal       Jump_Flag: STD_LOGIC;
        signal       Address_to_jump: STD_LOGIC_VECTOR (2 downto 0);

    

        signal Memory_Select : STD_LOGIC_VECTOR (2 downto 0):="000";
   

        signal PreviousAddressPC : STD_LOGIC_VECTOR (2 downto 0);
        signal       NextAddressPC: STD_LOGIC_VECTOR (2 downto 0);
        signal       C_OUT: STD_LOGIC;

    
    

        signal Mux_2way3_bit_out : STD_LOGIC_VECTOR (2 downto 0);
        signal       MemorySelect: STD_LOGIC_VECTOR (2 downto 0);
        
        signal JumpFlag : STD_LOGIC;
        signal        AddressToJump : STD_LOGIC_VECTOR (2 downto 0);
        signal        Adder_3bit_out : STD_LOGIC_VECTOR (2 downto 0);
        signal        ToNextProgramCounter : STD_LOGIC_VECTOR (2 downto 0);
        


begin
    Slow_Clk0:Slow_Clk
PORT MAP(
        Clk_in=>Clk_In,
        Clk_out=>Clk);
        
 Register_Bank0: Register_Bank
 Port MAP (
            Clk=>Clk,
             EN =>Reg_Enable,
             I =>valueToRegisters,
             Reset=>Reset,
             R0=>R0,
             R1=>R1,
             R2=>R2,
             R3=>R3,
             R4=>R4,
             R5=>R5,
             R6=>R6,
             R7=>R7            
             );
        
        
        
        MUX_2way_3Bit0: MUX_2way_3_Bit 
            Port MAP( S =>Jump_Flag,
                   D0 =>Address_to_jump,
                   D1 =>NextAddressPC,
                   Y  =>ToNextProgramCounter);

        
        
        
        MUX_2way_4Bit0: MUX_2way_4_Bit 
            Port MAP(S =>Load_Select,
                   D0 =>AddSubUnit4BitOut,
                   D1 =>Immediate_value,
                   Y =>valueToRegisters);
        
        MUX_8way_4Bit1: MUX_8way_4_Bit 
        
        -- RegSel will select the register from D1 to D8 it's 3 bit signal
            Port MAP(Sel  =>Register_select_01,
            
            -- 8 registers
                   Data (3 downto 0) =>R0,
                   Data (7 downto 4) =>R1,         
                   Data (11 downto 8) =>R2,
                   Data (15 downto 12) =>R3,
                   Data (19 downto 16) =>R4,
                   Data (23 downto 20) =>R5,
                   Data (27 downto 24) =>R6,
                   Data (31 downto 28) =>R7,
                   Output  =>B);
                   
         MUX_8way_4Bit2: MUX_8way_4_Bit 
                           
                       
                               Port MAP(Sel  =>Register_select_02,
                               
                               -- 8 registers
                                      Data (3 downto 0) =>R0,
                                      Data (7 downto 4) =>R1,         
                                      Data (11 downto 8) =>R2,
                                      Data (15 downto 12) =>R3,
                                      Data (19 downto 16) =>R4,
                                      Data (23 downto 20) =>R5,
                                      Data (27 downto 24) =>R6,
                                      Data (31 downto 28) =>R7,
                                     Output  =>A);
        
        
       Add_Subtract_4bit_0: Add_Subtract_4bit 
            Port MAP(
        
            A0 =>A(0),
            A1 =>A(1),
            A2 =>A(2),
            A3 =>A(3),
           
            B0 =>B(0),
            B1 =>B(1),
            B2 =>B(2),
            B3 =>B(3),
              
            CTR =>ADD_SUB_Select,
            S0  =>AddSubUnit4BitOut(0) ,
            S1  =>AddSubUnit4BitOut(1) ,
            S2  =>AddSubUnit4BitOut(2) ,
            S3  =>AddSubUnit4BitOut(3) ,
            Overflow =>Overflow,
            Zero =>Zero);
        
        
      Instruction_Decoder0: Instruction_Decoder 
            Port MAP(Instruction_out =>Instruction_Bus,
                   Reg_Jump_Check =>B,
                   Reg_EN =>Reg_Enable,
                   Load_Select =>Load_Select,
                   Immediate_value  =>Immediate_value,
                   Register_select_01 =>Register_select_01,
                   Register_select_02 =>Register_select_02,
                   ADD_SUB_Select =>ADD_SUB_Select,
                   Jump_Flag  =>Jump_Flag,
                   Address_to_jump  =>Address_to_jump);
        
        
         Program_ROM0: Program_ROM
            Port MAP(Memory_add =>MemorySelect,
               Instruction_out =>Instruction_Bus);
        
        
               Adder_3bit0: Adder_3bit
            Port MAP(A0 =>MemorySelect(0),
                   A1 =>MemorySelect(1),
                   A2 =>MemorySelect(2),
                   --B => '1',
                   S0 =>NextAddressPC(0),
                   S1 =>NextAddressPC(1),
                   S2 =>NextAddressPC(2));
                   --C_out =>C_OUT);
        
        
        
        Program_Counter0: Program_Counter 
            Port MAP(Mux_2way3_bit_out =>ToNextProgramCounter,
                   Reset =>Reset,
                   Clk =>Clk,
                   Memory_add =>MemorySelect);
                   
        R7_7_segment_0: R7_7_segment 
                  Port map( 
                       R7=>R7,
                       S_7Seg=>S_7Seg_out,
                       anode=>anode_out
                      );
       
R7_out<=R7;

end Behavioral;