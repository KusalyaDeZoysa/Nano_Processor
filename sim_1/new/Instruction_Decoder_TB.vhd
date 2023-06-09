----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:06:03 AM
-- Design Name: 
-- Module Name: Instruction_Decoder_TB - Behavioral
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

entity Instruction_Decoder_TB is
--  Port ( );
end Instruction_Decoder_TB;

architecture Behavioral of Instruction_Decoder_TB is
   

    -- Signals
    signal Instruction_out: std_logic_vector(11 downto 0);
    signal Reg_Jump_Check: std_logic_vector(3 downto 0);
    signal Reg_EN: std_logic_vector(2 downto 0);
    signal Load_Select: std_logic;
    signal Immediate_value: std_logic_vector(3 downto 0);
    signal Register_select_01: std_logic_vector(2 downto 0);
    signal Register_select_02: std_logic_vector(2 downto 0);
    signal ADD_SUB_Select: std_logic;
    signal Jump_Flag: std_logic;
    signal Address_to_jump: std_logic_vector(2 downto 0);

    -- Component Declaration
    component Instruction_Decoder is
        Port (
            Instruction_out: in std_logic_vector(11 downto 0);
            Reg_Jump_Check: in std_logic_vector(3 downto 0);
            Reg_EN: out std_logic_vector(2 downto 0);
            Load_Select: out std_logic;
            Immediate_value: out std_logic_vector(3 downto 0);
            Register_select_01: out std_logic_vector(2 downto 0);
            Register_select_02: out std_logic_vector(2 downto 0);
            ADD_SUB_Select: out std_logic;
            Jump_Flag: out std_logic;
            Address_to_jump: out std_logic_vector(2 downto 0)
        );
    end component;

begin
    -- Device Under Test (DUT) instantiation
    UUT: Instruction_Decoder
    port map (
        Instruction_out => Instruction_out,
        Reg_Jump_Check => Reg_Jump_Check,
        Reg_EN => Reg_EN,
        Load_Select => Load_Select,
        Immediate_value => Immediate_value,
        Register_select_01 => Register_select_01,
        Register_select_02 => Register_select_02,
        ADD_SUB_Select => ADD_SUB_Select,
        Jump_Flag => Jump_Flag,
        Address_to_jump => Address_to_jump
    );

   
   

    -- Stimulus Process
    process
    begin
        -- Set input signals
        Instruction_out <= "100100001110"; -- MOV R2,14
            wait for 100 ns;
            
            Instruction_out <= "010100011110"; -- NEG R2
            wait for 125 ns;
            
           Instruction_out <= "101100000001"; -- MOV R6,1
            wait for 100 ns;
            
           Instruction_out <= "101010001010"; -- MOV R5,10
            wait for 100 ns;
            
           Instruction_out <= "001101010000"; -- ADD R6,R5
            wait for 125 ns;
            
            Instruction_out <= "110010000100"; -- JZR R1,4
            wait for 125 ns;
            
            Instruction_out <= "111010001001"; -- JZR R5,9
            wait for 100 ns;
            
            Reg_Jump_Check <= "1110";
            wait for 125 ns;
            
            Reg_Jump_Check <= "0000";
            wait for 100 ns;
    end process;

end Behavioral;