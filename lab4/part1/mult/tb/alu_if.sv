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
// File: alu_if.sv
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu_if.sv
 * ----------------------------------------
 * Interface with the ALU wrapper in 'alu_wrap.sv'.
 */

interface alu_if #(parameter DWIDTH = 32);

    /* INTERFACE SIGNALS */
    logic [DWIDTH-1:0]  alu_a;
    logic [DWIDTH-1:0]  alu_b;
    logic [2*DWIDTH-1:0]  alu_res;

	/* INTERFACE EVENTS */
	event trig;

    /* INTERFACE SIGNALS MODE MAPPING */

    /* Interface port at ALU side (DUT) */
    modport alu_port (
        input   alu_a,
        input   alu_b,
        output  alu_res
    );

    // ----------
    // ASSERTIONS
    // ----------
    `ifndef SYNTHESIS
    `include "alu_if_sva.svh"
    `endif /* SYNTHESIS */

endinterface // alu_if
