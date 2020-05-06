Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.3899.1588797614320290339
 for <docs@lists.yoctoproject.org>;
 Wed, 06 May 2020 13:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:56986 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jWQps-003Dwd-Ga
	for docs@lists.yoctoproject.org; Wed, 06 May 2020 16:40:13 -0400
Date: Wed, 6 May 2020 16:40:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: get rid of long-useless comments in variable glossary
Message-ID: <alpine.LFD.2.21.2005061630170.10688@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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


According to "git blame", hundreds of lines in the ref manual were
commented out back in 2015 and have just been taking up space since
then, so get rid of them. Where they were commented out:

  commit 9f1472b7d4cd86545e7927b0f693aafc88ae2791
  Author: Scott Rifenbark <scott.m.rifenbark@intel.com>
  Date:   Tue Mar 31 12:20:13 2015 -0700

    ref-manual: Backed out the bits for the context PNG images.

    We did not have time to do this for 1.8.  So, I restored the look
    of the glossary pre-images.  I did leave commented code in both
    the glossary chapter and the style sheet for later.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  as i'm going to be messing with the ref manual, i see no reason to
keep dragging around hundreds of five-year-old comments.

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 9ebe72cbd..364cd09eb 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -52,7 +52,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Extension to the Application Binary Interface (ABI)
                     field of the GNU canonical architecture name
                     (e.g. "eabi").
@@ -76,7 +75,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                    Specifies whether to produce an output package even if it is
                    empty.
                    By default, BitBake does not produce empty packages.
@@ -103,7 +101,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists commands in a package that need an alternative
                     binary naming scheme.
                     Sometimes the same command is provided in multiple packages.
@@ -134,7 +131,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Used by the alternatives system to map duplicated commands
                     to actual locations.
                     For example, if the <filename>bracket</filename> command
@@ -174,7 +170,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Used by the alternatives system to create default
                     priorities for duplicated commands.
                     You can use the variable to create a single default
@@ -203,7 +198,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Used by the alternatives system to create default link
                     locations for duplicated commands.
                     You can use the variable to create a single default
@@ -258,7 +252,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     An override list of append strings for each target
                     specified with
                     <link linkend='var-LABELS'><filename>LABELS</filename></link>.
@@ -278,7 +271,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments used to run
                     <filename>ar</filename>.
                 </para>
@@ -291,7 +283,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When used with the
                     <link linkend='ref-classes-archiver'><filename>archiver</filename></link>
                     class, determines the type of information used to create
@@ -334,7 +325,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Minimal command and arguments needed to run the
                     assembler.
                 </para>
@@ -347,7 +337,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists recipe names
                     (<link linkend='var-PN'><filename>PN</filename></link>
                     values) BitBake does not attempt to build.
@@ -371,7 +360,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Provides additional <filename>shlibs</filename> provider
                     mapping information, which adds to or overwrites the
                     information provided automatically by the system.
@@ -406,7 +394,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The email address used to contact the original author
                     or authors in order to send patches and forward bugs.
                 </para>
@@ -419,7 +406,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When the
                     <link linkend='ref-classes-debian'><filename>debian</filename></link>
                     class is inherited, which is the default behavior,
@@ -442,7 +428,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Enables creating an automatic menu for the syslinux
                     bootloader.
                     You must set this variable in your recipe.
@@ -459,7 +444,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When
                     <filename><link linkend='var-SRCREV'>SRCREV</link></filename>
                     is set to the value of this variable, it specifies to use
@@ -501,7 +485,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->

                     List of licenses found in the directories specified
                     by <link linkend='var-COMMON_LICENSE_DIR'><filename>COMMON_LICENSE_DIR</filename></link>
@@ -525,7 +508,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The list of defined CPU and Application Binary Interface
                     (ABI) tunings (i.e.  "tunes") available for use by the
                     OpenEmbedded build system.
@@ -560,7 +542,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory within the
                     <link linkend='build-directory'>Build Directory</link>
                     in which the OpenEmbedded build system places generated
@@ -590,7 +571,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists "recommended-only" packages to not install.
                     Recommended-only packages are packages installed only
                     through the
@@ -645,7 +625,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The library directory name for the CPU or Application
                     Binary Interface (ABI) tune.
                     The <filename>BASE_LIB</filename> applies only in the
@@ -671,7 +650,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the base of the work directory for all recipes.
                     The default value is "${TMPDIR}/work".
                 </para>
@@ -751,7 +729,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines how BitBake handles situations where an append
                     file (<filename>.bbappend</filename>) has no
                     corresponding recipe file (<filename>.bb</filename>).
@@ -789,7 +766,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Monitors disk space and available inodes during the build
                     and allows you to control the build based on these
                     parameters.
@@ -887,7 +863,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the disk space and free inode warning intervals.
                     To set these intervals, define the variable in your
                     <filename>conf/local.conf</filename> file in the
@@ -959,7 +934,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Causes tarballs of the source control repositories
                     (e.g. Git repositories), including metadata, to be placed
                     in the
@@ -994,7 +968,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The maximum number of tasks BitBake should run in parallel
                     at any one time.
                     The OpenEmbedded build system automatically configures
@@ -1030,7 +1003,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the time (in seconds) after which to unload the
                     BitBake server due to inactivity.
                     Set <filename>BB_SERVER_TIMEOUT</filename> to determine how
@@ -1056,7 +1028,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Allows you to extend a recipe so that it builds variants of the software.
                     Common variants for recipes exist such as "natives" like <filename>quilt-native</filename>,
                     which is a copy of Quilt built to run on the build system;
@@ -1107,7 +1078,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists the names of configured layers.
                     These names are used to find the other <filename>BBFILE_*</filename>
                     variables.
@@ -1123,7 +1093,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Variable that expands to match files from
                     <link linkend='var-BBFILES'><filename>BBFILES</filename></link>
                     in a particular layer.
@@ -1140,7 +1109,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Assigns the priority for recipe files in each layer.
                 </para>

@@ -1183,7 +1151,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list of recipe files BitBake uses to
                     build software.
                 </para>
@@ -1205,7 +1172,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Activates content when identified layers are present.
                     You identify the layers by the collections that the layers
                     define.
@@ -1252,7 +1218,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Variable that controls how BitBake displays logs on build failure.
                 </para>
             </glossdef>
@@ -1264,7 +1229,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If
                     <link linkend='var-BBINCLUDELOGS'><filename>BBINCLUDELOGS</filename></link>
                     is set, specifies the maximum number of lines from the
@@ -1281,7 +1245,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists the layers to enable during the build.
                     This variable is defined in the <filename>bblayers.conf</filename> configuration
                     file in the
@@ -1310,7 +1273,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Prevents BitBake from processing recipes and recipe
                     append files.
                 </para>
@@ -1372,7 +1334,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies each additional separate configuration when you
                     are building targets with multiple configurations.
                     Use this variable in your
@@ -1408,7 +1369,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Used by BitBake to locate
                     <filename>.bbclass</filename> and configuration files.
                     This variable is analogous to the
@@ -1437,7 +1397,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If defined in the BitBake environment,
                     <filename>BBSERVER</filename> points to the BitBake
                     remote server.
@@ -1466,7 +1425,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-binconfig-disabled'><filename>binconfig-disabled</filename></link>
                     class, this variable specifies binary configuration
@@ -1494,7 +1452,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-binconfig'><filename>binconfig</filename></link>
                     class, this variable specifies a wildcard for
@@ -1533,7 +1490,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base recipe name and version but without any special
                     recipe name suffix (i.e. <filename>-native</filename>, <filename>lib64-</filename>,
                     and so forth).
@@ -1551,7 +1507,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable is a version of the
                     <link linkend='var-PN'><filename>PN</filename></link>
                     variable with common prefixes and suffixes
@@ -1576,7 +1531,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a URL for an upstream bug tracking website for
                     a recipe.
                     The OpenEmbedded build system does not use this variable.
@@ -1592,7 +1546,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the architecture of the build host
                     (e.g. <filename>i686</filename>).
                     The OpenEmbedded build system sets the value of
@@ -1608,7 +1561,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the architecture-specific assembler flags for
                     the build host. By default, the value of
                     <filename>BUILD_AS_ARCH</filename> is empty.
@@ -1622,7 +1574,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the architecture-specific C compiler flags for
                     the build host. By default, the value of
                     <filename>BUILD_CC_ARCH</filename> is empty.
@@ -1636,7 +1587,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the linker command to be used for the build host
                     when the C compiler is being used as the linker. By default,
                     <filename>BUILD_CCLD</filename> points to GCC and passes as
@@ -1653,7 +1603,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C compiler when building
                     for the build host.
                     When building in the <filename>-native</filename> context,
@@ -1669,7 +1618,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C preprocessor
                     (i.e. to both the C and the C++ compilers) when building
                     for the build host.
@@ -1686,7 +1634,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C++ compiler when
                     building for the build host.
                     When building in the <filename>-native</filename> context,
@@ -1702,7 +1649,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the Fortran compiler command for the build host.
                     By default, <filename>BUILD_FC</filename> points to
                     Gfortran and passes as arguments the value of
@@ -1718,7 +1664,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the linker command for the build host. By default,
                     <filename>BUILD_LD</filename> points to the GNU linker (ld)
                     and passes as arguments the value of
@@ -1734,7 +1679,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific linker flags for the build
                     host. By default, the value of
                     <filename>BUILD_LD_ARCH</filename> is empty.
@@ -1748,7 +1692,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the linker when building
                     for the build host.
                     When building in the <filename>-native</filename> context,
@@ -1764,7 +1707,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the optimization flags passed to the C compiler
                     when building for the build host or the SDK.
                     The flags are passed through the
@@ -1788,7 +1730,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the operating system in use on the build
                     host (e.g. "linux").
                     The OpenEmbedded build system sets the value of
@@ -1805,7 +1746,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The toolchain binary prefix used for native recipes.
                     The OpenEmbedded build system uses the
                     <filename>BUILD_PREFIX</filename> value to set the
@@ -1821,7 +1761,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the command to be used to strip debugging symbols
                     from binaries produced for the build host. By default,
                     <filename>BUILD_STRIP</filename> points to
@@ -1836,7 +1775,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the system, including the architecture and
                     the operating system, to use when building for the build
                     host (i.e. when building <filename>native</filename>
@@ -1862,7 +1800,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the vendor name to use when building for the
                     build host.
                     The default value is an empty string ("").
@@ -1876,7 +1813,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the location of the
                     <link linkend='build-directory'>Build Directory</link>.
                     You can define this directory indirectly through the
@@ -1896,7 +1832,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-buildhistory'><filename>buildhistory</filename></link>
                     class, this variable specifies whether or not to commit the
@@ -1928,7 +1863,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-buildhistory'><filename>buildhistory</filename></link>
                     class, this variable specifies the author to use for each
@@ -1963,7 +1897,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-buildhistory'><filename>buildhistory</filename></link>
                     class, this variable specifies the directory in which
@@ -1988,7 +1921,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-buildhistory'><filename>buildhistory</filename></link>
                     class, this variable specifies the build history features
@@ -2041,7 +1973,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-buildhistory'><filename>buildhistory</filename></link>
                     class, this variable specifies a list of paths to files
@@ -2074,7 +2005,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-buildhistory'><filename>buildhistory</filename></link>
                     class, this variable optionally specifies a remote
@@ -2109,7 +2039,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C compiler when building
                     for the SDK.
                     When building in the <filename>nativesdk-</filename>
@@ -2126,7 +2055,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C pre-processor
                     (i.e. to both the C and the C++ compilers) when building
                     for the SDK.
@@ -2144,7 +2072,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C++ compiler when
                     building for the SDK.
                     When building in the <filename>nativesdk-</filename>
@@ -2161,7 +2088,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the linker when building
                     for the SDK.
                     When building in the <filename>nativesdk-</filename>
@@ -2178,7 +2104,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the location of the directory that holds build
                     statistics when you use and enable the
                     <link linkend='ref-classes-buildstats'><filename>buildstats</filename></link>
@@ -2196,7 +2121,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For the BusyBox recipe, specifies whether to split the
                     output executable file into two parts: one for features
                     that require <filename>setuid root</filename>, and one for
@@ -2224,7 +2148,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the directory BitBake uses to store a cache
                     of the
                     <link linkend='metadata'>Metadata</link>
@@ -2240,7 +2163,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments used to run the C
                     compiler.
                 </para>
@@ -2253,7 +2175,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C compiler.
                     This variable is exported to an environment
                     variable and thus made visible to the software being
@@ -2289,7 +2210,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     An internal variable specifying the special class override
                     that should currently apply (e.g. "class-target",
                     "class-native", and so forth).
@@ -2333,7 +2253,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If set to "1" within a recipe,
                     <filename>CLEANBROKEN</filename> specifies that
                     the <filename>make clean</filename> command does
@@ -2352,7 +2271,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Provides a list of hardware features that are enabled in
                     both
                     <link linkend='var-MACHINE_FEATURES'><filename>MACHINE_FEATURES</filename></link>
@@ -2375,7 +2293,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to <filename>meta/files/common-licenses</filename>
                     in the
                     <link linkend='source-directory'>Source Directory</link>,
@@ -2390,7 +2307,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A regular expression that resolves to one or more hosts
                     (when the recipe is native) or one or more targets (when
                     the recipe is non-native) with which a recipe is compatible.
@@ -2413,7 +2329,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A regular expression that resolves to one or more
                     target machines with which a recipe is compatible.
                     The regular expression is matched against
@@ -2434,7 +2349,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines wildcards to match when installing a list of
                     complementary packages for all the packages explicitly
                     (or implicitly) installed in an image.
@@ -2473,7 +2387,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Stores sysroot components for each recipe.
                     The OpenEmbedded build system uses
                     <filename>COMPONENTS_DIR</filename> when constructing
@@ -2494,7 +2407,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Tracks the version of the local configuration file
                     (i.e. <filename>local.conf</filename>).
                     The value for <filename>CONF_VERSION</filename>
@@ -2510,7 +2422,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Identifies editable or configurable files that are part of a package.
                     If the Package Management System (PMS) is being used to update
                     packages on the target system, it is possible that
@@ -2564,7 +2475,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Identifies the initial RAM filesystem (initramfs) source
                     files.
                     The OpenEmbedded build system receives and uses
@@ -2607,7 +2517,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of files that contains <filename>autoconf</filename> test results relevant
                     to the current build.
                     This variable is used by the Autotools utilities when running
@@ -2622,7 +2531,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal arguments for GNU configure.
                 </para>
             </glossdef>
@@ -2634,7 +2542,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-distro_features_check'><filename>distro_features_check</filename></link>
                     class, this
@@ -2657,7 +2564,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list of licenses to exclude from the
                     source archived by the
                     <link linkend='ref-classes-archiver'><filename>archiver</filename></link>
@@ -2689,7 +2595,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list of licenses to include in the
                     source archived by the
                     <link linkend='ref-classes-archiver'><filename>archiver</filename></link>
@@ -2717,7 +2622,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of recipes to exclude in the source archived
                     by the
                     <link linkend='ref-classes-archiver'><filename>archiver</filename></link>
@@ -2749,7 +2653,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of recipes to include in the source archived
                     by the
                     <link linkend='ref-classes-archiver'><filename>archiver</filename></link>
@@ -2781,7 +2684,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list of recipe types to include
                     in the source archived by the
                     <link linkend='ref-classes-archiver'><filename>archiver</filename></link>
@@ -2811,7 +2713,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If set to "1" along with the
                     <link linkend='var-COPY_LIC_MANIFEST'><filename>COPY_LIC_MANIFEST</filename></link>
                     variable, the OpenEmbedded build system copies
@@ -2843,7 +2744,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If set to "1", the OpenEmbedded build system copies
                     the license manifest for the image to
                     <filename>/usr/share/common-licenses/license.manifest</filename>
@@ -2871,7 +2771,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the list of packages to be added to the image.
                     You should only set this variable in the
                     <filename>local.conf</filename> configuration file found
@@ -2891,7 +2790,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the parent directory of the OpenEmbedded-Core
                     Metadata layer (i.e. <filename>meta</filename>).
                 </para>
@@ -2917,7 +2815,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists files from the
                     <link linkend='var-COREBASE'><filename>COREBASE</filename></link>
                     directory that should be copied other than the layers
@@ -2946,7 +2843,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments used to run the C
                     preprocessor.
                 </para>
@@ -2959,7 +2855,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C pre-processor
                     (i.e. to both the C and the C++ compilers).
                     This variable is exported to an environment
@@ -2996,7 +2891,6 @@
             </info>
             <glossdef>
                <para role="glossdeffirst">
-<!--               <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The toolchain binary prefix for the target tools.
                     The <filename>CROSS_COMPILE</filename> variable is the
                     same as the
@@ -3018,7 +2912,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory in which files checked out under the
                     CVS system are stored.
                 </para>
@@ -3031,7 +2924,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments used to run the C++
                     compiler.
                 </para>
@@ -3044,7 +2936,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C++ compiler.
                     This variable is exported to an environment
                     variable and thus made visible to the software being
@@ -3084,7 +2975,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The destination directory.
                     The location in the
                     <link linkend='build-directory'>Build Directory</link>
@@ -3110,7 +3000,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The date the build was started.
                     Dates appear using the year, month, and day (YMD) format
                     (e.g. "20150209" for February 9th, 2015).
@@ -3124,7 +3013,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The date and time on which the current build started.
                     The format is suitable for timestamps.
                 </para>
@@ -3137,7 +3025,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When the
                     <link linkend='ref-classes-debian'><filename>debian</filename></link>
                     class is inherited, which is the default behavior,
@@ -3161,7 +3048,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When the
                     <link linkend='ref-classes-debian'><filename>debian</filename></link>
                     class is inherited, which is the default behavior,
@@ -3185,7 +3071,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies to build packages with debugging information.
                     This influences the value of the
                     <filename><link linkend='var-SELECTED_OPTIMIZATION'>SELECTED_OPTIMIZATION</link></filename>
@@ -3200,7 +3085,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The options to pass in
                     <filename><link linkend='var-TARGET_CFLAGS'>TARGET_CFLAGS</link></filename>
                     and <filename><link linkend='var-CFLAGS'>CFLAGS</link></filename> when compiling
@@ -3216,7 +3100,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a weak bias for recipe selection priority.
                 </para>

@@ -3246,7 +3129,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The default CPU and Application Binary Interface (ABI)
                     tunings (i.e.  the "tune") used by the OpenEmbedded build
                     system.
@@ -3271,7 +3153,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists a recipe's build-time dependencies.
                     These are dependencies on other recipes whose
                     contents (e.g. headers and shared libraries) are needed
@@ -3394,7 +3275,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the general area that the OpenEmbedded build
                     system uses to place images, packages, SDKs, and other output
                     files that are ready to be used outside of the build system.
@@ -3426,7 +3306,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the area that the OpenEmbedded build system uses
                     to place Debian packages that are ready to be used outside
                     of the build system.
@@ -3466,7 +3345,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the area that the OpenEmbedded build system uses
                     to place images and other associated output files that are
                     ready to be deployed onto the target machine.
@@ -3499,7 +3377,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the area that the OpenEmbedded build system uses
                     to place IPK packages that are ready to be used outside of
                     the build system.
@@ -3538,7 +3415,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the area that the OpenEmbedded build system uses
                     to place RPM packages that are ready to be used outside
                     of the build system.
@@ -3577,7 +3453,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the area that the OpenEmbedded build system uses
                     to place tarballs that are ready to be used outside of
                     the build system.
@@ -3616,7 +3491,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-deploy'><filename>deploy</filename></link>
                     class, the <filename>DEPLOYDIR</filename> points to a
@@ -3644,7 +3518,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The package description used by package managers.
                     If not set, <filename>DESCRIPTION</filename> takes
                     the value of the
@@ -3660,7 +3533,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The short name of the distribution.
                     For information on the long name of the distribution, see
                     the
@@ -3713,7 +3585,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a codename for the distribution being built.
                 </para>
             </glossdef>
@@ -3725,7 +3596,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of distro-specific packages to add to all images.
                     This variable takes affect through
                     <filename>packagegroup-base</filename> so the
@@ -3745,7 +3615,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of distro-specific packages to add to all images
                     if the packages exist.
                     The packages might not exist or be empty (e.g. kernel modules).
@@ -3761,7 +3630,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The software support you want in your distribution for
                     various features.
                     You define your distribution features in the distribution
@@ -3798,7 +3666,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Features to be added to
                     <filename><link linkend='var-DISTRO_FEATURES'>DISTRO_FEATURES</link></filename>
                     if not also present in
@@ -3822,7 +3689,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Features from
                     <filename><link linkend='var-DISTRO_FEATURES_BACKFILL'>DISTRO_FEATURES_BACKFILL</link></filename>
                     that should not be backfilled (i.e. added to
@@ -3840,7 +3706,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A convenience variable that gives you the default
                     list of distro features with the exception of any
                     features specific to the C library
@@ -3868,7 +3733,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of features that if present in
                     the target
                     <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link>
@@ -3889,7 +3753,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of features that if present in the target
                     <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link>
                     value should be included in
@@ -3910,7 +3773,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-                    <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" />
                     A convenience variable that specifies the list of distro
                     features that are specific to the C library
                     (<filename>libc</filename>).
@@ -3928,7 +3790,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of features that should be included in
                     <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link>
                     when building native recipes.
@@ -3946,7 +3807,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of features that should be included in
                     <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link>
                     when building nativesdk recipes.
@@ -3964,7 +3824,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The long name of the distribution.
                     For information on the short name of the distribution, see
                     the
@@ -4016,7 +3875,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The version of the distribution.
                 </para>
             </glossdef>
@@ -4028,7 +3886,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A colon-separated list of overrides specific to the
                     current distribution.
                     By default, this list includes the value of
@@ -4056,7 +3913,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The central download directory used by the build process to
                     store downloads.
                     By default, <filename>DL_DIR</filename> gets files
@@ -4119,7 +3975,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-compress_doc'><filename>compress_doc</filename></link>
                     class, this variable sets the compression policy used when
@@ -4147,7 +4002,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When building bootable images (i.e. where
                     <filename>hddimg</filename>, <filename>iso</filename>,
                     or <filename>wic.vmdk</filename> is in
@@ -4174,7 +4028,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Variable that controls which locales for
                     <filename>glibc</filename> are generated during the
                     build (useful if the target device has 64Mbytes
@@ -4189,7 +4042,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When used with the
                     <link linkend='ref-classes-report-error'><filename>report-error</filename></link>
                     class, specifies the path used for storing the debug files
@@ -4218,7 +4070,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the quality assurance checks whose failures are
                     reported as errors by the OpenEmbedded build system.
                     You set this variable in your distribution configuration
@@ -4237,7 +4088,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Triggers the OpenEmbedded build system's shared libraries
                     resolver to exclude an entire package when scanning for
                     shared libraries.
@@ -4276,7 +4126,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Directs BitBake to exclude a recipe from world builds (i.e.
                     <filename>bitbake world</filename>).
                     During world builds, BitBake locates, parses and builds all
@@ -4306,7 +4155,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Used with file and pathnames to create a prefix for a recipe's
                     version based on the recipe's
                     <link linkend='var-PE'><filename>PE</filename></link> value.
@@ -4328,7 +4176,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The full package version specification as it appears on the
                     final packages produced by a recipe.
                     The variable's value is normally used to fix a runtime
@@ -4353,7 +4200,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When set, the <filename>EXTERNAL_KERNEL_TOOLS</filename>
                     variable indicates that these tools are not in the
                     source tree.
@@ -4379,7 +4225,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-externalsrc'><filename>externalsrc</filename></link>
                     class, this variable points to the source tree, which is
@@ -4409,7 +4254,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-externalsrc'><filename>externalsrc</filename></link>
                     class, this variable points to the directory in which the
@@ -4440,7 +4284,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For recipes inheriting the
                     <link linkend='ref-classes-autotools'><filename>autotools</filename></link>
                     class, you can use <filename>EXTRA_AUTORECONF</filename> to
@@ -4463,7 +4306,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of additional features to include in an image.
                     When listing more than one feature, separate them with
                     a space.
@@ -4544,7 +4386,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies additional options for the image
                     creation command that has been specified in
                     <link linkend='var-IMAGE_CMD'><filename>IMAGE_CMD</filename></link>.
@@ -4564,7 +4405,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of recipes to build that do not provide packages
                     for installing into the root filesystem.
                 </para>
@@ -4592,7 +4432,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of subdirectories of
                     <filename>${</filename><link linkend='var-STAGING_BINDIR_NATIVE'><filename>STAGING_BINDIR_NATIVE</filename></link><filename>}</filename>
                     added to the beginning of the environment variable
@@ -4613,7 +4452,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Additional
                     <ulink url='https://cmake.org/overview/'>CMake</ulink>
                     options.
@@ -4630,7 +4468,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Additional <filename>configure</filename> script options.
                     See
                     <link linkend='var-PACKAGECONFIG_CONFARGS'><filename>PACKAGECONFIG_CONFARGS</filename></link>
@@ -4646,7 +4483,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Additional GNU <filename>make</filename> options.
                 </para>

@@ -4673,7 +4509,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-scons'><filename>scons</filename></link>
                     class, this variable specifies additional configuration
@@ -4689,7 +4524,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-extrausers'><filename>extrausers</filename></link>
                     class, this variable provides image level user and group
@@ -4731,7 +4565,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines one or more packages to include in an image when
                     a specific item is included in
                     <link linkend='var-IMAGE_FEATURES'><filename>IMAGE_FEATURES</filename></link>.
@@ -4766,7 +4599,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the base URL of the server and location within
                     the document-root that provides the metadata and
                     packages required by OPKG to support runtime package
@@ -4797,7 +4629,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The list of files and directories that are placed in a
                     package.
                     The
@@ -4868,7 +4699,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the file specification to match
                     <link linkend='var-SOLIBSDEV'><filename>SOLIBSDEV</filename></link>.
                     In other words, <filename>FILES_SOLIBSDEV</filename>
@@ -4892,7 +4722,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Extends the search path the OpenEmbedded build system uses
                     when looking for files and patches as it processes recipes
                     and append files.
@@ -4989,7 +4818,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A subset of <link linkend='var-OVERRIDES'><filename>OVERRIDES</filename></link>
                     used by the OpenEmbedded build system for creating
                     <link linkend='var-FILESPATH'><filename>FILESPATH</filename></link>.
@@ -5029,7 +4857,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The default set of directories the OpenEmbedded build
                     system uses when searching for patches and files.
                 </para>
@@ -5130,7 +4957,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Allows you to define your own file permissions settings table as part of
                     your configuration for the packaging process.
                     For example, suppose you need a consistent set of custom permissions for
@@ -5170,7 +4996,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-fontcache'><filename>fontcache</filename></link>
                     class, this variable specifies the runtime dependencies
@@ -5187,7 +5012,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-fontcache'><filename>fontcache</filename></link>
                     class, this variable identifies packages containing font
@@ -5207,7 +5031,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Forces the removal of the packages listed in
                     <filename>ROOTFS_RO_UNNEEDED</filename> during the
                     generation of the root filesystem.
@@ -5226,7 +5049,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The options to pass in
                     <filename><link linkend='var-TARGET_CFLAGS'>TARGET_CFLAGS</link></filename>
                     and <filename><link linkend='var-CFLAGS'>CFLAGS</link></filename>
@@ -5246,7 +5068,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Enables Position Independent Executables (PIE) within the
                     GNU C Compiler (GCC).
                     Enabling PIE in the GCC makes Return Oriented Programming
@@ -5270,7 +5091,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the default version of the GNU C Compiler (GCC)
                     used for compilation.
                     By default, <filename>GCCVERSION</filename> is set to
@@ -5292,7 +5112,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments to run the GNU Debugger.
                 </para>
             </glossdef>
@@ -5304,7 +5123,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory in which a local copy of a Git repository
                     is stored when it is cloned.
                 </para>
@@ -5317,7 +5135,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the list of GLIBC locales to generate should you
                     not wish to generate all LIBC locals, which can be time
                     consuming.
@@ -5346,7 +5163,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-useradd'><filename>useradd</filename></link>
                     class, this variable
@@ -5375,7 +5191,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-useradd'><filename>useradd</filename></link>
                     class, this variable
@@ -5399,7 +5214,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Configures the GNU GRand Unified Bootloader (GRUB) to have
                     graphics and serial in the boot menu.
                     Set this variable to "1" in your
@@ -5422,7 +5236,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Additional options to add to the GNU GRand Unified
                     Bootloader (GRUB) configuration.
                     Use a semi-colon character (<filename>;</filename>) to
@@ -5444,7 +5257,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the timeout before executing the default
                     <filename>LABEL</filename> in the GNU GRand Unified
                     Bootloader (GRUB).
@@ -5465,7 +5277,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-gtk-immodules-cache'><filename>gtk-immodules-cache</filename></link>
                     class, this variable specifies the packages that contain the
@@ -5485,7 +5296,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Website where more information about the software the recipe is building
                     can be found.
                 </para>
@@ -5499,7 +5309,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The name of the target architecture, which is normally
                     the same as
                     <link linkend='var-TARGET_ARCH'><filename>TARGET_ARCH</filename></link>.
@@ -5527,7 +5336,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific compiler flags that are
                     passed to the C compiler.
                 </para>
@@ -5561,7 +5369,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the name of the target operating system, which
                     is normally the same as the
                     <link linkend='var-TARGET_OS'><filename>TARGET_OS</filename></link>.
@@ -5579,7 +5386,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the prefix for the cross-compile toolchain.
                     <filename>HOST_PREFIX</filename> is normally the same as
                     <link linkend='var-TARGET_PREFIX'><filename>TARGET_PREFIX</filename></link>.
@@ -5593,7 +5399,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the system, including the architecture and the
                     operating system, for which the build is occurring
                     in the context of the current recipe.
@@ -5634,7 +5439,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list (filter) of tools on the build host
                     that should be allowed to be called from within build tasks.
                     Using this filter helps reduce the possibility of host
@@ -5658,7 +5462,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list (filter) of tools on the build host
                     that should be allowed to be called from within build tasks.
                     Using this filter helps reduce the possibility of host
@@ -5681,7 +5484,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the name of the vendor.
                     <filename>HOST_VENDOR</filename> is normally the same as
                     <link linkend='var-TARGET_VENDOR'><filename>TARGET_VENDOR</filename></link>.
@@ -5699,7 +5501,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Disables or enables the <filename>icecc</filename>
                     (Icecream) function.
                     For more information on this function and best practices
@@ -5728,7 +5529,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the <filename>icecc-create-env</filename> script
                     that you provide.
                     This variable is used by the
@@ -5754,7 +5554,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Extra options passed to the <filename>make</filename>
                     command during the
                     <link linkend='ref-tasks-compile'><filename>do_compile</filename></link>
@@ -5800,7 +5599,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The location of the <filename>icecc</filename> binary.
                     You can set this variable in your
                     <filename>local.conf</filename> file.
@@ -5819,7 +5617,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Identifies user classes that you do not want the
                     Icecream distributed compile support to consider.
                     This variable is used by the
@@ -5845,7 +5642,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Identifies user recipes that you do not want the
                     Icecream distributed compile support to consider.
                     This variable is used by the
@@ -5871,7 +5667,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Identifies user recipes that use an empty
                     <link linkend='var-PARALLEL_MAKE'><filename>PARALLEL_MAKE</filename></link>
                     variable that you want to force remote distributed
@@ -5892,7 +5687,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base name of image output files.
                     This variable defaults to the recipe name
                     (<filename>${</filename><link linkend='var-PN'><filename>PN</filename></link><filename>}</filename>).
@@ -5906,7 +5700,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list of files installed into the
                     boot partition when preparing an image using the Wic tool
                     with the <filename>bootimg-partition</filename> source
@@ -5963,7 +5756,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of classes that all images should inherit.
                     You typically use this variable to specify the list of
                     classes that register the different types of images
@@ -5992,7 +5784,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the command to create the image file for a
                     specific image type, which corresponds to the value set
                     set in
@@ -6026,7 +5817,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies one or more files that contain custom device
                     tables that are passed to the
                     <filename>makedevs</filename> command as part of creating
@@ -6050,7 +5840,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The primary list of features to include in an image.
                     Typically, you configure this variable in an image recipe.
                     Although you can use this variable from your
@@ -6086,7 +5875,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the formats the OpenEmbedded build system uses
                     during the build when creating the root filesystem.
                     For example, setting <filename>IMAGE_FSTYPES</filename>
@@ -6134,7 +5922,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Used by recipes to specify the packages to install into an
                     image through the
                     <link linkend='ref-classes-image'><filename>image</filename></link>
@@ -6220,7 +6007,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the list of locales to install into the image
                     during the root filesystem construction process.
                     The OpenEmbedded build system automatically splits locale
@@ -6262,7 +6048,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The manifest file for the image.
                     This file lists all the installed packages that make up
                     the image.
@@ -6299,7 +6084,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The name of the output image files minus the extension.
                     This variable is derived using the
                     <link linkend='var-IMAGE_BASENAME'><filename>IMAGE_BASENAME</filename></link>,
@@ -6320,7 +6104,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines a multiplier that the build system applies to the initial image
                     size for cases when the multiplier times the returned disk usage value
                     for the image is greater than the sum of
@@ -6366,7 +6149,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the package type (i.e. DEB, RPM, IPK, or TAR) used
                     by the OpenEmbedded build system.
                     The variable is defined appropriately by the
@@ -6418,7 +6200,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call once the
                     OpenEmbedded build system creates the final image
                     output files.
@@ -6446,7 +6227,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call before the
                     OpenEmbedded build system creates the final image
                     output files.
@@ -6474,7 +6254,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The location of the root filesystem while it is under
                     construction (i.e. during the
                     <link linkend='ref-tasks-rootfs'><filename>do_rootfs</filename></link>
@@ -6491,7 +6270,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the alignment for the output image file in
                     Kbytes.
                     If the size of the image is not a multiple of
@@ -6511,7 +6289,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines additional free disk space created in the image in Kbytes.
                     By default, this variable is set to "0".
                     This free disk space is added to the image after the build system determines
@@ -6546,7 +6323,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the size in Kbytes for the generated image.
                     The OpenEmbedded build system determines the final size for the generated
                     image using an algorithm that takes into account the initial disk space used
@@ -6596,7 +6372,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a dependency from one image type on another.
                     Here is an example from the
                     <link linkend='ref-classes-image-live'><filename>image-live</filename></link>
@@ -6626,7 +6401,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the complete list of supported image types
                     by default:
                     <literallayout class='monospaced'>
@@ -6686,7 +6460,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Helps define the recipe revision for recipes that share
                     a common <filename>include</filename> file.
                     You can think of this variable as part of the recipe revision
@@ -6752,7 +6525,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a space-separated list of license names
                     (as they would appear in
                     <link linkend='var-LICENSE'><filename>LICENSE</filename></link>)
@@ -6802,7 +6574,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Causes the named class or classes to be inherited globally.
                     Anonymous functions in the class or classes
                     are not executed for the
@@ -6826,7 +6597,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists classes that will be inherited at the
                     distribution level.
                     It is unlikely that you want to edit this variable.
@@ -6849,7 +6619,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Prevents the default dependencies, namely the C compiler
                     and standard C library (libc), from being added to
                     <link linkend='var-DEPENDS'><filename>DEPENDS</filename></link>.
@@ -6870,7 +6639,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Prevents the OpenEmbedded build system from splitting
                     out debug information during packaging.
                     By default, the build system splits out debugging
@@ -6901,7 +6669,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If set to "1", causes the build to not strip binaries in
                     resulting packages and prevents the
                     <filename>-dbg</filename> package from containing the
@@ -6925,7 +6692,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If set to "1", causes the build to not strip binaries in
                     the resulting sysroot.
                 </para>
@@ -6963,7 +6729,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the format for the output image of an initial
                     RAM filesystem (initramfs), which is used during boot.
                     Supported formats are the same as those supported by the
@@ -6992,7 +6757,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the
                     <link linkend='var-PROVIDES'><filename>PROVIDES</filename></link>
                     name of an image recipe that is used to build an initial
@@ -7060,7 +6824,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Controls whether or not the image recipe specified by
                     <link linkend='var-INITRAMFS_IMAGE'><filename>INITRAMFS_IMAGE</filename></link>
                     is run through an extra pass
@@ -7126,7 +6889,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The link name of the initial RAM filesystem image.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7156,7 +6918,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base name of the initial RAM filesystem image.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7181,7 +6942,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Indicates list of filesystem images to concatenate and use
                     as an initial RAM disk (<filename>initrd</filename>).
                 </para>
@@ -7201,7 +6961,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When building a "live" bootable image (i.e. when
                     <link linkend='var-IMAGE_FSTYPES'><filename>IMAGE_FSTYPES</filename></link>
                     contains "live"), <filename>INITRD_IMAGE</filename>
@@ -7224,7 +6983,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The filename of the initialization script as installed to
                     <filename>${sysconfdir}/init.d</filename>.
                 </para>
@@ -7242,7 +7000,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of the packages that contain initscripts.
                     If multiple packages are specified, you need to append the package name
                     to the other <filename>INITSCRIPT_*</filename> as an override.
@@ -7262,7 +7019,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the options to pass to <filename>update-rc.d</filename>.
                     Here is an example:
                     <literallayout class='monospaced'>
@@ -7300,7 +7056,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the QA checks to skip for a specific package
                     within a recipe.
                     For example, to skip the check for symbolic link
@@ -7327,7 +7082,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     By default, the <filename>tzdata</filename> recipe packages
                     an <filename>/etc/timezone</filename> file.
                     Set the <filename>INSTALL_TIMEZONE_FILE</filename>
@@ -7343,7 +7097,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When the IPK backend is in use and package management
                     is enabled on the target, you can use this variable to
                     set up <filename>opkg</filename> in the target image
@@ -7403,7 +7156,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the kernel architecture used when assembling
                     the configuration.
                     Architectures supported for this release are:
@@ -7430,7 +7182,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A regular expression used by the build process to explicitly
                     identify the kernel branch that is validated, patched,
                     and configured during a build.
@@ -7485,7 +7236,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When used with the
                     <link linkend='ref-classes-kernel-yocto'><filename>kernel-yocto</filename></link>
                     class, specifies an "in-tree" kernel configuration file
@@ -7541,7 +7291,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies an alternate kernel image type for creation in
                     addition to the kernel image type specified using the
                     <link linkend='var-KERNEL_IMAGETYPE'><filename>KERNEL_IMAGETYPE</filename></link>
@@ -7556,7 +7305,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the name of all of the build artifacts.
                     You can change the name of the artifacts by changing the
                     <filename>KERNEL_ARTIFACT_NAME</filename> variable.
@@ -7595,7 +7343,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of classes defining kernel image types that the
                     <link linkend='ref-classes-kernel'><filename>kernel</filename></link>
                     class should inherit.
@@ -7616,7 +7363,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the name of the generated Linux kernel device tree
                     (i.e. the <filename>.dtb</filename>) file.
                     <note>
@@ -7638,7 +7384,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The link name of the kernel device tree binary (DTB).
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7668,7 +7413,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base name of the kernel device tree binary (DTB).
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7693,7 +7437,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies additional <filename>make</filename>
                     command-line arguments the OpenEmbedded build system
                     passes on when compiling the kernel.
@@ -7707,7 +7450,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Includes additional kernel metadata.
                     In the OpenEmbedded build system, the default Board Support
                     Packages (BSPs)
@@ -7756,7 +7498,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The link name of the kernel flattened image tree (FIT) image.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7786,7 +7527,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base name of the kernel flattened image tree (FIT) image.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7811,7 +7551,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The link name for the kernel image.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7841,7 +7580,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the maximum size of the kernel image file in
                     kilobytes.
                     If <filename>KERNEL_IMAGE_MAXSIZE</filename> is set,
@@ -7872,7 +7610,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base name of the kernel image.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -7897,7 +7634,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The type of kernel to build for a device, usually set by the
                     machine configuration files and defaults to "zImage".
                     This variable is used
@@ -7919,7 +7655,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists kernel modules that need to be auto-loaded during
                     boot.
                     <note>
@@ -7973,7 +7708,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Provides a list of modules for which the OpenEmbedded
                     build system expects to find
                     <filename>module_conf_</filename><replaceable>modname</replaceable>
@@ -7992,7 +7726,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The location of the kernel sources.
                     This variable is set to the value of the
                     <link linkend='var-STAGING_KERNEL_DIR'><filename>STAGING_KERNEL_DIR</filename></link>
@@ -8024,7 +7757,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The location of the kernel sources.
                     This variable is set to the value of the
                     <link linkend='var-STAGING_KERNEL_DIR'><filename>STAGING_KERNEL_DIR</filename></link>
@@ -8056,7 +7788,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the version of the kernel as extracted from
                     <filename>version.h</filename> or
                     <filename>utsrelease.h</filename> within the kernel sources.
@@ -8074,7 +7805,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies whether the data referenced through
                     <link linkend='var-PKGDATA_DIR'><filename>PKGDATA_DIR</filename></link>
                     is needed or not.
@@ -8096,7 +7826,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Provides a short description of a configuration fragment.
                     You use this variable in the <filename>.scc</filename>
                     file that describes a configuration fragment file.
@@ -8116,7 +7845,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The machine as known by the kernel.
                     Sometimes the machine name used by the kernel does not
                     match the machine name used by the OpenEmbedded build
@@ -8163,7 +7891,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the kernel type to be used in assembling the
                     configuration.
                     The linux-yocto recipes define "standard", "tiny",
@@ -8193,7 +7920,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Provides a list of targets for automatic configuration.
                 </para>

@@ -8211,7 +7937,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists the layers, separated by spaces, on which this
                     recipe depends.
                     Optionally, you can specify a specific layer version for a
@@ -8242,7 +7967,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When used inside the <filename>layer.conf</filename> configuration
                     file, this variable provides the path of the current layer.
                     This variable is not available outside of <filename>layer.conf</filename>
@@ -8257,7 +7981,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists the layers, separated by spaces, recommended for
                     use with this layer.
                 </para>
@@ -8290,7 +8013,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists the versions of the
                     <link linkend='oe-core'>OpenEmbedded-Core</link> for which
                     a layer is compatible.
@@ -8337,7 +8059,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Optionally specifies the version of a layer as a single number.
                     You can use this within
                     <link linkend='var-LAYERDEPENDS'><filename>LAYERDEPENDS</filename></link>
@@ -8356,7 +8077,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments used to run the
                     linker.
                 </para>
@@ -8369,7 +8089,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the linker.
                     This variable is exported to an environment
                     variable and thus made visible to the software being
@@ -8405,7 +8124,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the lead (or primary) compiled library file
                     (i.e. <filename>.so</filename>) that the
                     <link linkend='ref-classes-debian'><filename>debian</filename></link>
@@ -8426,7 +8144,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Checksums of the license text in the recipe source code.
                 </para>

@@ -8455,7 +8172,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The list of source licenses for the recipe.
                     Follow these rules:
                     <itemizedlist>
@@ -8520,7 +8236,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                         Setting <filename>LICENSE_CREATE_PACKAGE</filename>
                         to "1" causes the OpenEmbedded build system to create
                         an extra package (i.e.
@@ -8563,7 +8278,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies additional flags for a recipe you must
                     whitelist through
                     <link linkend='var-LICENSE_FLAGS_WHITELIST'><filename>LICENSE_FLAGS_WHITELIST</filename></link>
@@ -8591,7 +8305,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists license flags that when specified in
                     <link linkend='var-LICENSE_FLAGS'><filename>LICENSE_FLAGS</filename></link>
                     within a recipe should not prevent that recipe from being
@@ -8611,7 +8324,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Path to additional licenses used during the build.
                     By default, the OpenEmbedded build system uses <filename>COMMON_LICENSE_DIR</filename>
                     to define the directory that holds common license text used during the build.
@@ -8630,7 +8342,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the kernel type to be used in assembling the
                     configuration.
                     The linux-yocto recipes define "standard", "tiny", and
@@ -8663,7 +8374,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The Linux version from <filename>kernel.org</filename>
                     on which the Linux kernel image being built using the
                     OpenEmbedded build system is based.
@@ -8694,7 +8404,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A string extension compiled into the version
                     string of the Linux kernel built with the OpenEmbedded
                     build system.
@@ -8727,7 +8436,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the directory to which the OpenEmbedded build
                     system writes overall log files.
                     The default directory is <filename>${TMPDIR}/log</filename>.
@@ -8751,7 +8459,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the target device for which the image is built.
                     You define <filename>MACHINE</filename> in the
                     <filename>local.conf</filename> file found in the
@@ -8806,7 +8513,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the name of the machine-specific architecture.
                     This variable is set automatically from
                     <link linkend='var-MACHINE'><filename>MACHINE</filename></link>
@@ -8824,7 +8530,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of required machine-specific packages to install as part of
                     the image being built.
                     The build process depends on these packages being present.
@@ -8861,7 +8566,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of recommended machine-specific packages to install as part of
                     the image being built.
                     The build process does not depend on these packages being present.
@@ -8925,7 +8629,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of machine-specific packages to install as part of the
                     image being built that are not essential for the machine to boot.
                     However, the build process for more fully-featured images
@@ -8971,7 +8674,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of machine-specific packages to install as part of the
                     image being built that are not essential for booting the machine.
                     The image being built has no build dependency on this list of packages.
@@ -9016,7 +8718,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the list of hardware features the
                     <link linkend='var-MACHINE'><filename>MACHINE</filename></link> is capable
                     of supporting.
@@ -9043,7 +8744,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Features to be added to
                     <filename><link linkend='var-MACHINE_FEATURES'>MACHINE_FEATURES</link></filename>
                     if not also present in
@@ -9067,7 +8767,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Features from
                     <filename><link linkend='var-MACHINE_FEATURES_BACKFILL'>MACHINE_FEATURES_BACKFILL</link></filename>
                     that should not be backfilled (i.e. added to
@@ -9085,7 +8784,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A colon-separated list of overrides that apply to the
                     current machine.
                     By default, this list includes the value of
@@ -9126,7 +8824,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The email address of the distribution maintainer.
                 </para>
             </glossdef>
@@ -9138,7 +8835,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies additional paths from which the OpenEmbedded
                     build system gets source code.
                     When the build system searches for source code, it first
@@ -9167,7 +8863,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a prefix has been added to
                     <link linkend='var-PN'><filename>PN</filename></link> to create a special version
                     of a recipe or package (i.e. a Multilib version).
@@ -9219,7 +8914,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable has been replaced by the
                     <filename>KERNEL_MODULE_AUTOLOAD</filename> variable.
                     You should replace all occurrences of
@@ -9248,7 +8942,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies
                     <ulink url='http://linux.die.net/man/5/modprobe.d'><filename>modprobe.d</filename></ulink>
                     syntax lines for inclusion in the
@@ -9309,7 +9002,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Controls creation of the <filename>modules-*.tgz</filename>
                     file.
                     Set this variable to "0" to disable creation of this
@@ -9325,7 +9017,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The link name of the kernel module tarball.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -9355,7 +9046,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base name of the kernel module tarball.
                     This variable is set in the
                     <filename>meta/classes/kernel-artifact-names.bbclass</filename>
@@ -9382,7 +9072,6 @@
             <glossdef>
                 <para role="glossdeffirst">
 -->
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
 <!--
                     Serves the same purpose as
                     <link linkend='var-MULTIMACH_TARGET_SYS'><filename>MULTIMACH_TARGET_SYS</filename></link>,
@@ -9409,7 +9098,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Uniquely identifies the type of the target system for
                     which packages are being built.
                     This variable allows output for different types of target
@@ -9448,7 +9136,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A string identifying the host distribution.
                     Strings consist of the host distributor ID
                     followed by the release, as reported by the
@@ -9478,7 +9165,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments to run
                     <filename>nm</filename>.
                 </para>
@@ -9491,7 +9177,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Avoids QA errors when you use a non-common, non-CLOSED
                     license in a recipe.
                     Packages exist, such as the linux-firmware package, with
@@ -9525,7 +9210,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Prevents installation of all "recommended-only" packages.
                     Recommended-only packages are packages installed only
                     through the
@@ -9586,7 +9270,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Disables auto package from splitting
                     <filename>.debug</filename> files. If a recipe requires
                     <filename>FILES_${PN}-dbg</filename> to be set manually,
@@ -9612,7 +9295,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments to run
                     <filename>objcopy</filename>.
                 </para>
@@ -9625,7 +9307,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments to run
                     <filename>objdump</filename>.
                 </para>
@@ -9638,7 +9319,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-binconfig'><filename>binconfig</filename></link>
                     class, this variable
@@ -9672,7 +9352,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     An internal variable used to tell the OpenEmbedded build
                     system what Python modules to import for every Python
                     function run by the system.
@@ -9691,7 +9370,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The name of the build environment setup script for the
                     purposes of setting up the environment within the
                     extensible SDK.
@@ -9713,7 +9391,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Controls how the OpenEmbedded build system spawns
                     interactive terminals on the host development system
                     (e.g. using the BitBake command with the
@@ -9745,7 +9422,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory from which the top-level build environment
                     setup script is sourced.
                     The Yocto Project provides a top-level build environment
@@ -9769,7 +9445,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Declares the oldest version of the Linux kernel that the
                     produced binaries must support.
                     This variable is passed into the build of the Embedded
@@ -9792,7 +9467,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A colon-separated list of overrides that currently apply.
                     Overrides are a BitBake mechanism that allows variables to
                     be selectively overridden at the end of parsing.
@@ -9856,7 +9530,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The recipe name and version.
                     <filename>P</filename> is comprised of the following:
                     <literallayout class='monospaced'>
@@ -9872,7 +9545,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The architecture of the resulting package or packages.
                 </para>

@@ -9908,7 +9580,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of architectures compatible with
                     the target machine.
                     This variable is set automatically and should not
@@ -9928,7 +9599,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Enables easily adding packages to
                     <filename><link linkend='var-PACKAGES'>PACKAGES</link></filename>
                     before <filename>${<link linkend='var-PN'>PN</link>}</filename>
@@ -9944,7 +9614,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable, which is set in the
                     <filename>local.conf</filename> configuration file found in
                     the <filename>conf</filename> folder of the
@@ -9994,7 +9663,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Determines how to split up the binary and debug information
                     when creating <filename>*-dbg</filename> packages to be
                     used with the GNU Project Debugger (GDB).
@@ -10059,7 +9727,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Prevents specific packages from being installed when
                     you are installing complementary packages.
                 </para>
@@ -10085,7 +9752,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists packages that should not be installed into an image.
                     For example:
                     <literallayout class='monospaced'>
@@ -10137,7 +9803,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the list of architectures compatible with the device CPU.
                     This variable is useful when you build for several different devices that use
                     miscellaneous processors such as XScale and ARM926-EJS.
@@ -10151,7 +9816,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Optionally specifies the package architectures used as
                     part of the package feed URIs during the build.
                     When used, the <filename>PACKAGE_FEED_ARCHS</filename>
@@ -10206,7 +9870,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the base path used when constructing package feed
                     URIs.
                     The <filename>PACKAGE_FEED_BASE_PATHS</filename> variable
@@ -10253,7 +9916,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the front portion of the package feed URI
                     used by the OpenEmbedded build system.
                     Each final package feed URI is comprised of
@@ -10298,7 +9960,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The final list of packages passed to the package manager
                     for installation into the image.
                 </para>
@@ -10333,7 +9994,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of packages the OpenEmbedded build
                     system attempts to install when creating an image.
                     If a listed package fails to install, the build system
@@ -10349,7 +10009,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions run to pre-process the
                     <link linkend='var-PKGD'><filename>PKGD</filename></link>
                     directory prior to splitting the files out to individual
@@ -10364,7 +10023,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of dependencies for post-installation and
                     pre-installation scripts on native/cross tools.
                     If your post-installation or pre-installation script can
@@ -10389,7 +10047,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable provides a means of enabling or disabling
                     features of a recipe on a per-recipe basis.
                     <filename>PACKAGECONFIG</filename> blocks are defined
@@ -10528,7 +10185,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A space-separated list of configuration options generated
                     from the
                     <link linkend='var-PACKAGECONFIG'><filename>PACKAGECONFIG</filename></link>
@@ -10559,7 +10215,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For recipes inheriting the
                     <link linkend='ref-classes-packagegroup'><filename>packagegroup</filename></link>
                     class, setting
@@ -10580,7 +10235,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The list of packages the recipe creates.
                     The default value is the following:
                     <literallayout class='monospaced'>
@@ -10621,7 +10275,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A promise that your recipe satisfies runtime dependencies
                     for optional modules that are found in other recipes.
                     <filename>PACKAGES_DYNAMIC</filename>
@@ -10664,7 +10317,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions run to perform additional
                     splitting of files into individual packages.
                     Recipes can either prepend to this variable or prepend
@@ -10686,7 +10338,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Extra options passed to the <filename>make</filename>
                     command during the
                     <link linkend='ref-tasks-compile'><filename>do_compile</filename></link>
@@ -10743,7 +10394,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Extra options passed to the
                     <filename>make install</filename> command during the
                     <link linkend='ref-tasks-install'><filename>do_install</filename></link>
@@ -10780,7 +10430,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Determines the action to take when a patch fails.
                     You can set this variable to one of two values: "noop" and
                     "user".
@@ -10808,7 +10457,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the utility used to apply patches for a recipe
                     during the
                     <link linkend='ref-tasks-patch'><filename>do_patch</filename></link>
@@ -10839,7 +10487,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The epoch of the recipe.
                     By default, this variable is unset.
                     The variable is used to make upgrades possible when the
@@ -10861,7 +10508,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the recipe or package name and includes all version and revision
                     numbers (i.e. <filename>glibc-2.13-r20+svnr15508/</filename> and
                     <filename>bash-4.2-r1/</filename>).
@@ -10879,7 +10525,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-pixbufcache'><filename>pixbufcache</filename></link>
                     class, this variable identifies packages that contain
@@ -10900,7 +10545,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The name of the resulting package created by the
                     OpenEmbedded build system.
                     <note>
@@ -10924,7 +10568,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The path to <filename>pkg-config</filename> files for the
                     current build context.
                     <filename>pkg-config</filename> reads this variable
@@ -10939,7 +10582,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the destination directory for files to be
                     packaged before they are split into individual packages.
                     This directory defaults to the following:
@@ -10960,7 +10602,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to a shared, global-state directory that holds data
                     generated during the packaging process.
                     During the packaging process, the
@@ -10991,7 +10632,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the parent directory for files to be packaged
                     after they have been split into individual packages.
                     This directory defaults to the following:
@@ -11015,7 +10655,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to a temporary work area where the
                     <link linkend='ref-tasks-package'><filename>do_package</filename></link>
                     task saves package metadata.
@@ -11044,7 +10683,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The epoch of the package(s) built by the recipe.
                     By default, <filename>PKGE</filename> is set to
                     <link linkend='var-PE'><filename>PE</filename></link>.
@@ -11058,7 +10696,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The revision of the package(s) built by the recipe.
                     By default, <filename>PKGR</filename> is set to
                     <link linkend='var-PR'><filename>PR</filename></link>.
@@ -11072,7 +10709,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The version of the package(s) built by the
                     recipe.
                     By default, <filename>PKGV</filename> is set to
@@ -11087,7 +10723,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable can have two separate functions depending on the context: a recipe
                     name or a resulting package name.
                 </para>
@@ -11124,7 +10759,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists recipes you do not want the OpenEmbedded build system
                     to build.
                     This variable works in conjunction with the
@@ -11151,7 +10785,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call once the
                     OpenEmbedded build system has created the host part of
                     the SDK.
@@ -11180,7 +10813,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call once the
                     OpenEmbedded build system has created the target part of
                     the SDK.
@@ -11209,7 +10841,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The revision of the recipe. The default value for this
                     variable is "r0".
                     Subsequent revisions of the recipe conventionally have the
@@ -11265,7 +10896,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If multiple recipes provide the same item, this variable
                     determines which recipe is preferred and thus provides
                     the item (i.e. the preferred provider).
@@ -11315,7 +10945,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If multiple versions of recipes exist, this
                     variable determines which version is given preference.
                     You must always suffix the variable with the
@@ -11407,7 +11036,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies additional paths from which the OpenEmbedded
                     build system gets source code.
                     When the build system searches for source code, it first
@@ -11456,7 +11084,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Indicates the importance of a package.
                 </para>

@@ -11482,7 +11109,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies libraries installed within a recipe that
                     should be ignored by the OpenEmbedded build system's
                     shared library resolver.
@@ -11524,7 +11150,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of aliases by which a particular recipe can be
                     known.
                     By default, a recipe's own
@@ -11613,7 +11238,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The network based
                     <link linkend='var-PR'><filename>PR</filename></link>
                     service host and port.
@@ -11643,7 +11267,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies whether or not
                     <ulink url='&YOCTO_DOCS_DEV_URL;#testing-packages-with-ptest'>Package Test</ulink>
                     (ptest) functionality is enabled when building a recipe.
@@ -11662,7 +11285,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The version of the recipe.
                     The version is normally extracted from the recipe filename.
                     For example, if the recipe is named
@@ -11688,7 +11310,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When used by recipes that inherit the
                     <link linkend='ref-classes-distutils3'><filename>distutils3</filename></link>,
                     <link linkend='ref-classes-setuptools3'><filename>setuptools3</filename></link>,
@@ -11724,7 +11345,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When used by recipes that inherit the
                     <link linkend='ref-classes-distutils3'><filename>distutils3</filename></link>,
                     <link linkend='ref-classes-setuptools3'><filename>setuptools3</filename></link>,
@@ -11760,7 +11380,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments to run
                     <filename>ranlib</filename>.
                 </para>
@@ -11773,7 +11392,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The list of packages that conflict with packages.
                     Note that packages will not be installed if conflicting
                     packages are not first removed.
@@ -11822,7 +11440,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists runtime dependencies of a package.
                     These dependencies are other packages that must be
                     installed in order for the package to function correctly.
@@ -11985,7 +11602,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-distro_features_check'><filename>distro_features_check</filename></link>
                     class, this
@@ -12008,7 +11624,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     With <filename>rm_work</filename> enabled, this
                     variable specifies a list of recipes whose work directories
                     should not be removed.
@@ -12024,7 +11639,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the root home directory.
                     By default, this directory is set as follows in the
                     BitBake configuration file:
@@ -12061,7 +11675,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Indicates a filesystem image to include as the root
                     filesystem.
                 </para>
@@ -12081,7 +11694,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call after the
                     OpenEmbedded build system has installed packages.
                     You can specify functions separated by semicolons:
@@ -12108,7 +11720,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call once the
                     OpenEmbedded build system has created the root filesystem.
                     You can specify functions separated by semicolons:
@@ -12135,7 +11746,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call after the
                     OpenEmbedded build system has removed unnecessary
                     packages.
@@ -12168,7 +11778,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call before the
                     OpenEmbedded build system has created the root filesystem.
                     You can specify functions separated by semicolons:
@@ -12195,7 +11804,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of package name aliases that a package also provides.
                     These aliases are useful for satisfying runtime dependencies
                     of other packages both during the build and on the target
@@ -12224,7 +11832,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of packages that extends the usability of a package
                     being built.
                     The package being built does not depend on this list of
@@ -12317,7 +11924,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of packages replaced by a package.
                     The package manager uses this variable to determine which
                     package should be installed to replace other package(s)
@@ -12373,7 +11979,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of additional packages that you can suggest for
                     installation by the package manager at the time a package
                     is installed.
@@ -12402,7 +12007,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The location in the
                     <link linkend='build-directory'>Build Directory</link>
                     where unpacked recipe source code resides.
@@ -12455,7 +12059,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of command-line utilities that should be
                     checked for during the initial sanity checking process when
                     running BitBake.
@@ -12471,7 +12074,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of the host distribution identifiers that the
                     build system has been tested against.
                     Identifiers consist of the host distributor ID
@@ -12496,7 +12098,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The target architecture for the SDK.
                     Typically, you do not directly set this variable.
                     Instead, use
@@ -12511,7 +12112,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory set up and used by the
                     <link linkend='ref-classes-populate-sdk'><filename>populate_sdk_base</filename></link>
                     class to which the SDK is deployed.
@@ -12530,7 +12130,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The parent directory used by the OpenEmbedded build system
                     when creating SDK output.
                     The
@@ -12556,7 +12155,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Controls whether or not shared state artifacts are copied
                     into the extensible SDK.
                     The default value of "full" copies all of the required
@@ -12580,7 +12178,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The manifest file for the host part of the SDK.
                     This file lists all the installed packages that make up
                     the host part of the SDK.
@@ -12613,7 +12210,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When set to "1", specifies to include the packagedata for
                     all recipes in the "world" target in the extensible SDK.
                     Including this data allows the
@@ -12638,7 +12234,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When set to "1", specifies to include the toolchain in the
                     extensible SDK.
                     Including the toolchain is useful particularly when
@@ -12665,7 +12260,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of classes to remove from the
                     <link linkend='var-INHERIT'><filename>INHERIT</filename></link>
                     value globally within the extensible SDK configuration.
@@ -12699,7 +12293,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of variables not allowed through from the
                     OpenEmbedded build system configuration into the extensible
                     SDK configuration.
@@ -12743,7 +12336,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of variables allowed through from the OpenEmbedded
                     build system configuration into the extensible SDK
                     configuration.
@@ -12779,7 +12371,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The base name for SDK output files.
                     The name is derived from the
                     <link linkend='var-DISTRO'><filename>DISTRO</filename></link>,
@@ -12802,7 +12393,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the operating system for which the SDK
                     will be built.
                     The default value is the value of
@@ -12817,7 +12407,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The location used by the OpenEmbedded build system when
                     creating SDK output.
                     The
@@ -12847,7 +12436,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of architectures compatible with
                     the SDK machine.
                     This variable is set automatically and should not
@@ -12867,7 +12455,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of functions to call once the
                     OpenEmbedded build system creates the SDK.
                     You can specify functions separated by semicolons:
@@ -12895,7 +12482,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The toolchain binary prefix used for
                     <filename>nativesdk</filename> recipes.
                     The OpenEmbedded build system uses the
@@ -12913,7 +12499,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of shared state tasks added to the extensible SDK.
                     By default, the following tasks are added:
                     <literallayout class='monospaced'>
@@ -12940,7 +12525,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the system, including the architecture and the
                     operating system, for which the SDK will be built.
                 </para>
@@ -12964,7 +12548,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The manifest file for the target part of the SDK.
                     This file lists all the installed packages that make up
                     the target part of the SDK.
@@ -12997,7 +12580,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of targets to install from shared state as part of
                     the standard or extensible SDK installation.
                     The default value is "${PN}" (i.e. the image from which
@@ -13017,7 +12599,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The title to be printed when running the SDK installer.
                     By default, this title is based on the
                     <link linkend='var-DISTRO_NAME'><filename>DISTRO_NAME</filename></link>
@@ -13050,7 +12631,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     An optional URL for an update server for the extensible
                     SDK.
                     If set, the value is used as the default update server when
@@ -13066,7 +12646,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the name of the SDK vendor.
                 </para>
             </glossdef>
@@ -13078,7 +12657,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the version of the SDK.
                     The distribution configuration file (e.g.
                     <filename>/meta-poky/conf/distro/poky.conf</filename>)
@@ -13104,7 +12682,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The default installation directory for the Extensible SDK.
                     By default, this directory is based on the
                     <link linkend='var-DISTRO'><filename>DISTRO</filename></link>
@@ -13134,7 +12711,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Equivalent to
                     <filename><link linkend='var-IMAGE_FEATURES'>IMAGE_FEATURES</link></filename>.
                     However, this variable applies to the SDK generated from an
@@ -13152,7 +12728,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The machine for which the SDK is built.
                     In other words, the SDK is built such that it
                     runs on the target you specify with the
@@ -13184,7 +12759,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the path offered to the user for installation
                     of the SDK that is generated by the OpenEmbedded build
                     system.
@@ -13202,7 +12776,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The full path to the sysroot used for cross-compilation
                     within an SDK as it will be when installed into the
                     default
@@ -13217,7 +12790,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The section in which packages should be categorized.
                     Package management utilities can make use of this variable.
                 </para>
@@ -13230,7 +12802,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the optimization flags passed to the C compiler
                     when building for the target.
                     The flags are passed through the default value of the
@@ -13255,7 +12826,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines a serial console (TTY) to enable using
                     <ulink url='https://en.wikipedia.org/wiki/Getty_(Unix)'>getty</ulink>.
                     Provide a value that specifies the baud rate followed by
@@ -13281,7 +12851,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines a serial console (TTY) to enable using
                     <ulink url='https://en.wikipedia.org/wiki/Getty_(Unix)'>getty</ulink>.
                     Provide a value that specifies the baud rate followed by
@@ -13300,7 +12869,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies serial consoles, which must be listed in
                     <link linkend='var-SERIAL_CONSOLES'><filename>SERIAL_CONSOLES</filename></link>,
                     to check against <filename>/proc/console</filename>
@@ -13326,7 +12894,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of recipe dependencies that should not be used to
                     determine signatures of tasks from one recipe when they
                     depend on tasks from another recipe.
@@ -13378,7 +12945,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of recipes that are completely stable and will
                     never change.
                     The ABI for the recipes in the list are presented by
@@ -13402,7 +12968,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the number of bits for the target system CPU.
                     The value should be either "32" or "64".
                 </para>
@@ -13415,7 +12980,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the endian byte order of the target system.
                     The value should be either "le" for little-endian or "be" for big-endian.
                 </para>
@@ -13428,7 +12992,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Enables removal of all files from the "Provides" section of
                     an RPM package.
                     Removal of these files is required for packages containing
@@ -13455,7 +13018,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Groups together machines based upon the same family
                     of SOC (System On Chip).
                     You typically set this variable in a common
@@ -13477,7 +13039,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the suffix for shared libraries used on the
                     target platform.
                     By default, this suffix is ".so.*" for all Linux-based
@@ -13499,7 +13060,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines the suffix for the development symbolic link
                     (symlink) for shared libraries on the target platform.
                     By default, this suffix is ".so" for Linux-based
@@ -13521,7 +13081,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When you are fetching files to create a mirror of sources
                     (i.e. creating a source mirror), setting
                     <filename>SOURCE_MIRROR_FETCH</filename> to "1" in your
@@ -13553,7 +13112,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Defines your own
                     <link linkend='var-PREMIRRORS'><filename>PREMIRRORS</filename></link>
                     from which to first fetch source before attempting to fetch
@@ -13584,7 +13142,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Maps commonly used license names to their SPDX counterparts
                     found in <filename>meta/files/common-licenses/</filename>.
                     For the default <filename>SPDXLICENSEMAP</filename>
@@ -13606,7 +13163,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of prefixes for <link linkend='var-PN'><filename>PN</filename></link> used by the
                     OpenEmbedded build system to create variants of recipes or packages.
                     The list specifies the prefixes to strip off during certain circumstances
@@ -13621,7 +13177,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The file type for the Secondary Program Loader (SPL).
                     Some devices use an SPL from which to boot (e.g. the
                     BeagleBone development board).
@@ -13663,7 +13218,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The list of source files - local or remote.
                     This variable tells the OpenEmbedded build system which bits
                     to pull in for the build and how to pull them in.
@@ -13855,7 +13409,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     By default, the OpenEmbedded build system automatically detects whether
                     <filename><link linkend='var-SRC_URI'>SRC_URI</link></filename>
                     contains files that are machine-specific.
@@ -13872,7 +13425,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The date of the source code used to build the package.
                     This variable applies only if the source was fetched from a Source Code Manager (SCM).
                 </para>
@@ -13885,7 +13437,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Returns the version string of the current package.
                     This string is used to help define the value of
                     <link linkend='var-PV'><filename>PV</filename></link>.
@@ -13923,7 +13474,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The revision of the source code used to build the package.
                     This variable applies to Subversion, Git, Mercurial, and
                     Bazaar only.
@@ -13953,7 +13503,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory for the shared state cache.
                 </para>
             </glossdef>
@@ -13965,7 +13514,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If set to "1", allows fetches from
                     mirrors that are specified in
                     <link linkend='var-SSTATE_MIRRORS'><filename>SSTATE_MIRRORS</filename></link>
@@ -13988,7 +13536,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Configures the OpenEmbedded build system to search other
                     mirror locations for prebuilt cache data objects before
                     building out the data.
@@ -14049,7 +13596,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Controls the list of files the OpenEmbedded build system
                     scans for hardcoded installation paths. The variable uses a
                     space-separated list of filenames (not paths) with standard
@@ -14084,7 +13630,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/lib</filename>
                     subdirectory of the sysroot directory for the
                     build host.
@@ -14098,7 +13643,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/lib</filename>
                     subdirectory of the sysroot directory for the target
                     for which the current recipe is being built
@@ -14113,7 +13657,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the
                     <filename>/usr/bin</filename> subdirectory of the
                     sysroot directory for the target for which the current
@@ -14129,7 +13672,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the directory containing binary
                     configuration scripts.
                     These scripts provide configuration information for
@@ -14155,7 +13697,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the
                     <filename>/usr/bin</filename> subdirectory of the
                     sysroot directory for the build host.
@@ -14169,7 +13710,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                 <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                      Specifies the path to the <filename>/usr/share</filename>
                      subdirectory of the sysroot directory for the target
                      for which the current recipe is being built
@@ -14184,7 +13724,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/usr/share</filename>
                     subdirectory of the sysroot directory for the build host.
                 </para>
@@ -14197,7 +13736,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Helps construct the <filename>recipe-sysroots</filename>
                     directory, which is used during packaging.
                 </para>
@@ -14236,7 +13774,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the sysroot directory for the system
                     on which the component is built to run (the system that
                     hosts the component).
@@ -14307,7 +13844,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the sysroot directory used when
                     building components that run on the build host itself.
                 </para>
@@ -14320,7 +13856,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the sysroot used for the system for
                     which the component generates code.
                     For components that do not generate code, which is the
@@ -14352,7 +13887,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/etc</filename>
                     subdirectory of the sysroot directory for the
                     build host.
@@ -14366,7 +13900,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/usr</filename>
                     subdirectory of the sysroot directory for the target
                     for which the current recipe is being built
@@ -14381,7 +13914,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the
                     <filename>/usr/include</filename> subdirectory of the
                     sysroot directory for the target for which the current
@@ -14397,7 +13929,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/usr/include</filename>
                     subdirectory of the sysroot directory for the build host.
                 </para>
@@ -14410,7 +13941,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the directory containing the kernel build
                     artifacts.
                     Recipes building software that needs to access kernel
@@ -14429,7 +13959,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory with kernel headers that are required to build out-of-tree
                     modules.
                 </para>
@@ -14442,7 +13971,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/usr/lib</filename>
                     subdirectory of the sysroot directory for the target for
                     which the current recipe is being built
@@ -14457,7 +13985,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the path to the <filename>/usr/lib</filename>
                     subdirectory of the sysroot directory for the build host.
                 </para>
@@ -14470,7 +13997,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the base path used to create recipe stamp files.
                     The path to an actual stamp file is constructed by evaluating this
                     string and then appending additional information.
@@ -14507,7 +14033,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the base directory in which the OpenEmbedded
                     build system places stamps.
                     The default directory is
@@ -14522,7 +14047,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The minimal command and arguments to run
                     <filename>strip</filename>, which is used to strip
                     symbols.
@@ -14536,7 +14060,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The short (72 characters or less) summary of the binary package for packaging
                     systems such as <filename>opkg</filename>, <filename>rpm</filename>, or
                     <filename>dpkg</filename>.
@@ -14554,7 +14077,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory in which files checked out of a Subversion
                     system are stored.
                 </para>
@@ -14567,7 +14089,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the kernel boot default console.
                     If you want to use a console other than the default,
                     set this variable in your recipe as follows where "X" is
@@ -14592,7 +14113,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Lists additional options to add to the syslinux file.
                     You need to set this variable in your recipe.
                     If you want to list multiple options, separate the options
@@ -14613,7 +14133,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the alternate serial port or turns it off.
                     To turn off serial, set this variable to an empty string
                     in your recipe.
@@ -14637,7 +14156,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     An <filename>.LSS</filename> file used as the background
                     for the VGA boot menu when you use the boot menu.
                     You need to set this variable in your recipe.
@@ -14658,7 +14176,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the alternate console=tty... kernel boot argument.
                     The variable's default value is set in the
                     <link linkend='ref-classes-syslinux'><filename>syslinux</filename></link>
@@ -14680,7 +14197,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the temporary directory under the work directory
                     (default
                     "<filename>${</filename><link linkend='var-WORKDIR'><filename>WORKDIR</filename></link><filename>}/sysroot-destdir</filename>")
@@ -14698,7 +14214,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Directories that are staged into the sysroot by the
                     <link linkend='ref-tasks-populate_sysroot'><filename>do_populate_sysroot</filename></link>
                     task.
@@ -14722,7 +14237,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Directories that are not staged into the sysroot by the
                     <link linkend='ref-tasks-populate_sysroot'><filename>do_populate_sysroot</filename></link>
                     task.
@@ -14752,7 +14266,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Extra directories staged into the sysroot by the
                     <link linkend='ref-tasks-populate_sysroot'><filename>do_populate_sysroot</filename></link>
                     task for <filename>-native</filename> recipes, in addition
@@ -14787,7 +14300,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of functions to execute after files are staged into
                     the sysroot.
                     These functions are usually used to apply additional
@@ -14803,7 +14315,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-systemd'><filename>systemd</filename></link>
                     class, this variable specifies whether the specified service
@@ -14833,7 +14344,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When
                     <link linkend='var-EFI_PROVIDER'><filename>EFI_PROVIDER</filename></link>
                     is set to "systemd-boot", the
@@ -14861,7 +14371,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When
                     <link linkend='var-EFI_PROVIDER'><filename>EFI_PROVIDER</filename></link>
                     is set to "systemd-boot", the
@@ -14891,7 +14400,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When
                     <link linkend='var-EFI_PROVIDER'><filename>EFI_PROVIDER</filename></link>
                     is set to "systemd-boot", the
@@ -14919,7 +14427,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-systemd'><filename>systemd</filename></link>
                     class, this variable locates the systemd unit files when
@@ -14949,7 +14456,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-systemd'><filename>systemd</filename></link>
                     class, this variable specifies the systemd service name for
@@ -14974,7 +14480,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When using
                     <ulink url='&YOCTO_DOCS_DEV_URL;#new-recipe-enabling-system-services'>SysVinit</ulink>,
                     specifies a space-separated list of the virtual terminals
@@ -15003,7 +14508,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable points to a directory were BitBake places
                     temporary files, which consist mostly of task logs and
                     scripts, when building a particular recipe.
@@ -15032,7 +14536,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The target machine's architecture.
                     The OpenEmbedded build system supports many
                     architectures.
@@ -15065,7 +14568,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific assembler flags for the
                     target system.
                     <filename>TARGET_AS_ARCH</filename> is initialized from
@@ -15085,7 +14587,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific C compiler flags for the
                     target system.
                     <filename>TARGET_CC_ARCH</filename> is initialized from
@@ -15109,7 +14610,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This is a specific kernel compiler flag for a CPU or
                     Application Binary Interface (ABI) tune.
                     The flag is used rarely and only for cases where a
@@ -15134,7 +14634,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C compiler when building
                     for the target.
                     When building in the target context,
@@ -15158,7 +14657,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C pre-processor
                     (i.e. to both the C and the C++ compilers) when building
                     for the target.
@@ -15183,7 +14681,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the C++ compiler when
                     building for the target.
                     When building in the target context,
@@ -15207,7 +14704,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the method for handling FPU code.
                     For FPU-less targets, which include most ARM CPUs, the variable must be
                     set to "soft".
@@ -15222,7 +14718,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific linker flags for the
                     target system.
                     <filename>TARGET_LD_ARCH</filename> is initialized from
@@ -15242,7 +14737,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the flags to pass to the linker when building
                     for the target.
                     When building in the target context,
@@ -15268,7 +14762,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the target's operating system.
                     The variable can be set to "linux" for glibc-based systems
                     (GNU C Library) and to "linux-musl" for musl libc.
@@ -15284,7 +14777,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the prefix used for the toolchain binary target
                     tools.
                 </para>
@@ -15320,7 +14812,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the system, including the architecture and the
                     operating system, for which the build is occurring in
                     the context of the current recipe.
@@ -15363,7 +14854,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the name of the target vendor.
                 </para>
             </glossdef>
@@ -15375,7 +14865,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the GNU standard C library
                     (<filename>libc</filename>) variant to use during the
                     build process.
@@ -15395,7 +14884,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a suffix to be appended onto the
                     <link linkend='var-TMPDIR'><filename>TMPDIR</filename></link>
                     value.
@@ -15426,7 +14914,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the toolchain selector.
                     <filename>TCMODE</filename> controls the characteristics
                     of the generated packages and images by telling the
@@ -15498,7 +14985,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The location the OpenEmbedded build system uses to export
                     tests when the
                     <link linkend='var-TEST_EXPORT_ONLY'><filename>TEST_EXPORT_ONLY</filename></link>
@@ -15518,7 +15004,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies to export the tests only.
                     Set this variable to "1" if you do not want to run the
                     tests but you want them to be exported in a manner that
@@ -15533,7 +15018,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Holds the SSH log and the boot log for QEMU machines.
                     The <filename>TEST_LOG_DIR</filename> variable defaults
                     to <filename>"${WORKDIR}/testimage"</filename>.
@@ -15552,7 +15036,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For automated hardware testing, specifies the command to
                     use to control the power of the target machine under test.
                     Typically, this command would point to a script that
@@ -15572,7 +15055,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For automated hardware testing, specifies additional
                     arguments to pass through to the command specified in
                     <link linkend='var-TEST_POWERCONTROL_CMD'><filename>TEST_POWERCONTROL_CMD</filename></link>.
@@ -15591,7 +15073,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The time in seconds allowed for an image to boot before
                     automated runtime tests begin to run against an
                     image.
@@ -15615,7 +15096,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For automated hardware testing, specifies the command
                     to use to connect to the serial console of the target
                     machine under test.
@@ -15641,7 +15121,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For automated hardware testing, specifies additional
                     arguments to pass through to the command specified in
                     <link linkend='var-TEST_SERIALCONTROL_CMD'><filename>TEST_SERIALCONTROL_CMD</filename></link>.
@@ -15660,7 +15139,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The IP address of the build machine (host machine).
                     This IP address is usually automatically detected.
                     However, if detection fails, this variable needs to be set
@@ -15683,7 +15161,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the target controller to use when running tests
                     against a test image.
                     The default controller to use is "qemu":
@@ -15744,7 +15221,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The IP address of your hardware under test.
                     The <filename>TEST_TARGET_IP</filename> variable has no
                     effect when
@@ -15774,7 +15250,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     An ordered list of tests (modules) to run against
                     an image when performing automated runtime testing.
                 </para>
@@ -15833,7 +15308,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Automatically runs the series of automated tests for
                     images when an image is successfully built.
                     Setting <filename>TESTIMAGE_AUTO</filename> to "1"
@@ -15874,7 +15348,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The directory in which the file BitBake is currently
                     parsing is located.
                     Do not manually set this variable.
@@ -15888,7 +15361,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The time the build was started.
                     Times appear using the hour, minute, and second (HMS)
                     format (e.g. "140159" for one minute and fifty-nine
@@ -15903,7 +15375,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable is the base directory the OpenEmbedded
                     build system uses for all build output and intermediate
                     files (other than the shared state cache).
@@ -15945,7 +15416,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable lists packages the OpenEmbedded build system
                     uses when building an SDK, which contains a
                     cross-development environment.
@@ -15987,7 +15457,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable defines the name used for the toolchain
                     output.
                     The
@@ -16013,7 +15482,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     This variable lists packages the OpenEmbedded build system
                     uses when it creates the target part of an SDK
                     (i.e. the part built for the target hardware), which
@@ -16046,7 +15514,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The top-level
                     <link linkend='build-directory'>Build Directory</link>.
                     BitBake automatically sets this variable when you
@@ -16062,7 +15529,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A sanitized version of
                     <link linkend='var-TARGET_ARCH'><filename>TARGET_ARCH</filename></link>.
                     This variable is used where the architecture is needed in
@@ -16084,7 +15550,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The GNU canonical architecture for a specific architecture
                     (i.e. <filename>arm</filename>,
                     <filename>armeb</filename>,
@@ -16143,7 +15608,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific assembler flags for
                     the target system.
                     The set of flags is based on the selected tune features.
@@ -16174,7 +15638,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific C compiler flags for
                     the target system.
                     The set of flags is based on the selected tune features.
@@ -16199,7 +15662,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies architecture-specific linker flags for
                     the target system.
                     The set of flags is based on the selected tune features.
@@ -16230,7 +15692,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Features used to "tune" a compiler for optimal use
                     given a specific processor.
                     The features are defined within the tune files and allow
@@ -16264,7 +15725,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The package architecture understood by the packaging
                     system to define the architecture, ABI, and tuning of
                     output packages.
@@ -16295,7 +15755,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     An underlying Application Binary Interface (ABI) used by
                     a particular tuning in a given toolchain layer.
                     Providers that use prebuilt libraries can use the
@@ -16323,7 +15782,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     If set, the OpenEmbedded system ignores the
                     <link linkend='var-TUNEABI_WHITELIST'><filename>TUNEABI_WHITELIST</filename></link>
                     variable.
@@ -16350,7 +15808,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A whitelist of permissible
                     <link linkend='var-TUNEABI'><filename>TUNEABI</filename></link>
                     values.
@@ -16378,7 +15835,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies CPU or Application Binary Interface (ABI)
                     tuning features that conflict with <replaceable>feature</replaceable>.
                 </para>
@@ -16404,7 +15860,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a valid CPU or Application Binary Interface (ABI)
                     tuning feature.
                     The specified feature is stored as a flag.
@@ -16434,7 +15889,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Configures the
                     <link linkend='var-UBOOT_MACHINE'><filename>UBOOT_MACHINE</filename></link>
                     and can also define
@@ -16477,7 +15931,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the entry point for the U-Boot image.
                     During U-Boot image creation, the
                     <filename>UBOOT_ENTRYPOINT</filename> variable is passed
@@ -16493,7 +15946,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the load address for the U-Boot image.
                     During U-Boot image creation, the
                     <filename>UBOOT_LOADADDRESS</filename> variable is passed
@@ -16509,7 +15961,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Appends a string to the name of the local version of the
                     U-Boot image.
                     For example, assuming the version of the U-Boot image
@@ -16529,7 +15980,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the value passed on the
                     <filename>make</filename> command line when building
                     a U-Boot image.
@@ -16553,7 +16003,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the target called in the
                     <filename>Makefile</filename>.
                     The default target is "all".
@@ -16567,7 +16016,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Points to the generated U-Boot extension.
                     For example, <filename>u-boot.sb</filename> has a
                     <filename>.sb</filename> extension.
@@ -16586,7 +16034,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the target used for building U-Boot.
                     The target is passed directly as part of the "make" command
                     (e.g. SPL and AIS).
@@ -16603,7 +16050,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a list of options that, if reported by the
                     configure script as being invalid, should not generate a
                     warning during the
@@ -16641,7 +16087,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     For recipes inheriting the
                     <link linkend='ref-classes-update-rc.d'><filename>update-rc.d</filename></link>
                     class, <filename>UPDATERCPN</filename> specifies
@@ -16664,7 +16109,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     You can perform a per-recipe check for what the latest
                     upstream source code version is by calling
                     <filename>bitbake -c checkpkg</filename> <replaceable>recipe</replaceable>.
@@ -16693,7 +16137,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Use the <filename>UPSTREAM_CHECK_REGEX</filename> variable
                     to specify a different regular expression instead of the
                     default one when the package checking system is parsing
@@ -16712,7 +16155,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     You can perform a per-recipe check for what the latest
                     upstream source code version is by calling
                     <filename>bitbake -c checkpkg</filename> <replaceable>recipe</replaceable>.
@@ -16736,7 +16178,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Determines if <filename>devtmpfs</filename> is used for
                     <filename>/dev</filename> population.
                     The default value used for <filename>USE_DEVFS</filename>
@@ -16761,7 +16202,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When using
                     <ulink url='&YOCTO_DOCS_DEV_URL;#new-recipe-enabling-system-services'>SysVinit</ulink>,
                     determines whether or not to run a
@@ -16787,7 +16227,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     A list of classes to globally inherit.
                     These classes are used by the OpenEmbedded build system
                     to enable extra features (e.g.
@@ -16815,7 +16254,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->

                     If set to <filename>error</filename>, forces the
                     OpenEmbedded build system to produce an error if the user
@@ -16875,7 +16313,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a password file to use for obtaining static
                     group identification (<filename>gid</filename>) values
                     when the OpenEmbedded build system adds a group to the
@@ -16911,7 +16348,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-useradd'><filename>useradd</filename></link>
                     class, this variable
@@ -16948,7 +16384,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When inheriting the
                     <link linkend='ref-classes-useradd'><filename>useradd</filename></link>
                     class, this variable
@@ -16979,7 +16414,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies a password file to use for obtaining static
                     user identification (<filename>uid</filename>) values
                     when the OpenEmbedded build system adds a user to the
@@ -17015,7 +16449,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     When set to "useradd-staticids", causes the
                     OpenEmbedded build system to base all user and group
                     additions on a static
@@ -17068,7 +16501,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the persistence of the target's
                     <filename>/var/log</filename> directory, which is used to
                     house postinstall target log files.
@@ -17093,7 +16525,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the quality assurance checks whose failures are
                     reported as warnings by the OpenEmbedded build system.
                     You set this variable in your distribution configuration
@@ -17177,7 +16608,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     The pathname of the work directory in which the OpenEmbedded
                     build system builds a recipe.
                     This directory is located within the
@@ -17239,7 +16669,6 @@
             </info>
             <glossdef>
                 <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the packages that should be installed to
                     provide an X server and drivers for the current machine,
                     assuming your image directly includes

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
