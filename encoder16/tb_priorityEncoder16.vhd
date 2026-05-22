----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2026 09:49:55
-- Design Name: 
-- Module Name: tb_priorityEncoder - Behavioral
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
                                                                       
entity tb_priorityEncoder is                                                  
end tb_priorityEncoder;                                                       
                                                                       
architecture rtl of tb_priorityEncoder is                              
                                                                       
    signal i_clk    : std_logic := '1';                                
    signal i_code   : std_logic_vector(15 downto 0) := (others => '0'); 
    signal o_encode : std_logic_vector(3 downto 0);                   
                                                                       
begin                                                                  
                                                                       
    i_clk <= not i_clk after 5ns;                                      
                                                                       
    process                                                            
    begin                                                              
        wait for 10ns;                                                 
        i_code <= std_logic_vector(unsigned(i_code)+1);                
    end process;                                                       
                                                                       
    u_priorityEncoder : entity work.priorityEncoder                                 
    port map ( i_clk    => i_clk,                                      
               i_code   => i_code,                                     
               o_encode => o_encode );                                 
                                                                       
end rtl;                                                        
