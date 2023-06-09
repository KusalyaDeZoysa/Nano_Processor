----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:16:06 AM
-- Design Name: 
-- Module Name: Register_Bank_TB - Behavioral
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

entity Register_Bank_TB is
--  Port ( );
end Register_Bank_TB;

architecture Behavioral of Register_Bank_TB is
    component Register_Bank is
        Port (
            I : in STD_LOGIC_VECTOR (3 downto 0);
            R0 : out STD_LOGIC_VECTOR (3 downto 0);
            R1 : out STD_LOGIC_VECTOR (3 downto 0);
            R2 : out STD_LOGIC_VECTOR (3 downto 0);
            R3 : out STD_LOGIC_VECTOR (3 downto 0);
            R4 : out STD_LOGIC_VECTOR (3 downto 0);
            R5 : out STD_LOGIC_VECTOR (3 downto 0);
            R6 : out STD_LOGIC_VECTOR (3 downto 0);
            R7 : out STD_LOGIC_VECTOR (3 downto 0);
            EN : in STD_LOGIC_VECTOR (2 downto 0);
            Clk : in STD_LOGIC;
            Reset : in STD_LOGIC
        );
    end component;

    signal I_tb, R1_tb, R2_tb, R3_tb, R4_tb, R5_tb, R6_tb, R7_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal R0_tb: STD_LOGIC_VECTOR (3 downto 0) :="0000";
    signal EN_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Reset_tb : STD_LOGIC;
    signal Clk_tb : STD_LOGIC := '0';

begin

    uut: Register_Bank
    port map (
        I => I_tb,
        R0 => R0_tb,
        R1 => R1_tb,
        R2 => R2_tb,
        R3 => R3_tb,
        R4 => R4_tb,
        R5 => R5_tb,
        R6 => R6_tb,
        R7 => R7_tb,
        EN => EN_tb,
        Clk => Clk_tb,
        Reset => Reset_tb
    );

    -- Clock generation process
    process
    begin
        Clk_tb <= '0';
        wait for 50 ns;
        Clk_tb <= '1';
        wait for 50 ns;
    end process;

    process
    begin
        
        I_tb <= "1110";
        EN_tb <= "111";
        wait for 100 ns;
        
        I_tb <= "0001";
        EN_tb <= "011";
        wait for 100 ns;
        
        I_tb <= "0101";
        EN_tb <= "100";
        wait for 100 ns;
        
        Reset_tb <= '1';
        wait for 100 ns;
        
        Reset_tb <= '0';
        I_tb <= "0011";
        EN_tb <= "010";
        wait for 100 ns;
        
        I_tb <= "1100";
        EN_tb <= "110";
        wait for 100 ns;

       
    end process;

end Behavioral;