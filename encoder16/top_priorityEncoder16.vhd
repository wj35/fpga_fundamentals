----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2026 16:00:05
-- Design Name: 
-- Module Name: top_decoder4 - Behavioral
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

entity top_priorityEncoder is
    Port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_sw : in STD_LOGIC_VECTOR (15 downto 0);
           o_led : out STD_LOGIC_VECTOR (3 downto 0));
end entity top_priorityEncoder;

architecture Behavioral of top_priorityEncoder is

begin

    u_priorityEncoder16 : entity work.priorityEncoder
    port map ( i_clk => i_clk,
               i_code => i_sw(15 downto 0),
               o_encode => o_led(3 downto 0)
               );

end Behavioral;
