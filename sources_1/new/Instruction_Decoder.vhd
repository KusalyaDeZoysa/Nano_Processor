----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:53:43 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4 
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
          EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

 Signal MOVI,ADD,NEG,JZR : STD_LOGIC;
 Signal StatusOfReg : STD_LOGIC;  
 
 begin
 
 Decoder_2_to_4_0 : Decoder_2_to_4 
     port map(
     I(0) => Instruction_out(10),
     I(1) => Instruction_out(11),
     EN => '1',
     Y(0)=> ADD,
     Y(1) => NEG,
     Y(2) => MOVI,
     Y(3) => JZR);
-- If load_Select = 1 addsubunit will be selected if  load_Select = 0 immediate value will be selected

--Load_Select <= ADD OR NEG;

Load_Select <= MOVI;

ADD_SUB_Select <= NEG;
Jump_Flag <= JZR AND (NOT(Reg_Jump_Check(0) OR Reg_Jump_Check(1) OR Reg_Jump_Check(2) OR  Reg_Jump_Check(3) ) );
--StatusOfReg <= MOVI OR ADD OR NEG;

--Reg_Enable <= Instruction_Bus(9 downto 7) WHEN StatusOfReg='1' ELSE "000";

--Reg_EN(0) <= StatusOfReg AND Instruction_out(7);
--Reg_EN(1) <= StatusOfReg AND Instruction_out(8);
--Reg_EN(2) <= StatusOfReg AND Instruction_out(9); 

Reg_EN<= Instruction_out(9 downto 7);

Address_to_jump <= Instruction_out(2 downto 0);
Immediate_value <= Instruction_out(3 downto 0);

--needed only in addition negation?
Register_select_02 <= Instruction_out(9 downto 7);
Register_select_01 <= Instruction_out(6 downto 4);

end Behavioral;