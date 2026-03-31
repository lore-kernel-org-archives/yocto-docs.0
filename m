Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1D010D149B
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 12:29:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18832.1774960165812761036
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 05:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=PB8kLrcu;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D3614983;
	Tue, 31 Mar 2026 05:29:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 115373F7D8;
	Tue, 31 Mar 2026 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774960165; bh=UkgN+nzt+fVyTtalT+RI5ekCvkinZJ97pI9Le77gUO8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PB8kLrcuSfrMIiJEIxfCRNmyRq/ekkjAmy8HtsgtxdJDzoKsOik9k2JIiIzEVGV2D
	 oD7LUuJ+BbhI0kBAlg9Wtc0LKxC9A7sOFlNh5G6qbVqTZqBtZlczdCwky18NEB8aKO
	 yXfxc5/loLQJ/Tm6au24QVMU2sFMxe27rIwFJ2cM=
From: Jon Mason <jon.mason@arm.com>
To: docs@lists.yoctoproject.org
Subject: [RFC PATCH 1/1] ref-manual: add boot architecture documentation
Date: Tue, 31 Mar 2026 08:29:23 -0400
Message-ID: <20260331122924.54516-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331122924.54516-1-jon.mason@arm.com>
References: <20260331122924.54516-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 12:29:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9152

Add a new documentation page describing the firmware and bootloader
architecture used by systems built with the Yocto Project across
multiple processor architectures.

The document explains the typical boot stages (Boot ROM, platform
firmware, system firmware, and OS loader) and provides example boot
flows for Arm, Arm64, RISC-V, and x86 systems.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../ref-manual/boot-architecture.rst          | 361 ++++++++++++++++++
 documentation/ref-manual/index.rst            |   1 +
 2 files changed, 362 insertions(+)
 create mode 100644 documentation/ref-manual/boot-architecture.rst

diff --git a/documentation/ref-manual/boot-architecture.rst b/documentati=
on/ref-manual/boot-architecture.rst
new file mode 100644
index 000000000000..e801e0a402d5
--- /dev/null
+++ b/documentation/ref-manual/boot-architecture.rst
@@ -0,0 +1,361 @@
+Boot Architecture and Firmware Components
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This document describes the firmware and boot architecture used by
+systems built with the Yocto Project across several processor
+architectures:
+
+* Arm (Arm32)
+* Arm64 (AArch64)
+* RISC-V
+* x86 / x86_64
+
+Understanding the firmware chain is important when configuring Yocto
+Project builds because multiple software components can fulfill the
+same role in the boot process. These components are often mutually
+exclusive and are typically selected through BitBake providers or
+machine configuration.
+
+
+Boot Process Overview
+---------------------
+
+Most systems boot through a sequence of stages that progressively
+initialize the hardware and load the operating system. Control typically
+passes from more privileged and trusted stages to less privileged ones.
+
+::
+
+   Boot ROM
+      =E2=86=93
+   Platform Firmware
+      =E2=86=93
+   System Firmware
+      =E2=86=93
+   OS Loader (optional)
+      =E2=86=93
+   Operating System
+
+
+Boot ROM
+--------
+
+Boot ROM is the first code executed when a processor starts. It is
+typically implemented by the CPU or SoC manufacturer and stored in
+on-chip read-only memory.
+
+Boot ROM performs minimal initialization and loads the next stage of
+firmware from boot media such as SPI flash, eMMC, or SD storage.
+
+Boot ROM code is generally **not modifiable by system developers**.
+
+
+Platform Firmware
+-----------------
+
+Platform firmware performs early platform initialization before the
+main boot firmware executes. Depending on the architecture and
+implementation, it may configure security boundaries, initialize memory
+and clocks, provide management-controller functions, or expose
+privileged runtime services used later by the operating system.
+
+Some parts of this layer may remain resident after boot. Platform
+firmware is usually platform-specific and typically has fewer
+interchangeable implementations than later boot stages.
+
+Examples include:
+
+* Trusted Firmware-A (TF-A)
+* Trusted Firmware-M (TF-M), where applicable
+* System Control Processor (SCP) firmware
+* OpenSBI, which implements the Supervisor Binary Interface (SBI)
+
+
+System Firmware
+---------------
+
+System firmware provides the main boot environment. It prepares the
+hardware needed to load the next stage, discovers bootable devices,
+and may provide a command shell or a UEFI environment. Many modern
+implementations can also boot the kernel directly from storage,
+making a separate OS loader optional.
+
+This layer is generally modifiable by system developers and often
+has alternative implementations.
+
+Typical implementations include:
+
+* U-Boot
+* EDK2
+* coreboot
+
+In Yocto Project builds this layer can be selected through a virtual
+provider using ``PREFERRED_PROVIDER``.
+
+The name ``virtual/boot-firmware`` reflects the role of this layer as
+the primary firmware environment responsible for locating bootable
+devices and initiating the operating system boot process.
+
+Example configuration::
+
+   PREFERRED_PROVIDER_virtual/boot-firmware =3D "u-boot"
+
+
+OS Loader
+---------
+
+The OS loader is the final stage that typically resides on disk. It
+selects and loads a specific operating system kernel and optional
+initramfs into memory and passes the required configuration to start
+the system.
+
+This layer is modifiable by system developers and usually has multiple
+implementations.
+
+Examples include:
+
+* GRUB
+* Syslinux / EXTLINUX
+* systemd-boot
+
+In Yocto Project builds this layer can also be selected through a
+virtual provider.
+
+The name ``virtual/boot-manager`` reflects the role of this software in
+selecting and loading an operating system kernel from storage.
+
+Example configuration::
+
+   PREFERRED_PROVIDER_virtual/boot-manager =3D "grub-efi"
+
+Some systems boot the kernel directly from system firmware (for example
+U-Boot or UEFI). In these cases an additional OS loader is not required.
+
+Example::
+
+   PREFERRED_PROVIDER_virtual/boot-manager =3D "none"
+
+
+Boot Process by Architecture
+----------------------------
+
+
+Arm (Arm32)
+~~~~~~~~~~~
+
+Many Arm32 systems boot directly into U-Boot using its SPL stage.
+
+::
+
+   Boot ROM
+      =E2=86=93
+   U-Boot SPL
+      =E2=86=93
+   U-Boot
+      =E2=86=93
+   Linux Kernel
+
+
+Arm64 (AArch64)
+~~~~~~~~~~~~~~~
+
+Arm64 platforms commonly include Trusted Firmware-A prior to the
+main boot firmware.
+
+::
+
+   Boot ROM
+      =E2=86=93
+   TF-A BL1 / BL2 / BL31
+      =E2=86=93
+   U-Boot or EDK2
+      =E2=86=93
+   OS Loader or Linux Kernel
+
+When a separate OS loader is used, it is typically GRUB or
+systemd-boot.
+
+
+RISC-V
+~~~~~~
+
+RISC-V systems typically include OpenSBI, which provides the
+Supervisor Binary Interface (SBI).
+
+::
+
+   Boot ROM
+      =E2=86=93
+   OpenSBI
+      =E2=86=93
+   U-Boot or EDK2
+      =E2=86=93
+   OS Loader or Linux Kernel
+
+When a separate OS loader is used, it is typically GRUB or
+systemd-boot.
+
+
+x86 / x86_64
+~~~~~~~~~~~~
+
+Typical x86 systems use platform firmware implementing BIOS
+compatibility or UEFI.
+
+::
+
+   CPU reset vector (firmware entry point)
+      =E2=86=93
+   Platform Firmware (BIOS / UEFI, for example coreboot- or EDK2-based f=
irmware)
+      =E2=86=93
+   GRUB or systemd-boot
+      =E2=86=93
+   Linux Kernel
+
+
+Security Considerations
+-----------------------
+
+Secure Boot
+~~~~~~~~~~~
+
+Secure Boot ensures that only software verified by a trusted key can
+execute during the boot process.
+
+Each stage verifies the integrity and authenticity of the next stage
+before transferring control. Verification is typically performed using
+digital signatures and public-key cryptography.
+
+The process begins with a hardware root of trust, often implemented in
+Boot ROM or secure firmware, which contains the keys used to verify
+subsequent boot stages.
+
+A simplified Secure Boot chain may look like this::
+
+   Boot ROM (Root of Trust)
+      =E2=86=93
+   Platform Firmware
+      =E2=86=93
+   System Firmware
+      =E2=86=93
+   OS Loader
+      =E2=86=93
+   Linux Kernel
+
+If verification fails at any stage, execution is typically halted or
+recovery mechanisms are triggered.
+
+Common Secure Boot mechanisms include:
+
+* Firmware signature verification
+* Signed bootloader images
+* Signed kernel images
+* UEFI Secure Boot
+* U-Boot FIT image verification
+
+In Yocto Project builds Secure Boot is commonly implemented using:
+
+* U-Boot verified boot (FIT image signatures)
+* UEFI Secure Boot with EDK2
+* Trusted Firmware-A verified boot
+
+
+Trusted Boot
+~~~~~~~~~~~~
+
+Trusted Boot focuses on *measuring* the boot process rather than
+preventing execution.
+
+Instead of blocking execution, Trusted Boot records cryptographic
+measurements (typically hashes) of boot components as they are loaded.
+These measurements are stored in a Trusted Platform Module (TPM) or
+other protected storage.
+
+A simplified measurement chain may look like this::
+
+   Boot ROM
+      =E2=86=93
+   Measure Platform Firmware
+      =E2=86=93
+   Measure Bootloader
+      =E2=86=93
+   Measure Kernel
+      =E2=86=93
+   Store measurements in TPM
+
+Measurements are extended into Platform Configuration Registers (PCRs)
+in the TPM and can later be used to verify system integrity.
+
+Trusted Boot enables capabilities such as:
+
+* Remote attestation
+* Platform integrity verification
+* Measured boot logging
+* Runtime integrity checking
+
+Trusted Boot does **not necessarily prevent execution of untrusted
+software**, but provides a verifiable record of what software was
+loaded during boot.
+
+
+Secure Boot and Trusted Boot Together
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Many systems combine Secure Boot and Trusted Boot to provide both
+enforcement and measurement.
+
+For example::
+
+   Boot ROM
+      =E2=86=93
+   Verify Platform Firmware
+      =E2=86=93
+   Measure Platform Firmware
+      =E2=86=93
+   Verify Bootloader
+      =E2=86=93
+   Measure Bootloader
+      =E2=86=93
+   Verify Kernel
+      =E2=86=93
+   Measure Kernel
+
+This approach both prevents unauthorized code from running and
+provides an auditable record of the boot process.
+
+
+Yocto Project Integration
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The Yocto Project can be used to build systems that implement Secure
+Boot and Trusted Boot through several layers and components.
+
+Examples include:
+
+* Secure Boot support in U-Boot
+* UEFI Secure Boot with EDK2
+* Trusted Firmware-A verified boot support
+* TPM integration
+* Linux Integrity Measurement Architecture (IMA)
+* Extended Verification Module (EVM)
+
+These features can be enabled and configured using machine
+configurations, distribution features, and additional layers such as
+security-focused metadata layers.
+
+
+References
+----------
+
+* `Boot Loader Specification <https://systemd.io/BOOT_LOADER_SPECIFICATI=
ON/>`_
+* `Coreboot <https://doc.coreboot.org/>`_
+* `EDK2 <https://github.com/tianocore/edk2>`_
+* `GNU GRUB <https://www.gnu.org/software/grub/>`_
+* `IMA/EVM <https://sourceforge.net/p/linux-ima/wiki/Home/>`_
+* `Linux Integrity Measurement Architecture (IMA) <https://ima-doc.readt=
hedocs.io/en/latest/ima-concepts.html>`_
+* `OpenSBI <https://github.com/riscv-software-src/opensbi>`_
+* `Syslinux Project <https://wiki.syslinux.org/wiki/index.php?title=3DTh=
e_Syslinux_Project>`_
+* `Trusted Firmware-A <https://trustedfirmware-a.readthedocs.io/>`_
+* `Trusted Firmware-M <https://trustedfirmware-m.readthedocs.io/>`_
+* `U-Boot <https://u-boot.readthedocs.io/>`_
+* `UEFI Secure Boot documentation <https://docs.system-transparency.org/=
st-1.1.0/docs/selected-topics/secureboot_concepts/>`_
diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manua=
l/index.rst
index aa1a63e0500b..2456f56c37ee 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -12,6 +12,7 @@ Yocto Project Reference Manual
=20
    system-requirements
    yocto-project-supported-features
+   boot-architecture
    terms
    release-process
    structure
--=20
2.50.1 (Apple Git-155)


