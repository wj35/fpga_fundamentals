----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2026 15:52:14
-- Design Name: 
-- Module Name: tb_decoder4 - Behavioral
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

entity tb_decoder4 is
end tb_decoder4;

architecture Behavioral of tb_decoder4 is

    signal i_clk    : std_logic := '1';
    signal i_code   : std_logic_vector(3 downto 0) := (others => '0');
    signal o_decode : std_logic_vector(15 downto 0);

begin

    i_clk <= not i_clk after 5ns;

    process
    begin
        wait for 50ns;
        i_code <= std_logic_vector(unsigned(i_code)+1);
    end process;
    
    u_decoder4 : entity work.decoder4
    port map ( i_clk    => i_clk,
               i_code   => i_code,
               o_decode => o_decode );

end Behavioral;
