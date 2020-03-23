Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.50043.1584962243830167536
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 04:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:47972 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jGL56-006IpY-KP
	for docs@lists.yoctoproject.org; Mon, 23 Mar 2020 07:17:22 -0400
Date: Mon, 23 Mar 2020 07:17:18 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: various touchups, rewordings, corrections to Ch 5
Message-ID: <alpine.LFD.2.21.2003230715230.8053@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=0.3
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


Minor tweaks to chapter 5 of reference manual, including:

 - grammar
 - adding slashes to directory names for consistency
 - collapse trivial paras into one

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/ref-structure.xml b/documentation/ref-manual/ref-structure.xml
index 08699d8ec..27f17dd91 100644
--- a/documentation/ref-manual/ref-structure.xml
+++ b/documentation/ref-manual/ref-structure.xml
@@ -8,11 +8,11 @@

 <para>
     The <link linkend='source-directory'>Source Directory</link>
-    consists of several components.
-    Understanding them and knowing where they are located is key to using the
-    Yocto Project well.
+    consists of numerous files, directories and subdirectories;
+    understanding their locations and contents is key to using the
+    Yocto Project effectively.
     This chapter describes the Source Directory and gives information about
-    the various files and directories.
+    those files and directories.
 </para>

 <para>
@@ -22,12 +22,12 @@
     section in the Yocto Project Development Tasks Manual.
 </para>

-<note>
-    The OpenEmbedded build system does not support file or directory names that
-    contain spaces.
-    Be sure that the Source Directory you use does not contain these types
-    of names.
-</note>
+    <note>
+        The OpenEmbedded build system does not support file or directory names that
+        contain spaces.
+        Be sure that the Source Directory you use does not contain these types
+        of names.
+    </note>

 <section id='structure-core'>
     <title>Top-Level Core Components</title>
@@ -48,18 +48,18 @@
             <link linkend='metadata'>Metadata</link>
             interpreter, reads the Yocto Project Metadata and runs the tasks
             defined by that data.
-            Failures are usually from the Metadata and not from BitBake itself.
-            Consequently, most users do not need to worry about BitBake.
+            Failures are usually caused by errors in your Metadata and not from BitBake itself;
+            consequently, most users do not need to worry about BitBake.
         </para>

         <para>
             When you run the <filename>bitbake</filename> command, the
-            main BitBake executable, which resides in the
-            <filename>bitbake/bin/</filename> directory, starts.
+            main BitBake executable (which resides in the
+            <filename>bitbake/bin/</filename> directory) starts.
             Sourcing the environment setup script (i.e.
             <link linkend="structure-core-script"><filename>&OE_INIT_FILE;</filename></link>)
-            places the <filename>scripts</filename> and
-            <filename>bitbake/bin</filename> directories (in that order) into
+            places the <filename>scripts/</filename> and
+            <filename>bitbake/bin/</filename> directories (in that order) into
             the shell's <filename>PATH</filename> environment variable.
         </para>

@@ -91,7 +91,7 @@
             by providing a directory name when you <filename>source</filename>
             the setup script.
             For information on separating output from your local
-            Source Directory files, see the
+            Source Directory files (commonly described as an "out of tree" build), see the
             "<link linkend='structure-core-script'><filename>&OE_INIT_FILE;</filename></link>"
             section.
         </para>
@@ -104,8 +104,8 @@
             This directory holds the source for the Yocto Project documentation
             as well as templates and tools that allow you to generate PDF and HTML
             versions of the manuals.
-            Each manual is contained in a sub-folder.
-            For example, the files for this manual reside in
+            Each manual is contained in its own sub-folder;
+            for example, the files for this reference manual reside in
             the <filename>ref-manual/</filename> directory.
         </para>
     </section>
@@ -114,9 +114,9 @@
         <title><filename>meta/</filename></title>

         <para>
-            This directory contains the OpenEmbedded-Core metadata.
+            This directory contains the minimal, underlying OpenEmbedded-Core metadata.
             The directory holds recipes, common classes, and machine
-            configuration for emulated targets (<filename>qemux86</filename>,
+            configuration for strictly emulated targets (<filename>qemux86</filename>,
             <filename>qemuarm</filename>, and so forth.)
         </para>
     </section>
@@ -125,8 +125,8 @@
         <title><filename>meta-poky/</filename></title>

         <para>
-            This directory contains the configuration for the Poky
-            reference distribution.
+            Designed above the <filename>meta/</filename> content, this directory
+            adds just enough metadata to define the Poky reference distribution.
         </para>
     </section>

@@ -148,9 +148,6 @@
             This directory adds additional recipes and append files
             used by the OpenEmbedded selftests to verify the behavior
             of the build system.
-        </para>
-
-        <para>
             You do not have to add this layer to your
             <filename>bblayers.conf</filename> file unless you want to run the
             selftests.
@@ -172,7 +169,7 @@
             This directory contains various integration scripts that implement
             extra functionality in the Yocto Project environment (e.g. QEMU scripts).
             The <link linkend="structure-core-script"><filename>&OE_INIT_FILE;</filename></link>
-            script appends this directory to the shell's
+            script prepends this directory to the shell's
             <filename>PATH</filename> environment variable.
         </para>

@@ -202,7 +199,8 @@
             up, a
             <link linkend='build-directory'>Build Directory</link>
             is created, your working directory becomes the Build Directory,
-            and you are presented with a list of common BitBake targets.
+            and you are presented with some simple suggestions as to what to do
+            next, including a list of some possible targets to build.
             Here is an example:
             <literallayout class='monospaced'>
      $ source oe-init-build-env
@@ -219,12 +217,12 @@

      You can also run generated qemu images with a command like 'runqemu qemux86-64'
             </literallayout>
-            The script gets its default list of common targets from the
-            <filename>conf-notes.txt</filename> file, which is found in the
+            The default output of the <filename>oe-init-build-env</filename> script
+            is from the <filename>conf-notes.txt</filename> file, which is found in the
             <filename>meta-poky</filename> directory within the
             <link linkend='source-directory'>Source Directory</link>.
-            Should you have custom distributions, it is very easy to modify
-            this configuration file to include your targets for your
+            If you design a custom distribution, you can include your own version
+            of this configuration file to mention the targets defined by your
             distribution.
             See the
             "<ulink url='&YOCTO_DOCS_DEV_URL;#creating-a-custom-template-configuration-directory'>Creating a Custom Template Configuration Directory</ulink>"
@@ -234,20 +232,20 @@

         <para>
             By default, running this script without a Build Directory
-            argument creates the <filename>build</filename> directory
+            argument creates the <filename>build/</filename> directory
             in your current working directory.
             If you provide a Build Directory argument when you
             <filename>source</filename> the script, you direct the OpenEmbedded
             build system to create a Build Directory of your choice.
             For example, the following command creates a Build Directory named
-            <filename>mybuilds</filename> that is outside of the
+            <filename>mybuilds/</filename> that is outside of the
             <link linkend='source-directory'>Source Directory</link>:
             <literallayout class='monospaced'>
      $ source &OE_INIT_FILE; ~/mybuilds
             </literallayout>
             The OpenEmbedded build system uses the template configuration
             files, which are found by default in the
-            <filename>meta-poky/conf</filename> directory in the
+            <filename>meta-poky/conf/</filename> directory in the
             Source Directory.
             See the
             "<ulink url='&YOCTO_DOCS_DEV_URL;#creating-a-custom-template-configuration-directory'>Creating a Custom Template Configuration Directory</ulink>"
@@ -280,28 +278,26 @@
     <para>
         The OpenEmbedded build system creates the
         <link linkend='build-directory'>Build Directory</link>
-        when you run the build environment setup scripts (i.e.
-        <link linkend='structure-core-script'><filename>&OE_INIT_FILE;</filename></link>).
-    </para>
-
-    <para>
+        when you run the build environment setup script
+        <link
+linkend='structure-core-script'><filename>&OE_INIT_FILE;</filename></link>.
         If you do not give the Build Directory a specific name when you run
-        a setup script, the name defaults to <filename>build</filename>.
+        the setup script, the name defaults to <filename>build/</filename>.
     </para>

     <para>
-        The
-        <link linkend='var-TOPDIR'><filename>TOPDIR</filename></link> variable
-        points to the Build Directory.
+        For subsequent parsing and processing, the name of the Build
+        directory is available via the
+        <link linkend='var-TOPDIR'><filename>TOPDIR</filename></link> variable.
     </para>

     <section id='structure-build-buildhistory'>
-        <title><filename>build/buildhistory</filename></title>
+        <title><filename>build/buildhistory/</filename></title>

         <para>
             The OpenEmbedded build system creates this directory when you
-            enable the build history feature.
-            The directory tracks build information into image, packages, and
+            enable build history via the <filename>buildhistory</filename> class file.
+            The directory organizes build information into image, packages, and
             SDK subdirectories.
             For information on the build history feature, see the
             "<ulink url='&YOCTO_DOCS_DEV_URL;#maintaining-build-output-quality'>Maintaining Build Output Quality</ulink>"
@@ -320,14 +316,14 @@
             Any variable set here overrides any variable set elsewhere within
             the environment unless that variable is hard-coded within a file
             (e.g. by using '=' instead of '?=').
-            Some variables are hard-coded for various reasons but these
+            Some variables are hard-coded for various reasons but such
             variables are relatively rare.
         </para>

         <para>
-            Edit this file to set the
-            <filename><link linkend='var-MACHINE'>MACHINE</link></filename>
-            for which you want to build, which package types you wish to use
+            At a minimum, you would normally edit this file to select the target
+            <filename><link linkend='var-MACHINE'>MACHINE</link></filename>,
+            which package types you wish to use
             (<link linkend='var-PACKAGE_CLASSES'><filename>PACKAGE_CLASSES</filename></link>),
             and the location from which you want to access downloaded files
             (<filename><link linkend='var-DL_DIR'>DL_DIR</link></filename>).
@@ -338,16 +334,16 @@
             start the build, the OpenEmbedded build system creates it from
             <filename>local.conf.sample</filename> when
             you <filename>source</filename> the top-level build environment
-            setup script (i.e.
-            <link linkend='structure-core-script'><filename>&OE_INIT_FILE;</filename></link>).
+            setup script
+            <link linkend='structure-core-script'><filename>&OE_INIT_FILE;</filename></link>.
         </para>

         <para>
             The source <filename>local.conf.sample</filename> file used
             depends on the <filename>$TEMPLATECONF</filename> script variable,
-            which defaults to <filename>meta-poky/conf</filename>
+            which defaults to <filename>meta-poky/conf/</filename>
             when you are building from the Yocto Project development
-            environment and defaults to <filename>meta/conf</filename> when
+            environment, and to <filename>meta/conf/</filename> when
             you are building from the OpenEmbedded-Core environment.
             Because the script variable points to the source of the
             <filename>local.conf.sample</filename> file, this implies that
@@ -395,11 +391,12 @@
         </para>

         <para>
-            The source <filename>bblayers.conf.sample</filename> file used
+            As with the <filename>local.conf</filename> file,
+            the source <filename>bblayers.conf.sample</filename> file used
             depends on the <filename>$TEMPLATECONF</filename> script variable,
-            which defaults to <filename>meta-poky/conf</filename>
+            which defaults to <filename>meta-poky/conf/</filename>
             when you are building from the Yocto Project development
-            environment and defaults to <filename>meta/conf</filename> when
+            environment, and to <filename>meta/conf/</filename> when
             you are building from the OpenEmbedded-Core environment.
             Because the script variable points to the source of the
             <filename>bblayers.conf.sample</filename> file, this implies that
@@ -418,7 +415,7 @@
                 <link linkend='source-directory'>Source Directory</link>.
                 You can find the Yocto Project version of the
                 <filename>bblayers.conf.sample</filename> file in the
-                <filename>meta-poky/conf</filename> directory.
+                <filename>meta-poky/conf/</filename> directory.
             </note>
         </para>
     </section>
@@ -572,8 +569,11 @@
         <title><filename>build/tmp/deploy/images/</filename></title>

         <para>
-            This directory receives complete filesystem images.
-            If you want to flash the resulting image from a build onto a device, look here for the image.
+            This directory is populated with the basic output objects of the
+            build (think of them as the "generated artifacts" of the build process),
+            including things like the boot loader image, kernel, root filesystem and more.
+            If you want to flash the resulting image from a build onto a device,
+            look here for the necessary components.
         </para>

         <para>
@@ -604,7 +604,7 @@

         <para>
             The OpenEmbedded build system creates this directory to hold
-            toolchain installer scripts, which when executed, install the
+            toolchain installer scripts which, when executed, install the
             sysroot that matches your target hardware.
             You can find out more about these installers in the
             "<ulink url='&YOCTO_DOCS_SDK_URL;#sdk-building-an-sdk-installer'>Building an SDK Installer</ulink>"
@@ -1038,7 +1038,7 @@
         <title><filename>meta/recipes-graphics/</filename></title>

         <para>
-            This directory contains X and other graphically related system libraries
+            This directory contains X and other graphically related system libraries.
         </para>
     </section>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
