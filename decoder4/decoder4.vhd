 ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2026 15:39:45
-- Design Name: 
-- Module Name: decoder4 - Behavioral
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

entity decoder4 is
    Port ( i_clk : in STD_LOGIC;
           i_code : in STD_LOGIC_VECTOR (3 downto 0);
           o_decode : out STD_LOGIC_VECTOR (15 downto 0));
end entity decoder4;

architecture Behavioral of decoder4 is

    signal f_code : std_logic_vector(3 downto 0);
    signal ff_code : std_logic_vector(3 downto 0);
    signal f_decode : std_logic_vector(15 downto 0);
    
begin

    o_decode <= f_decode;
    
    process(i_clk)
    begin
        if (rising_edge(i_clk)) then
            f_code <= i_code;
            ff_code <= f_code;
            case ff_code is
                when "0000" => f_decode <= b"0000_0000_0000_0001";
                when "0001" => f_decode <= b"0000_0000_0000_0010";
                when "0010" => f_decode <= b"0000_0000_0000_0100";
                when "0011" => f_decode <= b"0000_0000_0000_1000";
                when "0100" => f_decode <= b"0000_0000_0001_0000";
                when "0101" => f_decode <= b"0000_0000_0010_0000";
                when "0110" => f_decode <= b"0000_0000_0100_0000";
                when "0111" => f_decode <= b"0000_0000_1000_0000";
                when "1000" => f_decode <= b"0000_0001_0000_0000";
                when "1001" => f_decode <= b"0000_0010_0000_0000";
                when "1010" => f_decode <= b"0000_0100_0000_0000";
                when "1011" => f_decode <= b"0000_1000_0000_0000";
                when "1100" => f_decode <= b"0001_0000_0000_0000";
                when "1101" => f_decode <= b"0010_0000_0000_0000";
                when "1110" => f_decode <= b"0100_0000_0000_0000";
                when "1111" => f_decode <= b"1000_0000_0000_0000";
                when others => null;
            end case;
        end if;
   end process;
               
end Behavioral;
