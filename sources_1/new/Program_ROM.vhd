----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:54:32 PM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( memory_add : in STD_LOGIC_VECTOR (2 downto 0);
           instruction_out : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
    type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);

    signal instruction_rom : rom_type := (
--        "101110001010", --0     MOVI R7,10 
--        "100100000001", --1     MOVI R2,1
--        "010100000000", --2     NEG R2
--        "000010100000", --3     ADD R1 <- R1 + R2 
--        "110010000111", --4     JZR R1,7
--        "000000000000", --5     
--        "000000000000", --6
--        "110000000011"  --7     JZR R0,3

             "100010000001",  -- MOVI R1,1
             "001110010000", -- ADD R7,R1
             "001110010000", -- ADD R7,R1
             "001110010000", -- ADD R7,R1
             "001110010000", -- ADD R7,R1
             "001110010000", -- ADD R7,R1
             "001110010000", -- ADD R7,R1
             "110000000111"  -- JZR R0,7
                   
    );
begin
    instruction_out <= instruction_rom(to_integer(unsigned(memory_add)));
end Behavioral;