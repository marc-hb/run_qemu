#!/bin/bash

# m4_ignore(
echo "This is just a parsing library template, not the library - pass this file to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.9.0
# Rearrange the order of options below according to what you would like to see in the help message.
# ARG_OPTIONAL_SINGLE([rootfs], , [Non-default rootfs image to use], [root.img])
# ARG_OPTIONAL_SINGLE([rebuild], [r], [Choose one of:\n wipe: wipe builddir, removing package cache\n img: rebuild rootfs from scratch and kernel\n kmod: rebuild kernel, update rootfs modules\n none: just inject hmat and start qemu\n], [kmod])
# ARG_OPTIONAL_SINGLE([nvmes], , [Number of NVMe devices to attach], [0])
# ARG_OPTIONAL_SINGLE([nodes], , [Number of nodes (cpu + memory nodes)], [2])
# ARG_OPTIONAL_SINGLE([mems], , [Number of memory-only nodes], [2])
# ARG_OPTIONAL_SINGLE([pmems], , [Number of persistent memory dimms (each on a new node)], [2])
# ARG_OPTIONAL_SINGLE([preset], [p], [Select a preset config of the following:\n 1S  (or tiny)  :  1 nodes,  0 mems,  1 pmems\n 2S0 (or small0):  2 nodes,  0 mems,  2 pmems\n 2S  (or small) :  2 nodes,  2 mems,  2 pmems\n 2S4 (or med)   :  2 nodes,  4 mems,  4 pmems\n 4S  (or large) :  4 nodes,  4 mems,  4 pmems\n 8S  (or huge)  :  8 nodes,  8 mems,  8 pmems\n 16S (or insane): 16 nodes,  0 mems, 16 pmems\n 16Sb(or broken): 16 nodes,  0 mems, 32 pmems\n], [small])
# ARG_OPTIONAL_SINGLE([mem-size], , [size of each system-memory device (in MiB)], [2048])
# ARG_OPTIONAL_SINGLE([kver], , [Attempt to start a specific kver (only respected with --rebuild=none)], )
# ARG_OPTIONAL_SINGLE([mirror], , [Use a different mirror for packages], )
# ARG_OPTIONAL_SINGLE([kcmd-replace], , [Replace the kernel commandline with opions and arguments from FILE.\n One option per line, # to comment out lines.\n You probably don't want this, and are looking for kcmd-append described below], )
# ARG_OPTIONAL_SINGLE([kcmd-append], , [Same as 'kcmd-replace' above, except keep the initial command line supplied in this script,\n and append to it using options listed in FILE], )
# ARG_OPTIONAL_SINGLE([instance], [n], [Instance ID - Offset the ssh port number for the 'hostfwd' argument passed to qemu.\n Offset '0' imlies port '10022'.\n This allows running multiple instances of the script], [0])
# ARG_OPTIONAL_SINGLE([timeout], [t], [Timeout (in minutes) after which the guest is forcibly killed\n '0' to disable any timeout (i.e. normal interactive operation).\n Implies --qmp. This requires either running with --git-qemu (or an env based qemu=<path>), or\n having the 'qmp' script (found in scripts/qmp/ in the qemu source) in PATH], [0])
# ARG_OPTIONAL_SINGLE([autorun], [A], [Set up FILE as a systemd startup script that is run automatically after boot\n Needs rebuild={kmod,img,wipe}], )
# ARG_OPTIONAL_SINGLE([post-script], , [run FILE at the end of the script. If --log was\n provided, pass the logfile as the first argument], )
# ARG_OPTIONAL_SINGLE([log], [l], [Output the qemu console to FILE instead of stdout], )
# ARG_OPTIONAL_BOOLEAN([hmat], [H], [Setup an HMAT table in qemu], )
# ARG_OPTIONAL_BOOLEAN([cxl], , [Setup a sane CXL topology], )
# ARG_OPTIONAL_BOOLEAN([cxl-debug], , [Enable 'dyndbg' for CXL modules. Implies --cxl], )
# ARG_OPTIONAL_BOOLEAN([cxl-hb], , [Enable CXL on the main host bridge], [off])
# ARG_OPTIONAL_BOOLEAN([cxl-test-run], , [CXL unit test mode. Implies the following:\n git-qemu\n cxl\n cxl-debug\n autorun=rq_cxl_tests.sh\n log=/tmp/rq_<instance>.log\n post-script=rq_cxl_results.sh\n timeout=5\n Any of the above can be overridden from the defaults by manually supplying that option\n], )
# ARG_OPTIONAL_BOOLEAN([debug], [v], [Debug script problems (enables set -x)], )
# ARG_OPTIONAL_INCREMENTAL([quiet], [q], [quieten some output, can be repeated multiple times to quieten even more], )
# ARG_OPTIONAL_BOOLEAN([gdb], , [Wait for gdb to connect for kernel debug], )
# ARG_OPTIONAL_BOOLEAN([gdb-qemu], , [Start qemu with gdb], )
# ARG_OPTIONAL_BOOLEAN([qmp], , [Open a QMP socket at unix:./run_qemu_qmp], )
# ARG_OPTIONAL_BOOLEAN([rw], , [Make guest image writeable (remove -snapshot)\n (Note that an image rebuild will lose any changes made via --rw)], )
# ARG_OPTIONAL_BOOLEAN([curses], , [Default display is -nographic. switch to -curses instead with this option.\n Use Esc+1, Esc+2, etc. to switch between the different screens.\n 'q' in the monitor screen to quit], )
# ARG_OPTIONAL_BOOLEAN([git-qemu], [g], [Use a qemu tree at '~/git/qemu/' for qemu binaries.\n This overrides any qemu=<foo> setting from the env.\n This is required and forced for any cxl related options], )
# ARG_OPTIONAL_BOOLEAN([nfit-test], , [Setup an environment for unit tests\n  - include libnvdimm 'extra' modules\n  - add some memmap reserved memory\n Note: --rebuild=img or higher required when switching either to or away from nfit-test.\n This overrides any supplied 'preset' or topology options and forces preset=med], )
# ARG_OPTIONAL_BOOLEAN([defconfig], , [Run 'make olddefconfig' before the kernel build], )
# ARG_OPTIONAL_BOOLEAN([cmdline], , [Print the final qemu command line, but don't start qemu], )
# ARG_OPTIONAL_BOOLEAN([nfit-test-run], , [NFIT unit test mode. Implies the following:\n git-qemu\n nfit-test\n autorun=rq_nfit_tests.sh\n log=/tmp/rq_<instance>.log\n post-script=rq_nfit_results.sh\n timeout=20\n Any of the above can be overridden from the defaults by manually supplying that option\n], )
# ARG_OPTIONAL_BOOLEAN([nfit-debug], , [Turn on extra debugging for nvdimm\n This turns on *.dyndbg for all nvdimm/nfit related modules], )
# ARG_OPTIONAL_BOOLEAN([legacy-bios], [L], [Use legacy BIOS instead of the default OVMF], )
# ARG_OPTIONAL_BOOLEAN([forget-disks], , [Force re-creation of disk images for attached hardware\n (such as nvme disks, pmem DIMMs, OVMF binaries, etc.)], )
# ARG_OPTIONAL_BOOLEAN([no-run], [N], [Stop right before launching qemu], )
# ARG_POSITIONAL_DOUBLEDASH()
# ARG_POSITIONAL_SINGLE([working_dir], [The Linux kernel tree to operate in.\n Switch to this directory before doing anything], [.])
# ARGBASH_SET_DELIM([ =])
# ARG_OPTION_STACKING([getopt])
# ARG_RESTRICT_VALUES([no-local-options])
# ARG_DEFAULTS_POS
# ARG_HELP([Generate customized options to run qemu, using mkosi to create/update a rootfs image if needed])
# ARGBASH_GO