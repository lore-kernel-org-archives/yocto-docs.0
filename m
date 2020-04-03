Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.2221.1585875380913677866
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 17:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.93, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: EkG9xVLeT57/wxS7spFDHx1R3ha/Oqe690A7SBJ1udWuDDL7jP+4ohBMe+AIhzPVldwZesqPpc
 FnI8Orx9VzsQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 17:56:20 -0700
IronPort-SDR: 8irZfZK6YMr5heyFbox48oT7pwqedNS/TNAQ+PqlIbFxgLPS3rxwromOIlFcSd3mew/P1Cues4
 iDzrCglBqtTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,337,1580803200"; 
   d="scan'208";a="451129858"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2020 17:56:20 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 3/5] ref-manual: add install-buildtools and -extended
Date: Thu,  2 Apr 2020 17:55:55 -0700
Message-Id: <20200403005557.4708-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200403005557.4708-1-timothy.t.orling@linux.intel.com>
References: <20200403005557.4708-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add instructions to use 'install-buildtools' and
'buildtools-extended-tarball'.

Add gcc 5.0 requirement and call out how to
use above to prepare host development system.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 documentation/ref-manual/faq.xml              |   4 +-
 documentation/ref-manual/migration.xml        |   6 +-
 .../ref-manual/ref-system-requirements.xml    | 127 ++++++++++++++++--
 3 files changed, 120 insertions(+), 17 deletions(-)

diff --git a/documentation/ref-manual/faq.xml b/documentation/ref-manual/faq.xml
index 49ff86261..d94cb32a8 100644
--- a/documentation/ref-manual/faq.xml
+++ b/documentation/ref-manual/faq.xml
@@ -33,7 +33,7 @@
             <para id='faq-not-meeting-requirements'>
                 My development system does not meet the
                 required Git, tar, and Python versions.
-                In particular, I do not have Python 3.4.0 or greater.
+                In particular, I do not have Python 3.5.0 or greater.
                 Can I still use the Yocto Project?
             </para>
         </question>
@@ -43,7 +43,7 @@
                 system a couple different ways (i.e. building a tarball or
                 downloading a tarball).
                 See the
-                "<link linkend='required-git-tar-and-python-versions'>Required Git, tar, and Python Versions</link>"
+                "<link linkend='required-git-tar-python-and-gcc-versions'>Required Git, tar, Python and gcc Versions</link>"
                 section for steps on how to update your build tools.
             </para>
         </answer>
diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index 80a6acc95..03efc7be2 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -680,7 +680,7 @@
 
         <para>
             For more information on this requirement, see the
-            "<link linkend='required-git-tar-and-python-versions'>Required Git, tar, and Python Versions</link>"
+            "<link linkend='required-git-tar-python-and-gcc-versions'>Required Git, tar, Python and gcc Versions</link>"
             section.
         </para>
     </section>
@@ -1754,7 +1754,7 @@
             Git that meets this requirement, you can use the
             <filename>buildtools-tarball</filename> that does.
             See the
-            "<link linkend='required-git-tar-and-python-versions'>Required Git, tar, and Python Versions</link>"
+            "<link linkend='required-git-tar-python-and-gcc-versions'>Required Git, tar, Python and gcc Versions</link>"
             section for more information.
         </para>
     </section>
@@ -3215,7 +3215,7 @@
                     recent version, you can install the buildtools, which
                     will provide it.
                     See the
-                    "<link linkend='required-git-tar-and-python-versions'>Required Git, tar, and Python Versions</link>"
+                    "<link linkend='required-git-tar-python-and-gcc-versions'>Required Git, tar, Python and gcc Versions</link>"
                     section for more information on the buildtools tarball.
                     </para></listitem>
                 <listitem><para>
diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 6153117f1..2c019960f 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -315,8 +315,8 @@
         </section>
     </section>
 
-    <section id='required-git-tar-and-python-versions'>
-        <title>Required Git, tar, and Python Versions</title>
+    <section id='required-git-tar-python-and-gcc-versions'>
+        <title>Required Git, tar, Python and gcc Versions</title>
 
         <para>
             In order to use the build system, your host development system
@@ -337,6 +337,89 @@
             tarball or use BitBake to build the tarball.
         </para>
 
+        <para>
+            In addition, your host development system must meet the following
+            version requirement for gcc:
+            <itemizedlist>
+                <listitem><para>gcc 5.0 or greater</para></listitem>
+            </itemizedlist>
+        </para>
+
+        <para>
+            If your host development system does not meet this requirement,
+            you can resolve this by installing a <filename>buildtools-extended</filename>
+            tarball that contains additional tools, the equivalent of <filename>buildtools-essential</filename>.
+        </para>
+        <section id='installing-a-pre-built-buildtools-tarball-with-install-buildtools-script'>
+            <title>Installing a Pre-Built <filename>buildtools</filename> Tarball with <filename>install-buildtools</filename> script</title>
+
+            <para>
+                The <filename>install-buildtools</filename> script is the easiest
+                of the three methods by which you can get these tools. It downloads
+                a pre-built buildtools installer and automatically installs the tools
+                for you:
+            <orderedlist>
+                <listitem><para>
+                    Execute the <filename>install-buildtools</filename> script.
+                    Here is an example:
+                    <literallayout class='monospaced'>
+     $ cd poky
+     $ script/install-buildtools --without-extended-buildtools \
+       --base-url &YOCTO_DL_URL;/releases/yocto \
+       --release yocto-&DISTRO; \
+       --installer-version &DISTRO;
+                    </literallayout>
+                    <para>
+                        During execution, the buildtools tarball will be downloaded,
+                        the checksum of the download will be verified, the installer
+                        will be run for you, and some basic checks will be run to
+                        to make sure the installation is functional.
+                    </para>
+                    <para>
+                        To avoid the need of <filename>sudo</filename> privileges,
+                        the <filename>install-buildtools</filename> script will
+                        by default tell the installer to install in:
+                        <literallayout class='monospaced'>
+     <replaceable>/path/to/</replaceable>poky/buildtools
+                        </literallayout>
+                    </para>
+                    <para>
+                        If your host development system needs the additional tools
+                        provided in the <filename>buildtools-extended</filename>
+                        tarball, you can instead execute the
+                        <filename>install-buildtools</filename> script with the
+                        default parameters:
+                        <literallayout class='monospaced'>
+     $ cd poky
+     $ script/install-buildtools
+                        </literallayout>
+                    </para>
+                </para></listitem>
+                <listitem><para>
+                    Source the tools environment setup script by using a
+                    command like the following:
+                    <literallayout class='monospaced'>
+     $ source <replaceable>/path/to/</replaceable>poky/buildtools/environment-setup-x86_64-pokysdk-linux
+                    </literallayout>
+                    Of course, you need to supply your installation directory and be
+                    sure to use the right file (i.e. i586 or x86_64).
+                </para>
+                <para>
+                    After you have sourced the setup script,
+                    the tools are added to <filename>PATH</filename>
+                    and any other environment variables required to run the
+                    tools are initialized.
+                    The results are working versions versions of Git, tar,
+                    Python and <filename>chrpath</filename>. And in the case of
+                    the <filename>buildtools-extended</filename> tarball, additional
+                    working versions of tools including <filename>gcc</filename>,
+                    <filename>make</filename> and the other tools included in
+                    <filename>packagegroup-core-buildessential</filename>.
+                </para></listitem>
+            </orderedlist>
+            </para>
+        </section>
+
         <section id='downloading-a-pre-built-buildtools-tarball'>
             <title>Downloading a Pre-Built <filename>buildtools</filename> Tarball</title>
 
@@ -346,13 +429,17 @@
                 <orderedlist>
                     <listitem><para>
                         Locate and download the <filename>*.sh</filename> at
-                        <ulink url='&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;/buildtools/'></ulink>.
+                        <ulink url='&YOCTO_RELEASE_DL_URL;/buildtools/'></ulink>.
                         </para></listitem>
                     <listitem><para>
                         Execute the installation script.
-                        Here is an example:
+                        Here is an example for the traditional installer:
                         <literallayout class='monospaced'>
      $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
+                        </literallayout>
+                        Here is an example for the extended installer:
+                        <literallayout class='monospaced'>
+     $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
                         </literallayout>
                         During execution, a prompt appears that allows you to
                         choose the installation directory.
@@ -376,7 +463,11 @@
                         and any other environment variables required to run the
                         tools are initialized.
                         The results are working versions versions of Git, tar,
-                        Python and <filename>chrpath</filename>.
+                        Python and <filename>chrpath</filename>. And in the case of
+                        the <filename>buildtools-extended</filename> tarball, additional
+                        working versions of tools including <filename>gcc</filename>,
+                        <filename>make</filename> and the other tools included in
+                        <filename>packagegroup-core-buildessential</filename>.
                         </para></listitem>
                 </orderedlist>
             </para>
@@ -392,7 +483,7 @@
                 <filename>.sh</filename> file and then
                 take steps to transfer and run it on a
                 machine that does not meet the minimal Git, tar, and Python
-                requirements.
+                (or gcc) requirements.
             </para>
 
             <para>
@@ -410,6 +501,10 @@
                         <literallayout class='monospaced'>
      $ bitbake buildtools-tarball
                         </literallayout>
+                        or run the BitBake command to build the extended tarball:
+                        <literallayout class='monospaced'>
+                            $ bitbake buildtools-extended-tarball
+                        </literallayout>
                         <note>
                         The
                         <link linkend='var-SDKMACHINE'><filename>SDKMACHINE</filename></link>
@@ -423,21 +518,25 @@
                        subdirectory of the
                        <link linkend='build-directory'>Build Directory</link>.
                        The installer file has the string "buildtools"
-                       in the name.
+                       (or "buildtools-extended") in the name.
                        </para></listitem>
                    <listitem><para>
                        Transfer the <filename>.sh</filename> file from the
                        build host to the machine that does not meet the
-                       Git, tar, or Python requirements.
+                       Git, tar, or Python (or gcc) requirements.
                        </para></listitem>
                    <listitem><para>
                        On the machine that does not meet the requirements,
                        run the <filename>.sh</filename> file
                        to install the tools.
-                       Here is an example:
+                       Here is an example for the traditional installer:
                        <literallayout class='monospaced'>
      $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
                        </literallayout>
+                       Here is an example for the extended installer:
+                       <literallayout class='monospaced'>
+                           $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
+                       </literallayout>
                        During execution, a prompt appears that allows you to
                        choose the installation directory.
                        For example, you could choose the following:
@@ -449,10 +548,10 @@
                         Source the tools environment setup script by using a
                         command like the following:
                         <literallayout class='monospaced'>
-     $ source /home/<replaceable>your_username</replaceable>/buildtools/environment-setup-i586-poky-linux
+     $ source /home/<replaceable>your_username</replaceable>/buildtools/environment-setup-x86_64-poky-linux
                         </literallayout>
                         Of course, you need to supply your installation directory and be
-                        sure to use the right file (i.e. i585 or x86-64).
+                        sure to use the right file (i.e. i586 or x86_64).
                         </para>
                         <para>
                         After you have sourced the setup script,
@@ -460,7 +559,11 @@
                         and any other environment variables required to run the
                         tools are initialized.
                         The results are working versions versions of Git, tar,
-                        Python and <filename>chrpath</filename>.
+                        Python and <filename>chrpath</filename>. And in the case of
+                        the <filename>buildtools-extended</filename> tarball, additional
+                        working versions of tools including <filename>gcc</filename>,
+                        <filename>make</filename> and the other tools included in
+                        <filename>packagegroup-core-buildessential</filename>.
                         </para></listitem>
                 </orderedlist>
             </para>
-- 
2.24.0

