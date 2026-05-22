----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2026 09:15:07
-- Design Name: 
-- Module Name: priorityEncoder - Behavioral
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

entity priorityEncoder is
    Port ( i_clk : in STD_LOGIC;
           i_code : in STD_LOGIC_VECTOR (15 downto 0);
           o_encode : out STD_LOGIC_VECTOR (3 downto 0));
end priorityEncoder;

architecture Behavioral of priorityEncoder is

    signal f_code : std_logic_vector(15 downto 0);
    signal ff_code : std_logic_vector(15 downto 0);
    signal f_encode : std_logic_vector(3 downto 0);

begin

    o_encode <= f_encode;
    
    process(i_clk)
    begin
        if (rising_edge(i_clk)) then
            f_code <= i_code;
            ff_code <= f_code;
            if (ff_code(15) = '1') then f_encode <= "1111";
            elsif (ff_code(13) = '1') then f_encode <= "1110";
            elsif (ff_code(12) = '1') then f_encode <= "1101";
            elsif (ff_code(11) = '1') then f_encode <= "1100";
            elsif (ff_code(10) = '1') then f_encode <= "1011";
            elsif (ff_code(9) = '1') then f_encode <= "1010";
            elsif (ff_code(8) = '1') then f_encode <= "1001";
            elsif (ff_code(7) = '1') then f_encode <= "1000";
            elsif (ff_code(6) = '1') then f_encode <= "0111";
            elsif (ff_code(5) = '1') then f_encode <= "0110";
            elsif (ff_code(4) = '1') then f_encode <= "0101";
            elsif (ff_code(3) = '1') then f_encode <= "0100";
            elsif (ff_code(2) = '1') then f_encode <= "0011";
            elsif (ff_code(1) = '1') then f_encode <= "0010";
            elsif (ff_code(0) = '1') then f_encode <= "0001";
            else f_encode <= "0000";
            end if;                              
        end if;                         
    end process;
                             
end Behavioral;
