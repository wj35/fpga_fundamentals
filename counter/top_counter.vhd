----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2026 15:15:22
-- Design Name: 
-- Module Name: top_counter - Behavioral
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

entity top_counter is
    Port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_sw : in STD_LOGIC_VECTOR (15 downto 0);
           o_led : out STD_LOGIC_VECTOR (15 downto 0));
end entity top_counter;

architecture Behavioral of top_counter is

    constant k_nbits : integer := 26;
    constant k_limit : integer := 49999999;
    signal f_led : std_logic_vector(15 downto 0);
    signal w_done : std_logic;
    signal w_count : std_logic_vector(k_nbits-1 downto 0);
    
begin

o_led <= f_led;

process(i_clk, i_rst)
begin
    if (i_rst = '1') then
        f_led <= (others => '0');
    elsif(rising_edge(i_clk)) then
        if (w_done = '1') then
            f_led <= not f_led;
        end if;
    end if;
end process;

u_counter : entity work.counter 
generic map ( g_nbits => k_nbits )
port map ( i_clk => i_clk,
           i_rst => i_rst,
           i_en => i_sw(0),
           i_limit => std_logic_vector(to_unsigned(k_limit,k_nbits)),
           o_done => w_done,
           o_count => w_count
);

end Behavioral;
