Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0282CDE00A
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7331.1782380031592124799
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WQUbDjkr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D62E94E408CA
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A45965FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A89F9106F07AA;
	Thu, 25 Jun 2026 11:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380029; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y2S77T/leUxN4wHIIz1tC8JZPafQcjobgENc6EWhFD4=;
	b=WQUbDjkrOM+CwZ6UsyM977eGN9rOiT/7IPm5t50Czb1CwS1Hr5hh69xY8X//QXpDfRfuem
	f2Aj+fhEILbTOnkfQxQhm5P+/7N0zhSCApSDRvLGq1/Wmaxj+XBgg/KwM+B7yS3wdqQmC1
	4VlZrDCyp/M+i9oojuEpOToSM4l3XohyyGXaPTDbSwdYQhkHrmEwAjjkIzi5SXTlxhj9bQ
	AE4ynGDt9CqZ4PVrZxH/a5/zb3mDVWityFNeCJ4tg4ICRxFIKg0eQErZhut0YlmW8c9dxb
	fL8O/iqPG+ez7RBM2Z9eyKlftG2uk7MeqBjFOVAkLhSV1JRzHlQuJrZ9zv9wQA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:36 +0200
Subject: [PATCH 09/11] dev-manual/wic.rst: convert code snippet to
 code-blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-9-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13447;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EULfc3Kbj6mE5RQEEGTSh1UtDqOdMrWFnlYEp5QKxiM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX11qONONGNXgNLzRalAE6phZwTCVwdkW9WP
 eQEodtgEgaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19QAKCRDRgEFAKaOo
 NuIRD/9hiDlql/8O5+HqhEEAADG+p8PXLPW3VORd/iO5cF10Qu4aW9sS9Nt+ef+7bv9T+7OJk1c
 0jC27doTMbRJXaxtfyM7cyjLcIiWH/S1kzae2ZRWxkZ1WK/NiSh+HY+Q3OBswayHEvzZ0y1bBzC
 JIRuCW2TYlpQA74FsFN/t/Ywq8FqDxR0k08oNoPosoLVNp48taGUiF/II56ZAFMwJ/njRR412mi
 WOHEZbTwa58aynoP0jSccKiM4Aaylmpqu6cuo6YcQp6dlnxckSBEdNz5yGVmL+1MQeAi9DB+Awl
 ezjydTYcqKKwKde8BUbwuC56CYnSfLjNf941oqReUoT2ADMEUJ1Nrbz4Sd049wsyFAY5LJ4wiVq
 kgjoVQ4EoDQDN5jdg2xluTBn/8KIIf9IFvdaPyBWSUy7UuwPP1pQeA5vy0KyT5oQcM/avj8A3zw
 sCp1CSAwkQTYBg5zg3BLLVQxm02qRoG+NoRO4HcwrDiwu4NYUftt8yRIeuyEqcaw0AaW+mg9wNj
 KtWuGVWeC+Fy8tSQsxtgwlb4B9WiqtIy870KljkPhygrA0EtRrG9kAFiZG61vi6g02BOrjAxJ1K
 BfXqX7Mwp2qWUQ3l2F42TthObJak4biOwy8KrNB8cJ238++fJtkXW+nFQm+o71vpgAVfVUDXxN6
 Ry9yWf0z09GPBSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9892

Convert to current code snippets to use code-block to have proper syntax
highlighting, and fix indentation in a few places.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wic.rst | 155 ++++++++++++++++++++++++++-------------
 1 file changed, 106 insertions(+), 49 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 980f5197c..bd3b5f697 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -120,7 +120,9 @@ Getting Help
 
 You can get general help for the ``wic`` command by entering the ``wic``
 command by itself or by entering the command with a help argument as
-follows::
+follows:
+
+.. code-block:: console
 
    $ wic -h
    $ wic --help
@@ -128,27 +130,37 @@ follows::
 
 Currently, Wic supports seven commands: ``cp``, ``create``, ``help``,
 ``list``, ``ls``, ``rm``, and ``write``. You can get help for all these
-commands except "help" by using the following form::
+commands except "help" by using the following form:
+
+.. code-block:: console
 
    $ wic help command
 
 For example, the following command returns help for the ``write``
-command::
+command:
+
+.. code-block:: console
 
    $ wic help write
 
 Wic supports help for three topics: ``overview``, ``plugins``, and
-``kickstart``. You can get help for any topic using the following form::
+``kickstart``. You can get help for any topic using the following form:
+
+.. code-block:: console
 
    $ wic help topic
 
-For example, the following returns overview help for Wic::
+For example, the following returns overview help for Wic:
+
+.. code-block:: console
 
    $ wic help overview
 
 There is one additional level of help for Wic. You can get help on
 individual images through the ``list`` command. You can use the ``list``
-command to return the available Wic images as follows::
+command to return the available Wic images as follows:
+
+.. code-block:: console
 
    $ wic list images
      genericx86                                 Create an EFI disk image for genericx86*
@@ -169,7 +181,9 @@ command to return the available Wic images as follows::
 Once you know the list of available
 Wic images, you can use ``help`` with the command to get help on a
 particular image. For example, the following command returns help on the
-"beaglebone-yocto" image::
+"beaglebone-yocto" image:
+
+.. code-block:: console
 
    $ wic list beaglebone-yocto help
 
@@ -205,7 +219,9 @@ In other words, you can point to arbitrary kernel, root filesystem locations,
 and so forth. Contrast this behavior with cooked mode where Wic looks in the
 :term:`Build Directory` (e.g. ``tmp/deploy/images/``\ machine).
 
-The general form of the ``wic`` command in raw mode is::
+The general form of the ``wic`` command in raw mode is:
+
+.. code-block:: console
 
    $ wic create wks_file options ...
 
@@ -263,7 +279,9 @@ a kickstart file and the name of the image from which to use artifacts
 by using the "-e" option. Wic looks in the :term:`Build Directory` (e.g.
 ``tmp/deploy/images/``\ machine) for artifacts.
 
-The general form of the ``wic`` command using Cooked Mode is as follows::
+The general form of the ``wic`` command using Cooked Mode is as follows:
+
+.. code-block:: console
 
    $ wic create wks_file -e IMAGE_NAME
 
@@ -286,12 +304,16 @@ Using an Existing Kickstart File
 If you do not want to create your own kickstart file, you can use an
 existing file provided by the Wic installation. As shipped, kickstart
 files can be found in the :ref:`overview-manual/development-environment:yocto project source repositories` in the
-following two locations::
+following two locations:
+
+.. code-block:: text
 
    meta-yocto/meta-yocto-bsp/files/wic
    openembedded-core/files/wic
 
-Use the following command to list the available kickstart files::
+Use the following command to list the available kickstart files:
+
+.. code-block:: console
 
    $ wic list images
      genericx86                                 Create an EFI disk image for genericx86*
@@ -311,13 +333,17 @@ Use the following command to list the available kickstart files::
 
 When you use an existing file, you
 do not have to use the ``.wks`` extension. Here is an example in Raw
-Mode that uses the ``directdisk`` file::
+Mode that uses the ``directdisk`` file:
+
+.. code-block:: console
 
    $ wic create directdisk -r rootfs_dir -b bootimg_dir \
          -k kernel_dir -n native_sysroot
 
 Here are the actual partition language commands used in the
-``genericx86.wks`` file to generate an image::
+``genericx86.wks`` file to generate an image:
+
+.. code-block:: shell
 
    # short-description: Create an EFI disk image for genericx86*
    # long-description: Creates a partitioned EFI disk image for genericx86* machines
@@ -375,7 +401,9 @@ When the Wic implementation needs to invoke a partition-specific
 implementation, it looks for the plugin with the same name as the
 ``--source`` parameter used in the kickstart file given to that
 partition. For example, if the partition is set up using the following
-command in a kickstart file::
+command in a kickstart file:
+
+.. code-block:: shell
 
    part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
 
@@ -386,7 +414,9 @@ members of the matching source plugin (i.e. ``bootimg_pcbios``) in the
 To be more concrete, here is the corresponding plugin definition from
 the ``bootimg_pcbios.py`` file for the previous command along with an
 example method called by the Wic implementation when it needs to prepare
-a partition using an implementation-specific function::
+a partition using an implementation-specific function:
+
+.. code-block:: python
 
                 .
                 .
@@ -477,7 +507,9 @@ Generate an Image using an Existing Kickstart File
 --------------------------------------------------
 
 This example runs in Cooked Mode and uses the ``mkefidisk`` kickstart
-file::
+file:
+
+.. code-block:: console
 
    $ wic create mkefidisk -e core-image-minimal
    INFO: Building wic-tools...
@@ -513,11 +545,15 @@ and kickstart file information.
 Continuing with the example, you can now write the image from the
 :term:`Build Directory` onto a USB stick, or whatever media for which you
 built your image, and boot from the media. You can write the image by using
-``bmaptool`` or ``dd``::
+``bmaptool`` or ``dd``:
+
+.. code-block:: console
 
    $ oe-run-native bmaptool-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
 
-or ::
+or :
+
+.. code-block:: console
 
    $ sudo dd if=mkefidisk-201804191017-sda.direct of=/dev/sdX
 
@@ -551,8 +587,10 @@ will need to boot from ``sdb`` instead of ``sda``, which is what the
 ``directdisk-gpt`` kickstart file uses.
 
 The example begins by making a copy of the ``directdisk-gpt.wks`` file
-in the ``scripts/lib/image/canned-wks`` directory and then by changing
-the lines that specify the target disk from which to boot::
+in the ``files/wic`` directory and then by changing
+the lines that specify the target disk from which to boot:
+
+.. code-block:: console
 
    $ cp /home/stephano/yocto/openembedded-core/files/wic/directdisk-gpt.wks \
         /home/stephano/yocto/openembedded-core/files/wic/directdisksdb-gpt.wks
@@ -560,7 +598,9 @@ the lines that specify the target disk from which to boot::
 Next, the example modifies the ``directdisksdb-gpt.wks`` file and
 changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
 example changes the following two lines and leaves the remaining lines
-untouched::
+untouched:
+
+.. code-block:: shell
 
    part /boot --source bootimg_pcbios --ondisk sdb --label boot --active --align 1024
    part / --source rootfs --ondisk sdb --fstype=ext4 --label platform --align 1024 --use-uuid
@@ -569,7 +609,9 @@ Once the lines are changed, the
 example generates the ``directdisksdb-gpt`` image. The command points
 the process at the ``core-image-minimal`` artifacts for the Next Unit of
 Computing (nuc) :term:`MACHINE` the
-``local.conf``::
+``local.conf``:
+
+.. code-block:: console
 
    $ wic create directdisksdb-gpt -e core-image-minimal
    INFO: Building wic-tools...
@@ -596,7 +638,9 @@ Computing (nuc) :term:`MACHINE` the
 
 Continuing with the example, you can now directly ``dd`` the image to a
 USB stick, or whatever media for which you built your image, and boot
-the resulting media::
+the resulting media:
+
+.. code-block:: console
 
    $ sudo dd if=directdisksdb-gpt-201710090938-sdb.direct of=/dev/sdb
    140966+0 records in
@@ -610,7 +654,9 @@ Using a Modified Kickstart File and Running in Raw Mode
 This next example manually specifies each build artifact (runs in Raw
 Mode) and uses a modified kickstart file. The example also uses the
 ``-o`` option to cause Wic to create the output somewhere other than the
-default output directory, which is the current directory::
+default output directory, which is the current directory:
+
+.. code-block:: console
 
    $ wic create test.wks -o /home/stephano/testwic \
         --rootfs-dir /home/stephano/yocto/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
@@ -655,7 +701,9 @@ The following example examines the contents of the Wic image, deletes
 the existing kernel, and then inserts a new kernel:
 
 #. *List the Partitions:* Use the ``wic ls`` command to list all the
-   partitions in the Wic image::
+   partitions in the Wic image:
+
+   .. code-block:: console
 
       $ wic ls tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic
       Num     Start        End          Size      Fstype
@@ -671,33 +719,36 @@ the existing kernel, and then inserts a new kernel:
    .. note::
 
       You can get command usage on any Wic command using the following
-      form::
+      form:
 
-              $ wic help command
+      .. code-block:: console
+
+         $ wic help command
 
 
       For example, the following command shows you the various ways to
-      use the
-      wic ls
-      command::
+      use the ``wic ls`` command:
+
+      .. code-block:: console
 
-              $ wic help ls
+         $ wic help ls
 
+   The following command shows what is in partition one:
 
-   The following command shows what is in partition one::
+   .. code-block:: console
 
-        $ wic ls tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1
-        Volume in drive : is boot
-         Volume Serial Number is E894-1809
-        Directory for ::/
+      $ wic ls tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1
+      Volume in drive : is boot
+       Volume Serial Number is E894-1809
+      Directory for ::/
 
-        libcom32 c32    186500 2017-10-09  16:06
-        libutil  c32     24148 2017-10-09  16:06
-        syslinux cfg       220 2017-10-09  16:06
-        vesamenu c32     27104 2017-10-09  16:06
-        vmlinuz        6904608 2017-10-09  16:06
-                5 files           7 142 580 bytes
-                                 16 582 656 bytes free
+      libcom32 c32    186500 2017-10-09  16:06
+      libutil  c32     24148 2017-10-09  16:06
+      syslinux cfg       220 2017-10-09  16:06
+      vesamenu c32     27104 2017-10-09  16:06
+      vmlinuz        6904608 2017-10-09  16:06
+              5 files           7 142 580 bytes
+                               16 582 656 bytes free
 
    The previous output shows five files, with the
    ``vmlinuz`` being the kernel.
@@ -706,15 +757,19 @@ the existing kernel, and then inserts a new kernel:
 
       If you see the following error, you need to update or create a
       ``~/.mtoolsrc`` file and be sure to have the line "mtools_skip_check=1"
-      in the file. Then, run the Wic command again::
+      in the file. Then, run the Wic command again:
 
-              ERROR: _exec_cmd: /usr/bin/mdir -i /tmp/wic-parttfokuwra ::/ returned '1' instead of 0
-               output: Total number of sectors (47824) not a multiple of sectors per track (32)!
-               Add mtools_skip_check=1 to your .mtoolsrc file to skip this test
+      .. code-block:: text
+
+         ERROR: _exec_cmd: /usr/bin/mdir -i /tmp/wic-parttfokuwra ::/ returned '1' instead of 0
+          output: Total number of sectors (47824) not a multiple of sectors per track (32)!
+          Add mtools_skip_check=1 to your .mtoolsrc file to skip this test
 
 
 #. *Remove the Old Kernel:* Use the ``wic rm`` command to remove the
-   ``vmlinuz`` file (kernel)::
+   ``vmlinuz`` file (kernel):
+
+   .. code-block:: console
 
       $ wic rm tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
 
@@ -726,7 +781,9 @@ the existing kernel, and then inserts a new kernel:
    kernel will be in the ``workspace/sources`` area.
 
    The following example assumes ``devtool`` was used to build the
-   kernel::
+   kernel:
+
+   .. code-block:: console
 
       $ wic cp poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
                build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz

-- 
2.54.0


