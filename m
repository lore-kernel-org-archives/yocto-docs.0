Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2412.1582061638173379851
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2020 13:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.asselstine@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01ILXBtn014020
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Tue, 18 Feb 2020 13:33:47 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Tue, 18 Feb 2020
 13:33:31 -0800
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [yocto-docs][PATCH] documentation: updates to reflect that MACHINE defaults to qemux86-64
Date: Tue, 18 Feb 2020 16:33:28 -0500
Message-ID: <20200218213328.17208-1-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

meta-yocto commit 69ddecdb1516 [local.conf.sample: change default
MACHINE to qemux86-64] switched the default MACHINE from 'qemux86' to
'qemux86-64' but some documents which either explicitly mentioned the
default, or where this was implicit didn't receive an equivalent
update.

Where it made sense we continue this change in default to the docs. In
other places, such as the kernel-dev manual, we note the new default
and instruct the user how to switch back to 'qemux86'. Eventually we
should probably update the kernel-dev manual to use the default, but
for now the intention was to limit the impact of these changes.

Note that ext3 has also been replaced with ext4 for image generation,
so while we are modifying runqemu lines to qemux86-64 we also make the
change to reference ext4 such that the runqemu commands will function
properly.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../brief-yoctoprojectqs.xml                  |  4 ++--
 documentation/dev-manual/dev-manual-qemu.xml  | 22 ++++++++---------
 .../kernel-dev/kernel-dev-common.xml          | 24 +++++++++++--------
 .../profile-manual/profile-manual-usage.xml   |  2 +-
 documentation/ref-manual/ref-structure.xml    |  2 +-
 5 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
index 1daeb2547..15dd1af42 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
@@ -266,7 +266,7 @@
          meta-toolchain
          meta-ide-support
 
-     You can also run generated qemu images with a command like 'runqemu qemux86'
+     You can also run generated qemu images with a command like 'runqemu qemux86-64'
                     </literallayout>
                     Among other things, the script creates the
                     <ulink url='&YOCTO_DOCS_REF_URL;#build-directory'>Build Directory</ulink>,
@@ -332,7 +332,7 @@
                     QEMU, which is a Quick EMUlator that ships with
                     the Yocto Project:
                     <literallayout class='monospaced'>
-     $ runqemu qemux86
+     $ runqemu qemux86-64
                     </literallayout>
                     If you want to learn more about running QEMU, see the
                     "<ulink url="&YOCTO_DOCS_DEV_URL;#dev-manual-qemu">Using the Quick EMUlator (QEMU)</ulink>"
diff --git a/documentation/dev-manual/dev-manual-qemu.xml b/documentation/dev-manual/dev-manual-qemu.xml
index f5a0d64af..5ccc0dfe8 100644
--- a/documentation/dev-manual/dev-manual-qemu.xml
+++ b/documentation/dev-manual/dev-manual-qemu.xml
@@ -151,13 +151,13 @@
                     <itemizedlist>
                         <listitem><para>
                             This example starts QEMU with
-                            <replaceable>MACHINE</replaceable> set to "qemux86".
+                            <replaceable>MACHINE</replaceable> set to "qemux86-64".
                             Assuming a standard
                             <ulink url='&YOCTO_DOCS_REF_URL;#build-directory'>Build Directory</ulink>,
                             <filename>runqemu</filename> automatically finds the
-                            <filename>bzImage-qemux86.bin</filename> image file and
+                            <filename>bzImage-qemux86-64.bin</filename> image file and
                             the
-                            <filename>core-image-minimal-qemux86-20140707074611.rootfs.ext3</filename>
+                            <filename>core-image-minimal-qemux86-64-20200218002850.rootfs.ext4</filename>
                             (assuming the current build created a
                             <filename>core-image-minimal</filename> image).
                             <note>
@@ -166,7 +166,7 @@
                             timestamp.
                             </note>
                             <literallayout class='monospaced'>
-     $ runqemu qemux86
+     $ runqemu qemux86-64
                             </literallayout>
                             </para></listitem>
                         <listitem><para>
@@ -175,7 +175,7 @@
                             This command, however, specifically provides the image
                             and root filesystem type.
                             <literallayout class='monospaced'>
-     $ runqemu qemux86 core-image-minimal ext3
+     $ runqemu qemux86-64 core-image-minimal ext4
                             </literallayout>
                             </para></listitem>
                         <listitem><para>
@@ -188,7 +188,7 @@
                             be installed (see the previous description for the
                             <filename>audio</filename> option for more information).
                             <literallayout class='monospaced'>
-     $ runqemu qemux86 ramfs audio
+     $ runqemu qemux86-64 ramfs audio
                             </literallayout>
                             </para></listitem>
                         <listitem><para>
@@ -200,7 +200,7 @@
                             <replaceable>KERNEL</replaceable>, or
                             <replaceable>VM</replaceable> option.
                             <literallayout class='monospaced'>
-     $ runqemu ext3
+     $ runqemu ext4
                             </literallayout>
                             </para></listitem>
                         <listitem><para>
@@ -209,9 +209,9 @@
                             From the <filename>.wic.vmdk</filename>,
                             <filename>runqemu</filename> determines the QEMU
                             architecture (<replaceable>MACHINE</replaceable>) to be
-                            "qemux86" and the root filesystem type to be "vmdk".
+                            "qemux86-64" and the root filesystem type to be "vmdk".
                             <literallayout class='monospaced'>
-     $ runqemu /home/scott-lenovo/vm/core-image-minimal-qemux86.wic.vmdk
+     $ runqemu /home/scott-lenovo/vm/core-image-minimal-qemux86-64.wic.vmdk
                             </literallayout>
                             </para></listitem>
                     </itemizedlist>
@@ -296,7 +296,7 @@
                     extracts it to a directory named
                     <filename>test-nfs</filename>:
                     <literallayout class='monospaced'>
-     runqemu-extract-sdk ./tmp/deploy/images/qemux86/core-image-sato-qemux86.tar.bz2 test-nfs
+     runqemu-extract-sdk ./tmp/deploy/images/qemux86-64/core-image-sato-qemux86-64.tar.bz2 test-nfs
                     </literallayout>
                     </para></listitem>
                 <listitem><para>
@@ -310,7 +310,7 @@
                     Here is an example using the <filename>qemux86</filename>
                     image:
                     <literallayout class='monospaced'>
-     runqemu qemux86 ./test-nfs
+     runqemu qemux86-64 ./test-nfs
                     </literallayout>
                     </para></listitem>
             </orderedlist>
diff --git a/documentation/kernel-dev/kernel-dev-common.xml b/documentation/kernel-dev/kernel-dev-common.xml
index 2ea5d3f38..d94ed1942 100644
--- a/documentation/kernel-dev/kernel-dev-common.xml
+++ b/documentation/kernel-dev/kernel-dev-common.xml
@@ -89,8 +89,8 @@
                         <emphasis>Prepare Your <filename>local.conf</filename> File:</emphasis>
                         By default, the
                         <ulink url='&YOCTO_DOCS_REF_URL;#var-MACHINE'><filename>MACHINE</filename></ulink>
-                        variable is set to "qemux86", which is fine if you are
-                        building for the QEMU emulator in 32-bit mode.
+                        variable is set to "qemux86-64", which is fine if you are
+                        building for the QEMU emulator in 64-bit mode.
                         However, if you are not, you need to set the
                         <filename>MACHINE</filename> variable appropriately in
                         your <filename>conf/local.conf</filename> file found in
@@ -104,10 +104,12 @@
                         <ulink url='&YOCTO_DOCS_REF_URL;#var-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS'><filename>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS</filename></ulink>
                         variable to include kernel modules.</para>
 
-                        <para>This example uses the default "qemux86" for the
-                        <filename>MACHINE</filename> variable but needs to
-                        add the "kernel-modules":
+                        <para>In this example we wish to build for qemux86 so
+                        we must set the <filename>MACHINE</filename> variable
+                        to "qemux86" and also add the "kernel-modules". As described
+                        we do this by appending to <filename>conf/local.conf</filename>:
                         <literallayout class='monospaced'>
+     MACHINE = "qemux86"
      MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
                         </literallayout>
                         </para></listitem>
@@ -314,8 +316,8 @@
                         File:</emphasis>
                         By default, the
                         <ulink url='&YOCTO_DOCS_REF_URL;#var-MACHINE'><filename>MACHINE</filename></ulink>
-                        variable is set to "qemux86", which is fine if you are
-                        building for the QEMU emulator in 32-bit mode.
+                        variable is set to "qemux86-64", which is fine if you are
+                        building for the QEMU emulator in 64-bit mode.
                         However, if you are not, you need to set the
                         <filename>MACHINE</filename> variable appropriately in
                         your <filename>conf/local.conf</filename> file found
@@ -329,10 +331,12 @@
                         <ulink url='&YOCTO_DOCS_REF_URL;#var-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS'><filename>MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS</filename></ulink>
                         variable to include kernel modules.</para>
 
-                        <para>This example uses the default "qemux86" for the
-                        <filename>MACHINE</filename> variable but needs to
-                        add the "kernel-modules":
+                        <para>In this example we wish to build for qemux86 so
+                        we must set the <filename>MACHINE</filename> variable
+                        to "qemux86" and also add the "kernel-modules". As described
+                        we do this by appending to <filename>conf/local.conf</filename>:
                         <literallayout class='monospaced'>
+     MACHINE = "qemux86"
      MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
                         </literallayout>
                         </para></listitem>
diff --git a/documentation/profile-manual/profile-manual-usage.xml b/documentation/profile-manual/profile-manual-usage.xml
index 5999b2960..9a4273a0f 100644
--- a/documentation/profile-manual/profile-manual-usage.xml
+++ b/documentation/profile-manual/profile-manual-usage.xml
@@ -2182,7 +2182,7 @@
               meta-toolchain
               meta-ide-support
 
-     You can also run generated qemu images with a command like 'runqemu qemux86'
+     You can also run generated qemu images with a command like 'runqemu qemux86-64'
 
             </literallayout>
             Once you've done that, you can cd to whatever directory
diff --git a/documentation/ref-manual/ref-structure.xml b/documentation/ref-manual/ref-structure.xml
index 8e0c9f5b6..b6b953836 100644
--- a/documentation/ref-manual/ref-structure.xml
+++ b/documentation/ref-manual/ref-structure.xml
@@ -217,7 +217,7 @@
          meta-toolchain
          meta-ide-support
 
-     You can also run generated qemu images with a command like 'runqemu qemux86'
+     You can also run generated qemu images with a command like 'runqemu qemux86-64'
             </literallayout>
             The script gets its default list of common targets from the
             <filename>conf-notes.txt</filename> file, which is found in the
-- 
2.24.0

