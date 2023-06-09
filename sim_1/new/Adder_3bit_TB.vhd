----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:03:53 AM
-- Design Name: 
-- Module Name: Adder_3bit_TB - Behavioral
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

entity Adder_3bit_TB is
--  Port ( );
end Adder_3bit_TB;

architecture Behavioral of Adder_3bit_TB is
    component Adder_3bit is
        Port (
            A0 : in STD_LOGIC;
            A1 : in STD_LOGIC;
            A2 : in STD_LOGIC;
            --B : in STD_LOGIC;
            S0 : out STD_LOGIC;
            S1 : out STD_LOGIC;
            S2 : out STD_LOGIC
        );
    end component;

    signal A0_tb, A1_tb, A2_tb : std_logic;
    --signal b : STD_LOGIC :='1';
    signal S0_tb, S1_tb, S2_tb : std_logic;
    
begin

    uut: Adder_3bit
    port map (
        A0 => A0_tb,
        A1 => A1_tb,
        A2 => A2_tb,
        --B => b,
        S0 => S0_tb,
        S1 => S1_tb,
        S2 => S2_tb
    );
    
    process
    begin
        -- Test case 1
        A0_tb <= '0';
        A1_tb <= '1';
        A2_tb <= '1';
        wait for 200 ns;
        
        A0_tb <= '1';
        A1_tb <= '1';
        A2_tb <= '1';
        wait for 200 ns;
                
        A0_tb <= '0';
        A1_tb <= '0';
        A2_tb <= '1';
        wait for 200 ns;
        
        -- Test case 2
        A0_tb <= '0';
        A1_tb <= '1';
        A2_tb <= '0';
        wait for 200 ns;
        
        -- Test case 3
        A0_tb <= '1';
        A1_tb <= '1';
        A2_tb <= '0';
        --wait for 200 ns;
 
        wait;
       
    end process;
    
end Behavioral;
