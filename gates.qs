namespace PauliGates{
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Instrinsic;
    open Microsoft.Quantum.Canon;

    // Origin state for all qubits  |𝜓⟩=𝛼|0⟩+𝛽|1⟩
    operation ApplyY (q: Qubit) : Unit is Adj+Ctl {
        Y(q);
        Message("Qubit in state : 𝑖𝛼|1⟩−𝑖𝛽|0⟩");
        DumpMachine();
    }
}