namespace PauliGates{
    
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // Origin state for all qubits  |𝜓⟩=𝛼|0⟩+𝛽|1⟩
    operation ApplyY () : Unit {
        using(q = Qubit()){
            Y(q);
            Message("Qubit in state : 𝑖𝛼|1⟩ − 𝑖𝛽|0⟩");
            DumpMachine();
        }
    }

    operation GlobalPhaseI () : Unit{
        using(q = Qubit()){
            Y(q);
            DumpMachine();
            Message("Qubit in state : 𝑖𝛼|1⟩ − 𝑖𝛽|0⟩");

            X(q);
            DumpMachine();
            Message("Qubit in state : 𝑖𝛼|0⟩ - 𝑖𝛽|1");

            Z(q);
            DumpMachine();
            Message("Qubit in state 𝑖𝛼|0⟩ + 𝑖𝛽|1");
        }
    }
}