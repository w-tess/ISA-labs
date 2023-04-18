// Copyright 2022 Politecnico di Torino.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-2.0. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// File: alu_wrap.sv
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu_wrap.sv
 * ----------------------------------------
 * A simple wrapper to use the interface defined in 'alu_if.sv' 
 * instead of direct port mapping. This component also allows to
 * connect the interface to a VHDL DUT (compiled separately).
 */

module alu_wrap #(parameter DWIDTH = 32) (
    // istanzio l'interfaccia per la ALU da testare,
    // l'istanza si chiama "p"
    alu_if.alu_port p
);
    r8_mbe_multiplier r8_mbe_mult_u (
        .multiplicand    (p.alu_a),
        .multiplier      (p.alu_b),
        .multiplication  (p.alu_res)
    );
endmodule
