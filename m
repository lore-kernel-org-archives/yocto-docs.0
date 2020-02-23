Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.12534.1582495006146019883
 for <docs@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 13:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:32998 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j5zEy-003rbq-Df
	for docs@lists.yoctoproject.org; Sun, 23 Feb 2020 16:56:45 -0500
Date: Sun, 23 Feb 2020 16:56:42 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] BSP Guide: numerous tweaks/grammar/wording/clarification
Message-ID: <alpine.LFD.2.21.2002231655030.19378@localhost.localdomain>
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

  was working on this earlier, but don't think i submitted any of this
before now.

diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp.xml
index 58f5733f7..a0cb5aa26 100644
--- a/documentation/bsp-guide/bsp.xml
+++ b/documentation/bsp-guide/bsp.xml
@@ -19,7 +19,7 @@
 </para>

 <para>
-    This guide presents information about BSP Layers, defines a structure for components
+    This guide presents information about BSP layers, defines a structure for components
     so that BSPs follow a commonly understood layout, discusses how to customize
     a recipe for a BSP, addresses BSP licensing, and provides information that
     shows you how to create a
@@ -34,7 +34,7 @@
     <para>
         A BSP consists of a file structure inside a base directory.
         Collectively, you can think of the base directory, its file structure,
-        and the contents as a BSP Layer.
+        and the contents as a <firstterm>BSP layer</firstterm>.
         Although not a strict requirement, BSP layers in the Yocto Project
         use the following well-established naming convention:
         <literallayout class='monospaced'>
@@ -69,9 +69,9 @@
         Each repository is a BSP layer supported by the Yocto Project
         (e.g. <filename>meta-raspberrypi</filename> and
         <filename>meta-intel</filename>).
-        Each of these layers is a repository unto itself and clicking on a
-        layer reveals information that includes two links from which you can choose
-        to set up a clone of the layer's repository on your local host system.
+        Each of these layers is a repository unto itself and clicking on
+        the layer name displays two URLs from which you can
+        clone the layer's repository to your local system.
         Here is an example that clones the Raspberry Pi BSP layer:
         <literallayout class='monospaced'>
      $ git clone git://git.yoctoproject.org/meta-raspberrypi
@@ -83,12 +83,13 @@
         <filename>meta-yocto-bsp</filename> layer is part of the
         shipped <filename>poky</filename> repository.
         The <filename>meta-yocto-bsp</filename> layer maintains several
-        BSPs such as the Beaglebone, EdgeRouter, and generic versions of
+        "reference" BSPs including the ARM-based Beaglebone, MIPS-based
+        EdgeRouter, and generic versions of
         both 32-bit and 64-bit IA machines.
     </para>

     <para>
-        For information on the BSP development workflow, see the
+        For information on typical BSP development workflow, see the
         "<link linkend='developing-a-board-support-package-bsp'>Developing a Board Support Package (BSP)</link>"
         section.
         For more information on how to set up a local copy of source files
@@ -98,12 +99,12 @@
     </para>

     <para>
-        The layer's base directory
+        The BSP layer's base directory
         (<filename>meta-<replaceable>bsp_root_name</replaceable></filename>)
-        is the root directory of the BSP Layer.
+        is the root directory of that Layer.
         This directory is what you add to the
         <ulink url='&YOCTO_DOCS_REF_URL;#var-BBLAYERS'><filename>BBLAYERS</filename></ulink>
-        variable in the <filename>conf/bblayers.conf</filename> file found in the
+        variable in the <filename>conf/bblayers.conf</filename> file found in your
         <ulink url='&YOCTO_DOCS_REF_URL;#build-directory'>Build Directory</ulink>,
         which is established after you run the OpenEmbedded build environment
         setup script (i.e.
@@ -153,6 +154,20 @@
         layer.
         The <filename>meta-openembedded</filename> layer contains
         many <filename>meta-*</filename> layers.
+        In cases like this, you need to include the names of the actual
+        layers you want to work with, such as:
+        <literallayout class='monospaced'>
+     BBLAYERS ?= " \
+       /usr/local/src/yocto/meta \
+       /usr/local/src/yocto/meta-poky \
+       /usr/local/src/yocto/meta-yocto-bsp \
+       /usr/local/src/yocto/meta-mylayer \
+       .../meta-openembedded/meta-oe \
+       .../meta-openembedded/meta-perl \
+       .../meta-openembedded/meta-networking \
+       "
+        </literallayout>
+       and so on.
     </para>

     <para>
@@ -351,25 +366,24 @@
         layer combined with a build system and other tools.
         Realize that it is important to maintain the distinction
         that the BSP layer, a build system, and tools are
-        separate components that could to be combined in
+        separate components that could be combined in
         certain end products.
     </para>

     <para>
-        Before looking at the common form for the file structure
-        inside a BSP Layer, you should be aware that some
+        Before looking at the recommended form for the directory structure
+        inside a BSP layer, you should be aware that some
         requirements do exist in order for a BSP layer to
-        be considered compliant with the Yocto Project.
+        be considered <firstterm>compliant</firstterm> with the Yocto Project.
         For that list of requirements, see the
         "<link linkend='released-bsp-requirements'>Released BSP Requirements</link>"
         section.
     </para>

     <para>
-        Below is the common form for the file structure
-        inside a BSP Layer.
+        Below is the typical directory structure for a BSP layer.
         While this basic form represents the standard,
-        realize that the actual file structures for specific
+        realize that the actual layout for individual
         BSPs could differ.
         <literallayout class='monospaced'>
      meta-<replaceable>bsp_root_name</replaceable>/
@@ -567,7 +581,7 @@
             for the BSP.
             The type or types of files here can vary depending
             on the licensing requirements.
-            For example, in the Raspberry Pi BSP all licensing
+            For example, in the Raspberry Pi BSP, all licensing
             requirements are handled with the
             <filename>COPYING.MIT</filename> file.
         </para>
@@ -802,7 +816,7 @@
             <ulink url='&YOCTO_DOCS_REF_URL;#source-directory'>Source Directory</ulink>.
             For example, many <filename>tune-*</filename> files
             (e.g. <filename>tune-arm1136jf-s.inc</filename>,
-            <filename>tun-1586-nlp.inc</filename>, and so forth)
+            <filename>tune-1586-nlp.inc</filename>, and so forth)
             reside in the
             <filename>poky/meta/conf/machine/include</filename>
             directory.
@@ -834,7 +848,7 @@
             This optional directory contains miscellaneous recipe
             files for the BSP.
             Most notably would be the formfactor files.
-            For example, in the Raspberry Pi BSP there is the
+            For example, in the Raspberry Pi BSP, there is the
             <filename>formfactor_0.0.bbappend</filename> file,
             which is an append file used to augment the recipe
             that starts the build.
@@ -901,7 +915,7 @@
             The <filename>*.bb</filename> files would be a
             developer-supplied kernel recipe.
             This area of the BSP hierarchy can contain both these
-            types of files, although in practice, it is likely that
+            types of files although, in practice, it is likely that
             you would have one or the other.
         </para>

@@ -976,7 +990,7 @@
     <title>Developing a Board Support Package (BSP)</title>

     <para>
-        This section contains the high-level procedure you can
+        This section describes the high-level procedure you can
         follow to create a BSP.
         Although not required for BSP creation, the
         <filename>meta-intel</filename> repository, which
@@ -1302,7 +1316,7 @@
                     (<filename>openembedded-core</filename>)
                     or the Source Directory (<filename>poky</filename>).
                     In other words, make sure you place related
-                    files in appropriately related
+                    files in appropriately-related
                     <filename>recipes-*</filename> subdirectories
                     specific to the recipe's function, or within
                     a subdirectory containing a set of closely-related
@@ -1319,7 +1333,7 @@
                     directory.
                     This license covers the BSP Metadata as a whole.
                     You must specify which license to use since no
-                    default license exists when one not specified.
+                    default license exists when one is not specified.
                     See the
                     <ulink url='&YOCTO_GIT_URL;/cgit.cgi/meta-raspberrypi/tree/COPYING.MIT'><filename>COPYING.MIT</filename></ulink>
                     file for the Raspberry Pi BSP in the
@@ -1342,12 +1356,10 @@
                     file should contain the following:
                     <itemizedlist>
                         <listitem><para>
-                            A brief description about the hardware the BSP
-                            targets.
+                            A brief description of the target hardware.
                             </para></listitem>
                         <listitem><para>
-                            A list of all the dependencies
-                            on which a BSP layer depends.
+                            A list of all the dependencies of the BSP.
                             These dependencies are typically a list
                             of required layers needed to build the
                             BSP.
@@ -1610,7 +1622,7 @@
     <title>BSP Licensing Considerations</title>

     <para>
-        In some cases, a BSP contains separately licensed
+        In some cases, a BSP contains separately-licensed
         Intellectual Property (IP) for a component or components.
         For these cases, you are required to accept the terms
         of a commercial or other type of license that requires
@@ -1623,7 +1635,7 @@
     </para>

     <para>
-        You could find that some separately licensed components
+        You could find that some separately-licensed components
         that are essential for normal operation of the system might
         not have an unencumbered (or free) substitute.
         Without these essential components, the system would be
@@ -1631,7 +1643,7 @@
         Then again, you might find that other licensed components
         that are simply 'good-to-have' or purely elective do have
         an unencumbered, free replacement component that you can
-        use rather than agreeing to the separately licensed
+        use rather than agreeing to the separately-licensed
         component.
         Even for components essential to the system, you might
         find an unencumbered component that is not identical but
@@ -1744,7 +1756,7 @@
     <para>
         The <filename>bitbake-layers create-layer</filename> script
         automates creating a BSP layer.
-        What makes a layer a "BSP layer", is the presence of a machine
+        What makes a layer a "BSP layer" is the presence of at least one machine
         configuration file.
         Additionally, a BSP layer usually has a kernel recipe
         or an append file that leverages off an existing kernel recipe.
@@ -1868,11 +1880,14 @@
         </para>

         <para>
-            Machine configuration files exist in the
+            One or more machine configuration files exist in the
             <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filename>
             directory of the layer:
             <literallayout class='monospaced'>
-     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filename><replaceable>machine</replaceable><filename>.conf</filename>
+     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filename><replaceable>machine1</replaceable><filename>.conf</filename>
+     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filename><replaceable>machine2</replaceable><filename>.conf</filename>
+     <replaceable>bsp_layer</replaceable><filename>/conf/machine/</filename><replaceable>machine3</replaceable><filename>.conf</filename>
+     ... more ...
             </literallayout>
             For example, the machine configuration file for the
             <ulink url='http://beagleboard.org/bone'>BeagleBone and BeagleBone Black development boards</ulink>
@@ -1923,8 +1938,8 @@
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
@@ -1935,7 +1950,7 @@
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
