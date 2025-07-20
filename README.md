
# Pipelined 8-Input Adder Tree

### **Author**: Dulipudi Laashmith Sanjay  
### **College**: Vasireddy Venkatadri Institute of Technology (VVIT)  
### **Tool Used**: Xilinx Vivado 2025.1  

 📌 Project Overview

This project implements a **3-stage pipelined adder tree** to sum **8 unsigned 8-bit inputs** efficiently.  
Pipelining improves throughput by processing new inputs every clock cycle, even while previous additions are still being computed.

The final design simulates successfully in Vivado and is fully synthesizable for FPGA implementation.

 📌 Objective

✅ **Without Pipelining** → The next set of inputs must wait until the entire addition finishes.  
✅ **With Pipelining** → New inputs can be processed **every clock cycle**, increasing throughput.

 📌 Block Diagram (Logical Pipeline Flow)


     Stage 1                Stage 2                Stage 3


(8 Inputs → 4 Adders)   (4 Partial Sums → 2 Adders)   (Final Adder)

in0 ─┐                        s0\_reg ─┐
├─►\[Adder]─► s0 ─►\[DFF]──────────┤
in1 ─┘                                │
│
in2 ─┐                        s1\_reg ─┤
├─►\[Adder]─► s1 ─►\[DFF]──────────┤
in3 ─┘                                │
│
in4 ─┐                        s2\_reg ─┐
├─►\[Adder]─► s2 ─►\[DFF]──────────┤
in5 ─┘                                │
▼
in6 ─┐                        s3\_reg ─┘      p0\_reg ─┐
├─►\[Adder]─► s3 ─►\[DFF]──────────┐            ├─►\[Adder]─► final\_sum\_reg
in7 ─┘                                │      p1\_reg ─┘
▼
┌────────────┴────────────┐
│   p0 = s0\_reg + s1\_reg  │
│   p1 = s2\_reg + s3\_reg  │
└─────────────────────────┘


- **DFFs** (pipeline registers) store intermediate results between stages, allowing new inputs every clock.

 📌 File Structure


/src
├── adder\_8bit.v
├── dff\_8bit.v
├── stage1\_adder.v
├── stage2\_adder.v
├── stage3\_adder.v
└── pipelined\_adder.v   <-- Top Module

/sim
├── tb\_adder\_8bit.v
├── tb\_dff\_8bit.v
├── tb\_stage1\_adder.v
├── tb\_stage2\_adder.v
├── tb\_stage3\_adder.v
└── tb\_pipelined\_adder.v  <-- Final Simulation

 📌 Simulation Results

✅ **Vivado Behavioral Simulation Console Output**  


\===========================================================
Pipelined 8-Input Adder Tree Simulation (CLEAN TEST CASES)
==========================================================

## Time | s0  s1  s2  s3 | p0   p1  | Final

0ns |   0   0   0   0 |   0    0 |   0
15ns |   3   7  11  15 |   0    0 |   0
25ns |  30  70 110 150 |  10   26 |   0
35ns |   0   0   0   0 | 100    4 |   0
45ns |  15  35  55  75 |   0    0 |  36
55ns | 254 254 254 254 |  50  130 | 104
65ns | 254 254 254 254 | 252  252 |   0
75ns | 254 254 254 254 | 252  252 | 180
85ns | 254 254 254 254 | 252  252 | 248
---------------------------------------

Simulation Completed ✅


 📌 Key Learnings

- **Pipelining** increases **throughput** by overlapping computations.
- **DFFs** hold intermediate sums at each stage.
- The final sum is available after **3 clock cycles latency**, but new inputs can be processed **every cycle**.
- Overflow wraps naturally due to 8-bit arithmetic.
