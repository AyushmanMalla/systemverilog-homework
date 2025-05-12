//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Using code for mux_2_1 as an example,
  // write code for 4:1 mux using "?:" operator

// assign y = (sel == 2'b00) ? d0 : 
//            (sel == 2'b01) ? d1 :
//            (sel == 2'b10) ? d2 : d3; // also a valid solution

assign y = sel[1] ? (sel[0] ? d3 : d2) : (sel[0] ? d1 : d0);

endmodule


/*
---

### 🔹 `s[0]`:

* Refers to **a single bit**.
* Treated as a **scalar** (`1'b0` or `1'b1`).
* Perfectly suited for conditions in `if` statements or ternary expressions.

```verilog
assign y = s[0] ? d1 : d0;  // ✅ scalar condition (legal)
```

---

### 🔹 `s[0:0]`:

* Refers to a **1-bit vector** (i.e., still bit 0, but wrapped in a bus).
* Treated as a **1-bit wide vector** (`wire [0:0]`).
* Using this in conditions **can cause issues** because Verilog expects **scalars** in boolean expressions.

```verilog
assign y = s[0:0] ? d1 : d0;  // ❌ Technically legal, but error-prone and may be rejected
```

In many tools, `s[0:0]` in a conditional is interpreted as an entire vector and not automatically reduced to a scalar. You may get a simulation or synthesis error like:

> *"Conditional expression must be scalar."*

---

### 🔍 Why Your Testbench Passes with `[0]` and Fails with `[0:0]`

When your testbench uses:

```verilog
assign y = s[0] ? d1 : d0;  // ✅ Works fine
```

it works because it's using a scalar condition — expected and allowed.

But if you try:

```verilog
assign y = s[0:0] ? d1 : d0;  // ❌ Fails
```

the tool might complain because you're passing a **1-bit vector**, not a scalar boolean, into a conditional.

---

### ✅ Best Practice:

* Use `s[0]` when you need **a scalar value** (e.g., conditions).
* Use `s[0:0]` only when you truly need a **1-bit vector** (e.g., indexing or concatenation logic).

*/