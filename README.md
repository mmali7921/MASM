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
```


### 🖥️ Step 2: Launch DOSBox and Mount the Folder

Start DOSBox:

```bash
dosbox
```
Inside DOSBox, mount your Linux folder as the C: drive:

```bash
MOUNT C: /home/user/MASAM
C:
```

### 🛠️ Step 3: Assemble and Run a Program

Once you're inside the `C:` drive in DOSBox, follow these steps to build, edit, and run your assembly program:

1. **Edit your source code (optional but helpful):**

    ```dos
    EDIT PROGRAM.ASM
    ```

    > Replace `PROGRAM.ASM` with the name of your assembly file. Use `Alt` to access the menu in `EDIT`.

2. **Assemble the source file using MASM:**

    ```dos
    MASM PROGRAM.ASM;
    ```

3. **Link the object file to create an executable:**

    ```dos
    LINK PROGRAM.OBJ;
    ```

4. **Run the compiled executable:**

    ```dos
    PROGRAM.EXE
    ```

---

> 💡 **If you're getting errors during assembling or linking, make sure:**
>
> - Your file names follow the **DOS 8.3 format** (e.g., `HELLO.ASM`)
> - All required tools (`MASM.EXE`, `LINK.EXE`) are in the **mounted directory**

