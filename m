Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C92C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:41 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.3491.1713118831935566516
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cDeJWf+W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7167B240004;
	Sun, 14 Apr 2024 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfszWkG1cXJgzypZCe6AHCF6bh+oaljuA8dvxLe0eJY=;
	b=cDeJWf+WRVy6AiuaRwlZiTIGlwkv1mBHSO4mPNTEu1d4l3ojyQuVNDDkVTeOV9Dq912jRd
	2RNXed+BmUPGNs2mW1Qpx7umDtpFgY/CaZ/iYlZ8XBbFtgfbTgpNKxLXy2vINKf1EMjEhe
	/aokfALF6iBaZecN3WQoLbVuKBaPW3K+swoa519jyhDh6Ed1AEWurNQsJzB72hwsg8DpJy
	ScrL+tzV2Z/DL/iyuTMU5gNjicmtVRO9jl9JSHjTzMaduumztvZ0w/zRQDJyMJ3HiYsuH5
	6MtZW4o6fEwCiXH82WhZGqMemrqONuAPZUEzf09Zi243Mv03+x/I812xTgxF9Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [kirkstone][PATCH 9/9] manuals: remove tab characters
Date: Sun, 14 Apr 2024 20:20:11 +0200
Message-Id: <20240414182011.994356-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5133

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As reported by "make sphinx-lint"

Tabs are even removed in Makefile examples,
as Sphinx turns them to spaces anyway in the generated output.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/dev-manual/layers.rst           |  16 +--
 documentation/dev-manual/wic.rst              |  52 ++++----
 documentation/kernel-dev/advanced.rst         |   4 +-
 documentation/kernel-dev/common.rst           |   4 +-
 documentation/profile-manual/usage.rst        | 114 +++++++++---------
 documentation/ref-manual/terms.rst            |  10 +-
 documentation/sdk-manual/working-projects.rst |  10 +-
 7 files changed, 105 insertions(+), 105 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 9bfbd726d9..e3f56199be 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -501,12 +501,12 @@ the "meta" layer at ``meta/recipes-bsp/formfactor``::
    INHIBIT_DEFAULT_DEPS = "1"
 
    do_install() {
-	   # Install file only if it has contents
+           # Install file only if it has contents
            install -d ${D}${sysconfdir}/formfactor/
            install -m 0644 ${S}/config ${D}${sysconfdir}/formfactor/
-	   if [ -s "${S}/machconfig" ]; then
-	           install -m 0644 ${S}/machconfig ${D}${sysconfdir}/formfactor/
-	   fi
+           if [ -s "${S}/machconfig" ]; then
+                   install -m 0644 ${S}/machconfig ${D}${sysconfdir}/formfactor/
+           fi
    }
 
 In the main recipe, note the :term:`SRC_URI`
@@ -582,10 +582,10 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
    ALLOW_EMPTY:${PN} = "1"
 
    do_install () {
-	if test -s ${WORKDIR}/xorg.conf; then
-		install -d ${D}/${sysconfdir}/X11
-		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
-	fi
+        if test -s ${WORKDIR}/xorg.conf; then
+                install -d ${D}/${sysconfdir}/X11
+                install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+        fi
    }
 
 Here is the append file, which is named ``xserver-xf86-config_%.bbappend``
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 687c9e6580..049996c39e 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -139,20 +139,20 @@ individual images through the ``list`` command. You can use the ``list``
 command to return the available Wic images as follows::
 
    $ wic list images
-     genericx86                    		Create an EFI disk image for genericx86*
-     edgerouter                    		Create SD card image for Edgerouter
-     beaglebone-yocto              		Create SD card image for Beaglebone
-     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
-     mkefidisk                     		Create an EFI disk image
-     directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
-     directdisk                    		Create a 'pcbios' direct disk image
+     genericx86                                 Create an EFI disk image for genericx86*
+     edgerouter                                 Create SD card image for Edgerouter
+     beaglebone-yocto                           Create SD card image for Beaglebone
+     qemuriscv                                  Create qcow2 image for RISC-V QEMU machines
+     mkefidisk                                  Create an EFI disk image
+     directdisk-multi-rootfs                    Create multi rootfs image using rootfs plugin
+     directdisk                                 Create a 'pcbios' direct disk image
      efi-bootdisk
-     mkhybridiso                   		Create a hybrid ISO image
-     directdisk-gpt                		Create a 'pcbios' direct disk image
-     systemd-bootdisk              		Create an EFI disk image with systemd-boot
-     sdimage-bootpart              		Create SD card image with a boot partition
-     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
-     directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
+     mkhybridiso                                Create a hybrid ISO image
+     directdisk-gpt                             Create a 'pcbios' direct disk image
+     systemd-bootdisk                           Create an EFI disk image with systemd-boot
+     sdimage-bootpart                           Create SD card image with a boot partition
+     qemux86-directdisk                         Create a qemu machine 'pcbios' direct disk image
+     directdisk-bootloader-config               Create a 'pcbios' direct disk image with custom bootloader config
 
 
 Once you know the list of available
@@ -283,20 +283,20 @@ following two locations::
 Use the following command to list the available kickstart files::
 
    $ wic list images
-     genericx86                    		Create an EFI disk image for genericx86*
-     edgerouter                    		Create SD card image for Edgerouter
-     beaglebone-yocto              		Create SD card image for Beaglebone
-     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
-     mkefidisk                     		Create an EFI disk image
-     directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
-     directdisk                    		Create a 'pcbios' direct disk image
+     genericx86                                 Create an EFI disk image for genericx86*
+     edgerouter                                 Create SD card image for Edgerouter
+     beaglebone-yocto                           Create SD card image for Beaglebone
+     qemuriscv                                  Create qcow2 image for RISC-V QEMU machines
+     mkefidisk                                  Create an EFI disk image
+     directdisk-multi-rootfs                    Create multi rootfs image using rootfs plugin
+     directdisk                                 Create a 'pcbios' direct disk image
      efi-bootdisk
-     mkhybridiso                   		Create a hybrid ISO image
-     directdisk-gpt                		Create a 'pcbios' direct disk image
-     systemd-bootdisk              		Create an EFI disk image with systemd-boot
-     sdimage-bootpart              		Create SD card image with a boot partition
-     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
-     directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
+     mkhybridiso                                Create a hybrid ISO image
+     directdisk-gpt                             Create a 'pcbios' direct disk image
+     systemd-bootdisk                           Create an EFI disk image with systemd-boot
+     sdimage-bootpart                           Create SD card image with a boot partition
+     qemux86-directdisk                         Create a qemu machine 'pcbios' direct disk image
+     directdisk-bootloader-config               Create a 'pcbios' direct disk image with custom bootloader config
 
 When you use an existing file, you
 do not have to use the ``.wks`` extension. Here is an example in Raw
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index eae2d49ba4..f4820a4ad2 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -303,8 +303,8 @@ The following listings show the ``build.scc`` file and part of the
                         .
                         .
                         .
- 	        char *dump_write = NULL, *files_source = NULL;
- 	        int opt;
+                char *dump_write = NULL, *files_source = NULL;
+                int opt;
       --
       2.10.1
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 3f9d8d48e4..815695652b 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1749,10 +1749,10 @@ looks much like the one provided with the ``hello-mod`` template::
    SRC := $(shell pwd)
 
    all:
-   	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
+        $(MAKE) -C $(KERNEL_SRC) M=$(SRC)
 
    modules_install:
-   	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+        $(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
    ...
 
 The important point to note here is the :term:`KERNEL_SRC` variable. The
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index cffb63e3f9..2ff12f434e 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1044,13 +1044,13 @@ section::
    name: do_fork
    ID: 944
    format:
-           field:unsigned short common_type;	offset:0;	size:2;	signed:0;
-           field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
-           field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
-           field:int common_pid;	offset:4;	size:4;	signed:1;
-           field:int common_padding;	offset:8;	size:4;	signed:1;
+           field:unsigned short common_type;    offset:0;       size:2; signed:0;
+           field:unsigned char common_flags;    offset:2;       size:1; signed:0;
+           field:unsigned char common_preempt_count;    offset:3;       size:1; signed:0;
+           field:int common_pid;        offset:4;       size:4; signed:1;
+           field:int common_padding;    offset:8;       size:4; signed:1;
 
-           field:unsigned long __probe_ip;	offset:12;	size:4;	signed:0;
+           field:unsigned long __probe_ip;      offset:12;      size:4; signed:0;
 
    print fmt: "(%lx)", REC->__probe_ip
 
@@ -1535,17 +1535,17 @@ like ftrace to display the event as text. The format of the
    name: kmalloc
    ID: 313
    format:
-           field:unsigned short common_type;	offset:0;	size:2;	signed:0;
-           field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
-           field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
-           field:int common_pid;	offset:4;	size:4;	signed:1;
-           field:int common_padding;	offset:8;	size:4;	signed:1;
-
-           field:unsigned long call_site;	offset:16;	size:8;	signed:0;
-           field:const void * ptr;	offset:24;	size:8;	signed:0;
-           field:size_t bytes_req;	offset:32;	size:8;	signed:0;
-           field:size_t bytes_alloc;	offset:40;	size:8;	signed:0;
-           field:gfp_t gfp_flags;	offset:48;	size:4;	signed:0;
+           field:unsigned short common_type;    offset:0;       size:2; signed:0;
+           field:unsigned char common_flags;    offset:2;       size:1; signed:0;
+           field:unsigned char common_preempt_count;    offset:3;       size:1; signed:0;
+           field:int common_pid;        offset:4;       size:4; signed:1;
+           field:int common_padding;    offset:8;       size:4; signed:1;
+
+           field:unsigned long call_site;       offset:16;      size:8; signed:0;
+           field:const void * ptr;      offset:24;      size:8; signed:0;
+           field:size_t bytes_req;      offset:32;      size:8; signed:0;
+           field:size_t bytes_alloc;    offset:40;      size:8; signed:0;
+           field:gfp_t gfp_flags;       offset:48;      size:4; signed:0;
 
    print fmt: "call_site=%lx ptr=%p bytes_req=%zu bytes_alloc=%zu gfp_flags=%s", REC->call_site, REC->ptr, REC->bytes_req, REC->bytes_alloc,
    (REC->gfp_flags) ? __print_flags(REC->gfp_flags, "|", {(unsigned long)(((( gfp_t)0x10u) | (( gfp_t)0x40u) | (( gfp_t)0x80u) | ((
@@ -2333,29 +2333,29 @@ first part of the filenames::
     8,32   1        0    58.516990819     0  m   N cfq3551 put_queue
 
    CPU0 (sdc):
-    Reads Queued:           0,        0KiB	 Writes Queued:         331,   26,284KiB
-    Read Dispatches:        0,        0KiB	 Write Dispatches:      485,   40,484KiB
-    Reads Requeued:         0		 Writes Requeued:         0
-    Reads Completed:        0,        0KiB	 Writes Completed:      511,   41,000KiB
-    Read Merges:            0,        0KiB	 Write Merges:           13,      160KiB
-    Read depth:             0        	 Write depth:             2
-    IO unplugs:            23        	 Timer unplugs:           0
+    Reads Queued:           0,        0KiB       Writes Queued:         331,   26,284KiB
+    Read Dispatches:        0,        0KiB       Write Dispatches:      485,   40,484KiB
+    Reads Requeued:         0                    Writes Requeued:         0
+    Reads Completed:        0,        0KiB       Writes Completed:      511,   41,000KiB
+    Read Merges:            0,        0KiB       Write Merges:           13,      160KiB
+    Read depth:             0                    Write depth:             2
+    IO unplugs:            23                    Timer unplugs:           0
    CPU1 (sdc):
-    Reads Queued:           0,        0KiB	 Writes Queued:         249,   15,800KiB
-    Read Dispatches:        0,        0KiB	 Write Dispatches:       42,    1,600KiB
-    Reads Requeued:         0		 Writes Requeued:         0
-    Reads Completed:        0,        0KiB	 Writes Completed:       16,    1,084KiB
-    Read Merges:            0,        0KiB	 Write Merges:           40,      276KiB
-    Read depth:             0        	 Write depth:             2
-    IO unplugs:            30        	 Timer unplugs:           1
+    Reads Queued:           0,        0KiB       Writes Queued:         249,   15,800KiB
+    Read Dispatches:        0,        0KiB       Write Dispatches:       42,    1,600KiB
+    Reads Requeued:         0                    Writes Requeued:         0
+    Reads Completed:        0,        0KiB       Writes Completed:       16,    1,084KiB
+    Read Merges:            0,        0KiB       Write Merges:           40,      276KiB
+    Read depth:             0                    Write depth:             2
+    IO unplugs:            30                    Timer unplugs:           1
 
    Total (sdc):
-    Reads Queued:           0,        0KiB	 Writes Queued:         580,   42,084KiB
-    Read Dispatches:        0,        0KiB	 Write Dispatches:      527,   42,084KiB
-    Reads Requeued:         0		 Writes Requeued:         0
-    Reads Completed:        0,        0KiB	 Writes Completed:      527,   42,084KiB
-    Read Merges:            0,        0KiB	 Write Merges:           53,      436KiB
-    IO unplugs:            53        	 Timer unplugs:           1
+    Reads Queued:           0,        0KiB       Writes Queued:         580,   42,084KiB
+    Read Dispatches:        0,        0KiB       Write Dispatches:      527,   42,084KiB
+    Reads Requeued:         0                    Writes Requeued:         0
+    Reads Completed:        0,        0KiB       Writes Completed:      527,   42,084KiB
+    Read Merges:            0,        0KiB       Write Merges:           53,      436KiB
+    IO unplugs:            53                    Timer unplugs:           1
 
    Throughput (R/W): 0KiB/s / 719KiB/s
    Events (sdc): 6,592 entries
@@ -2478,29 +2478,29 @@ And run blkparse on the host system using the device name::
     8,32   1        0   177.266696560     0  m   N cfq1267 put_queue
 
    CPU0 (sdc):
-    Reads Queued:           0,        0KiB	 Writes Queued:         270,   21,708KiB
-    Read Dispatches:       59,    2,628KiB	 Write Dispatches:      495,   39,964KiB
-    Reads Requeued:         0		 Writes Requeued:         0
-    Reads Completed:       90,    2,752KiB	 Writes Completed:      543,   41,596KiB
-    Read Merges:            0,        0KiB	 Write Merges:            9,      344KiB
-    Read depth:             2        	 Write depth:             2
-    IO unplugs:            20        	 Timer unplugs:           1
+    Reads Queued:           0,        0KiB       Writes Queued:         270,   21,708KiB
+    Read Dispatches:       59,    2,628KiB       Write Dispatches:      495,   39,964KiB
+    Reads Requeued:         0                    Writes Requeued:         0
+    Reads Completed:       90,    2,752KiB       Writes Completed:      543,   41,596KiB
+    Read Merges:            0,        0KiB       Write Merges:            9,      344KiB
+    Read depth:             2                    Write depth:             2
+    IO unplugs:            20                    Timer unplugs:           1
    CPU1 (sdc):
-    Reads Queued:         688,    2,752KiB	 Writes Queued:         381,   20,652KiB
-    Read Dispatches:       31,      124KiB	 Write Dispatches:       59,    2,396KiB
-    Reads Requeued:         0		 Writes Requeued:         0
-    Reads Completed:        0,        0KiB	 Writes Completed:       11,      764KiB
-    Read Merges:          598,    2,392KiB	 Write Merges:           88,      448KiB
-    Read depth:             2        	 Write depth:             2
-    IO unplugs:            52        	 Timer unplugs:           0
+    Reads Queued:         688,    2,752KiB       Writes Queued:         381,   20,652KiB
+    Read Dispatches:       31,      124KiB       Write Dispatches:       59,    2,396KiB
+    Reads Requeued:         0                    Writes Requeued:         0
+    Reads Completed:        0,        0KiB       Writes Completed:       11,      764KiB
+    Read Merges:          598,    2,392KiB       Write Merges:           88,      448KiB
+    Read depth:             2                    Write depth:             2
+    IO unplugs:            52                    Timer unplugs:           0
 
    Total (sdc):
-    Reads Queued:         688,    2,752KiB	 Writes Queued:         651,   42,360KiB
-    Read Dispatches:       90,    2,752KiB	 Write Dispatches:      554,   42,360KiB
-    Reads Requeued:         0		 Writes Requeued:         0
-    Reads Completed:       90,    2,752KiB	 Writes Completed:      554,   42,360KiB
-    Read Merges:          598,    2,392KiB	 Write Merges:           97,      792KiB
-    IO unplugs:            72        	 Timer unplugs:           1
+    Reads Queued:         688,    2,752KiB       Writes Queued:         651,   42,360KiB
+    Read Dispatches:       90,    2,752KiB       Write Dispatches:      554,   42,360KiB
+    Reads Requeued:         0                    Writes Requeued:         0
+    Reads Completed:       90,    2,752KiB       Writes Completed:      554,   42,360KiB
+    Read Merges:          598,    2,392KiB       Write Merges:           97,      792KiB
+    IO unplugs:            72                    Timer unplugs:           1
 
    Throughput (R/W): 15KiB/s / 238KiB/s
    Events (sdc): 9,301 entries
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index bc09613db7..2b9bccb4a9 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -226,23 +226,23 @@ universal, the list includes them just in case:
 
          As far as bootloaders are concerned, :term:`Initramfs` and "initrd"
          images are still copied to RAM in the same way. That's why most
-	 most bootloaders refer to :term:`Initramfs` images as "initrd"
-	 or "init RAM disk".
+         most bootloaders refer to :term:`Initramfs` images as "initrd"
+         or "init RAM disk".
 
       This kind of mechanism is typically used for two reasons:
 
       -  For booting the same kernel binary on multiple systems requiring
          different device drivers. The :term:`Initramfs` image is then customized
-	 for each type of system, to include the specific kernel modules
+         for each type of system, to include the specific kernel modules
          necessary to access the final root filesystem. This technique
-	 is used on all GNU / Linux distributions for desktops and servers.
+         is used on all GNU / Linux distributions for desktops and servers.
 
       -  For booting faster. As the root filesystem is extracted into RAM,
          accessing the first user-space applications is very fast, compared
          to having to initialize a block device, to access multiple blocks
          from it, and to go through a filesystem having its own overhead.
          For example, this allows to display a splashscreen very early,
-	 and to later take care of mounting the final root filesystem and
+         and to later take care of mounting the final root filesystem and
          loading less time-critical kernel drivers.
 
       This cpio archive can either be loaded to RAM by the bootloader,
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 7483d51fa3..296d7d8464 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -286,14 +286,14 @@ example:
       # CC=i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux
       # CC="gcc"
       all: main.o module.o
-      	${CC} main.o module.o -o target_bin
+        ${CC} main.o module.o -o target_bin
       main.o: main.c module.h
-      	${CC} -I . -c main.c
+        ${CC} -I . -c main.c
       module.o: module.c
-      	module.h ${CC} -I . -c module.c
+        module.h ${CC} -I . -c module.c
       clean:
-      	rm -rf *.o
-      	rm target_bin
+        rm -rf *.o
+        rm target_bin
 
 4. *Make the Project:* Use the ``make`` command to create the binary
    output file. Because variables are commented out in the Makefile, the
-- 
2.34.1


