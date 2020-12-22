Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.5557.1608599168463271507
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 17:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Z7fqp7QE;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id E037620B83F8; Mon, 21 Dec 2020 17:06:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E037620B83F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608599167;
	bh=3SnYo4aru1UGD+UBiqb2y6R2fO1VhKADSffkrqgX/y4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z7fqp7QE/e25bTmpgICjQglZSfqXhzt8YaR19cCeVjGh//v267U7bIg2t2aRf8wCf
	 EoQGtoLXNHSsp3UP8fpUmcYHjquovHtAdsYpnrTlV/v2cYZUt25HbafAyyk6B85qcF
	 VPF9Pn+NnT6k0ZpPsq6AEaQV8nNoRg32HBvo2am8=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/5] variables: Add documentation for new kernel-fitimage vars
Date: Mon, 21 Dec 2020 17:06:03 -0800
Message-Id: <2a491bf195731319b9fa3bca15b95f7ce8342af5.1608598606.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add documentation for FIT_DESC, FIT_SIGN_INDIVIDUAL, UBOOT_MKIMAGE,
UBOOT_MKIMAGE_SIGN and UBOOT_MKIMAGE_SIGN_ARGS.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8f7f86e..607ebfe 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2538,6 +2538,14 @@ system and gives an overview of their function and contents.
       For guidance on how to create your own file permissions settings
       table file, examine the existing ``fs-perms.txt``.
 
+   :term:`FIT_DESC`
+      Specifies the description string encoded into a fitImage. The default
+      value is set by the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
+      class as follows:
+      ::
+
+         FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
+
    :term:`FIT_GENERATE_KEYS`
       Decides whether to generate the keys for signing fitImage if they
       don't already exist. The keys are created in ``UBOOT_SIGN_KEYDIR``.
@@ -2568,6 +2576,13 @@ system and gives an overview of their function and contents.
       Size of private key in number of bits used in fitImage. The default
       value is "2048".
 
+   :term:`FIT_SIGN_INDIVIDUAL`
+      If set to "1", then the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
+      class will sign the kernel, dtb and ramdisk images individually in addition
+      to signing the fitImage itself. This could be useful if you are
+      intending to verify signatures in another context than booting via
+      U-Boot.
+
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable specifies the runtime dependencies for font packages.
@@ -8441,12 +8456,30 @@ system and gives an overview of their function and contents.
       Specifies the target called in the ``Makefile``. The default target
       is "all".
 
+   :term:`UBOOT_MKIMAGE`
+      Specifies the name of the mkimage command as used by the
+      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to assemble
+      the FIT image. This can be used to substitute an alternative command, wrapper
+      script or function if desired. The default is "uboot-mkimage".
+
    :term:`UBOOT_MKIMAGE_DTCOPTS`
       Options for the device tree compiler passed to mkimage '-D'
       feature while creating FIT image in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class.
       If ``UBOOT_MKIMAGE_DTCOPTS`` is not set then kernel-fitimage will not
       pass the ``-D`` option to mkimage.
 
+   :term:`UBOOT_MKIMAGE_SIGN`
+      Specifies the name of the mkimage command as used by the
+      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to sign
+      the FIT image after it has been assembled (if enabled). This can be used
+      to substitute an alternative command, wrapper script or function if
+      desired. The default is "${:term:`UBOOT_MKIMAGE`}".
+
+   :term:`UBOOT_MKIMAGE_SIGN_ARGS`
+      Optionally specifies additional arguments for the
+      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to pass to the
+      mkimage command when signing the FIT image.
+
    :term:`UBOOT_RD_ENTRYPOINT`
       Specifies the entrypoint for the RAM disk image.
       During FIT image creation, the
-- 
1.8.3.1

