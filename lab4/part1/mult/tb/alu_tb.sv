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
// File: alu_tb.sv
// Author: Michele Caon
// Date: 31/05/2022

/*
 * File: alu_tb.sv
 * ----------------------------------------
 * Testbench for the ALU in 'alu.sv'. It provides to the
 * tester objects a connection point to the DUT using the
 * ALU interface described in 'alu_if.sv').
 */

/* Include the ALU tester classes */
`include "alu_tester.svh"
`include "alu_verbose_tester.svh"

/* Testbench code */
module alu_tb;

    /* Define data width */
    localparam DWIDTH   = 24;

    /* Instantiate ALU interface */
    // interface come i moduli può avere un port list
    // quindi quando lo istanzio devo fare il port map,
    // in questo caso non c'è nessun segnale nel port
    // dell'interface quindi non passo nulla ad "aif"
    alu_if #(DWIDTH)    aif();

    /* Instantiate ALU wrapper */
    // istanzio il wrapper e passo l'interface specificando
    // il modport da passare (alu_port)
    alu_wrap #(DWIDTH)  aw(aif.alu_port);

    /* Declare a quiet tester object */
    alu_tester #(DWIDTH) tst;

    /* Declare a verbose tester object */
    alu_verbose_tester #(DWIDTH) vtst;

    /* Number of test cycles */
    int unsigned    num_cycles = 10;
    int unsigned    err_num = 0;

    /* Run the test */
    initial begin
        /* Instantiate the tester objects */
        tst = new(aif);
        vtst = new(aif);

        /* Set the number of cycles to test */
        // "$value$plusargs" permette di ricevere da linea di comando
        // un parametro con un "+" come prefisso, il parametro viene
        // confrontato con la stringa e se il prefisso del parametro
        // combacia, allora il parametro è convertito in un decimale
        // (%d) e memorizzato in "num_cycles"
        if (0 != $value$plusargs("n%d", num_cycles))
            $display("[CONFIG] Number of test cycles set to %0d", num_cycles);

        /* Run the quiet test */
        $display("\nTEST #1 - Launching ALU quiet test...");
        tst.run_test(num_cycles);
        $display("TEST #1 - Test completed!");
        $display("TEST #1 - Functional coverage: %.2f%%", tst.get_cov());

        /* Run the verbose test */
        $display("\nTEST #2 - Launching ALU verbose test...");
        vtst.run_test(num_cycles);
        $display("TEST #2 - Test completed!");
        $display("TEST #2 - Functional coverage: %.2f%%", tst.get_cov());

        // Print functional coverage
        $display("\nTOTAL FUNCTIONAL COVERAGE: %.2f%%", tst.get_cov());

        // Print the number of errors
        err_num = aif.get_err_num();
        $display("");
        if (err_num > 0) begin
            $error("### TEST FAILED with %0d errors", err_num);
        end else $display("### TEST PASSED!");

        /* Terminate the simulation */
        $display("");
        $stop;
    end
endmodule
