# 💻 MASM Assembly Programs (Using DOSBox on Linux)

This repository contains MASM (Microsoft Macro Assembler) programs written for the Intel 8086 microprocessor. These programs are assembled and run using MASM inside DOSBox on a Linux system.

---

## 📁 What's Included

- `.ASM` files — Assembly language source code
- Setup and usage instructions
- Example programs and their output

---

## ✅ Prerequisites

You’ll need the following installed:

- [DOSBox](https://www.dosbox.com/) — DOS emulator for Linux
- MASM tools:
  | Tool        | Purpose                          | Example Command         |
  |-------------|----------------------------------|-------------------------|
  | `MASM.EXE`  | Assembler: `.ASM` → `.OBJ`       | `MASM PROGRAM.ASM`      |
  | `LINK.EXE`  | Linker: `.OBJ` → `.EXE`          | `LINK PROGRAM.OBJ`      |
  | `EDIT.COM`  | Editor: Optional text editor     | `EDIT PROGRAM.ASM`      |

---

## ⚙️ Setup & Execution

### 🗂️ Step 1: Create a Project Directory

```bash
mkdir -p ~/MASAM
