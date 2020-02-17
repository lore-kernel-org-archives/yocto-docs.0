Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.14989.1581970891448128319
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 12:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:48610 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j3mtV-004tGS-BA
	for docs@lists.yoctoproject.org; Mon, 17 Feb 2020 15:21:30 -0500
Date: Mon, 17 Feb 2020 15:21:25 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: fix minor typos, wording, punctuation
Message-ID: <alpine.LFD.2.21.2002171519370.2338286@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp.xml
index 58f5733f7..3a3186f19 100644
--- a/documentation/bsp-guide/bsp.xml
+++ b/documentation/bsp-guide/bsp.xml
@@ -351,7 +351,7 @@
         layer combined with a build system and other tools.
         Realize that it is important to maintain the distinction
         that the BSP layer, a build system, and tools are
-        separate components that could to be combined in
+        separate components that could be combined in
         certain end products.
     </para>

@@ -567,7 +567,7 @@
             for the BSP.
             The type or types of files here can vary depending
             on the licensing requirements.
-            For example, in the Raspberry Pi BSP all licensing
+            For example, in the Raspberry Pi BSP, all licensing
             requirements are handled with the
             <filename>COPYING.MIT</filename> file.
         </para>
@@ -717,6 +717,7 @@
      BBFILE_PRIORITY_<replaceable>bsp</replaceable> = "6"

      LAYERDEPENDS_<replaceable>bsp</replaceable> = "intel"
+     LAYERSERIES_COMPAT_<replaceable>bsp</replaceable> = "zeus dunfell"
             </literallayout>
         </para>

@@ -802,7 +803,7 @@
             <ulink url='&YOCTO_DOCS_REF_URL;#source-directory'>Source Directory</ulink>.
             For example, many <filename>tune-*</filename> files
             (e.g. <filename>tune-arm1136jf-s.inc</filename>,
-            <filename>tun-1586-nlp.inc</filename>, and so forth)
+            <filename>tune-1586-nlp.inc</filename>, and so forth)
             reside in the
             <filename>poky/meta/conf/machine/include</filename>
             directory.
@@ -834,7 +835,7 @@
             This optional directory contains miscellaneous recipe
             files for the BSP.
             Most notably would be the formfactor files.
-            For example, in the Raspberry Pi BSP there is the
+            For example, in the Raspberry Pi BSP, there is the
             <filename>formfactor_0.0.bbappend</filename> file,
             which is an append file used to augment the recipe
             that starts the build.
@@ -1302,7 +1303,7 @@
                     (<filename>openembedded-core</filename>)
                     or the Source Directory (<filename>poky</filename>).
                     In other words, make sure you place related
-                    files in appropriately related
+                    files in appropriately-related
                     <filename>recipes-*</filename> subdirectories
                     specific to the recipe's function, or within
                     a subdirectory containing a set of closely-related
@@ -1347,7 +1348,7 @@
                             </para></listitem>
                         <listitem><para>
                             A list of all the dependencies
-                            on which a BSP layer depends.
+                            of the BSP.
                             These dependencies are typically a list
                             of required layers needed to build the
                             BSP.
@@ -1744,7 +1745,7 @@
     <para>
         The <filename>bitbake-layers create-layer</filename> script
         automates creating a BSP layer.
-        What makes a layer a "BSP layer", is the presence of a machine
+        What makes a layer a "BSP layer" is the presence of at least one machine
         configuration file.
         Additionally, a BSP layer usually has a kernel recipe
         or an append file that leverages off an existing kernel recipe.
@@ -1923,8 +1924,8 @@
      IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO zImage am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
             </literallayout>
             The variables used to configure the machine define
-            machine-specific properties.
-            For example, machine-dependent packages, machine
+            machine-specific properties;
+            for example, machine-dependent packages, machine
             tunings, the type of kernel to build, and
             U-Boot configurations.
         </para>
@@ -1935,7 +1936,7 @@
             machine configuration file for the BeagleBone
             development boards.
             Realize that much more can be defined as part of
-            a machines configuration file.
+            a machine's configuration file.
             In general, you can learn about related variables
             that this example does not have by locating the
             variables in the

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
