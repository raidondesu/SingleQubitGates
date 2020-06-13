namespace PauliGates{
    
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // Origin state for all qubits  |𝜓⟩=𝛼|0⟩+𝛽|1⟩
    operation ApplyY () : Unit {
        Message("Running ApplyY");
        let divider = "--------------------------------------------------------------------------------------------------";
        using(q = Qubit()){
            DumpMachine();
            Message(divider);
            Y(q);
            Message("Qubit in state : 𝑖𝛼|1⟩ − 𝑖𝛽|0⟩");
            DumpMachine();
            Message(divider);
            Reset(q);
        }
    }

    operation ApplyX () : Unit {
        Message("Running ApplyX");
        let divider = "--------------------------------------------------------------------------------------------------";
        using(q = Qubit()){
            DumpMachine();
            Message(divider);
            X(q);
            Message("Qubit in state : -𝑖𝛼|0⟩ + 𝑖𝛽|1⟩");
            DumpMachine();
            Message(divider);
            Reset(q);
        }
    }

    operation ApplyZ () : Unit {
        Message("Running ApplyZ");
        let divider = "--------------------------------------------------------------------------------------------------";
        using(q = Qubit()){
            Z(q);
            Message("Qubit in state : -𝑖𝛼|0⟩ + 𝑖𝛽|1⟩");
            DumpMachine();
            Message(divider);
            Reset(q);
        }
    }
    
    operation GlobalPhaseI () : Unit{
        using(q = Qubit()){
            Message("GlobalPhase test");
            Y(q);
            DumpMachine();
            Message("Qubit in state : 𝑖𝛼|1⟩ − 𝑖𝛽|0⟩");

            X(q);
            DumpMachine();
            Message("Qubit in state : 𝑖𝛼|0⟩ - 𝑖𝛽|1");

            Z(q);
            DumpMachine();
            Message("Qubit in state 𝑖𝛼|0⟩ + 𝑖𝛽|1");
            Reset(q);
        }
    }

    operation PauliGates_Demo () : Unit {
        let divider = "--------------------------------------------------------------------------------------------------";
        // This allocates a qubit for us to work with
        using (q = Qubit()) {
        
        // This will put the qubit into an uneven superposition |𝜓❭,
        // where the amplitudes of |0⟩ and |1⟩ have different moduli
            Ry(1.0, q);

            Message("Qubit in state |𝜓❭:");
            DumpMachine();
            Message(divider);
        
        // Let's apply the X gate; notice how it swaps the amplitudes of the |0❭ and |1❭ basis states
            X(q);
            Message("Qubit in state X|𝜓❭:");
            DumpMachine();
            Message(divider);
        
        // Applying the Z gate adds -1 relative phase to the |1❭ basis states
            Z(q);
            Message("Qubit in state ZX|𝜓❭:");
            DumpMachine();
            Message(divider);
        
        // Finally, applying the Y gate returns the qubit to its original state |𝜓❭, with an extra global phase of i
            Y(q);
            Message("Qubit in state YZX|𝜓❭:");
            DumpMachine();
        
        // This returns the qubit into state |0❭
            Reset(q);
    }
}

}