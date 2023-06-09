----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:41:47 AM
-- Design Name: 
-- Module Name: Add_Subtract_4bit_tb - Behavioral
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

entity Add_Subtract_4bit_tb is
--  Port ( );
end Add_Subtract_4bit_tb;

architecture Behavioral of Add_Subtract_4bit_tb is
    component Add_Subtract_4bit is
        Port (
            A0     : in  STD_LOGIC;
            A1     : in  STD_LOGIC;
            A2     : in  STD_LOGIC;
            A3     : in  STD_LOGIC;
            B0     : in  STD_LOGIC;
            B1     : in  STD_LOGIC;
            B2     : in  STD_LOGIC;
            B3     : in  STD_LOGIC;
            S0     : out STD_LOGIC;
            S1     : out STD_LOGIC;
            S2     : out STD_LOGIC;
            S3     : out STD_LOGIC;
            Overflow  : out STD_LOGIC;
            Zero : out STD_LOGIC;
            CTR    : in  STD_LOGIC
        );
    end component;

    signal A0_tb, A1_tb, A2_tb, A3_tb, B0_tb, B1_tb, B2_tb, B3_tb, S0_tb, S1_tb, S2_tb, S3_tb, C_out_tb, Zero_tb, CTR_tb : STD_LOGIC;

begin
    UUT: Add_Subtract_4bit port map (
        A0    => A0_tb,
        A1    => A1_tb,
        A2    => A2_tb,
        A3    => A3_tb,
        B0    => B0_tb,
        B1    => B1_tb,
        B2    => B2_tb,
        B3    => B3_tb,
        S0    => S0_tb,
        S1    => S1_tb,
        S2    => S2_tb,
        S3    => S3_tb,
        Overflow => C_out_tb,
        Zero => Zero_tb,
        CTR   => CTR_tb
    );

    -- Stimulus process
    process
    begin
        A0_tb <= '0';
            A1_tb <= '1';
            A2_tb <= '1';
            A3_tb <= '1';
            B0_tb <= '1';
            B1_tb <= '1';
            B2_tb <= '1';
            B3_tb <= '1';
            CTR_tb <= '0';
    
            -- Wait for some time
            wait for 100 ns;
            
            -- Change inputs
            A0_tb <= '1';
            A1_tb <= '1';
            A2_tb <= '1';
            A3_tb <= '1';
            B0_tb <= '0';
            B1_tb <= '1';
            B2_tb <= '0';
            B3_tb <= '1';
            CTR_tb <= '1';
            
            -- Wait for some time
            wait for 100 ns;
        
            
                    B0_tb <= '1';
                    B1_tb <= '0';
                    B2_tb <= '0';
                    B3_tb <= '0';
                    
                    wait for 100 ns;
                    
                    CTR_tb <= '1';
                     B0_tb <= '1';
                                   B1_tb <= '0';
                                   B2_tb <= '1';
                                   B3_tb <= '0';
                    
                    -- Wait for some time
                    wait for 100 ns;
                    
                            -- Change inputs
                    A0_tb <= '1';
                    A1_tb <= '0';
                    A2_tb <= '1';
                    A3_tb <= '0';
                    B0_tb <= '1';
                    B1_tb <= '0';
                    B2_tb <= '0';
                    B3_tb <= '0';
                  
                    
                    -- Wait for some time
                    wait for 100 ns;
                    CTR_tb <= '1';
                    A0_tb <= '1';
                    A1_tb <= '1';
                    A2_tb <= '0';
                    A3_tb <= '0';
                    B0_tb <= '1';
                    B1_tb <= '0';
                    B2_tb <= '1';
                    B3_tb <= '0';
                    
                     wait for 100 ns;
                     
                     CTR_tb <= '0';
                     A0_tb <= '1';
                     A1_tb <= '1';
                     A2_tb <= '0';
                     A3_tb <= '0';
                     B0_tb <= '1';
                     B1_tb <= '0';
                     B2_tb <= '1';
                     B3_tb <= '0';
                     
    end process;

end Behavioral;