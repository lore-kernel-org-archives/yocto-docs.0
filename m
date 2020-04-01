Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.4354.1585711165256819085
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 20:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: kbQcdt4d3CGmfO8ceawyiV3BWrfie1sv1XYebjVv4YGDsIy/B//N1MrmKhiVMhvbKSnv+LLjQV
 Rv55xz76FBaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 20:19:32 -0700
IronPort-SDR: vXwQuL9A7+vvFQAHgxNIcCor7wv4BeE4wgmr/3sPZB64Xp4Kzb6uK4z7hHxLWNb5mBaBHfQtqz
 es46ek6BoVgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; 
   d="scan'208,217";a="395798530"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2020 20:19:32 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 3/3] ref-manual: split CentOS-7 and CentOS-8 reqs
Date: Tue, 31 Mar 2020 20:19:16 -0700
Message-Id: <20200401031916.38433-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200401031916.38433-1-timothy.t.orling@linux.intel.com>
References: <20200401031916.38433-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CentOS-7 has different requirements than the much
newer CentOS-8. Add a section for CentOS-8 and
make the old section CentOS-7 specific.

NOTE: at the time this was written, the 'fop'
package is not yet available in epel-8. As
a Fedora packager, that will change.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../ref-manual/ref-system-requirements.xml    | 68 ++++++++++++++++---
 1 file changed, 60 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 9c2198a76..043f7aec6 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -205,18 +205,18 @@
             </para>
         </section>
 
-        <section id='centos-packages'>
-            <title>CentOS Packages</title>
+        <section id='centos-7-packages'>
+            <title>CentOS-7 Packages</title>
 
             <para>
                 The following list shows the required packages by function
-                given a supported CentOS Linux distribution:
+                given a supported CentOS-7 Linux distribution:
                 <itemizedlist>
                     <listitem><para><emphasis>Essentials:</emphasis>
                         Packages needed to build an image for a headless
                         system:
                         <literallayout class='monospaced'>
-     $ sudo yum install &CENTOS_HOST_PACKAGES_ESSENTIAL;
+     $ sudo yum install &CENTOS7_HOST_PACKAGES_ESSENTIAL;
                         </literallayout>
                         <note><title>Notes</title>
                             <itemizedlist>
@@ -229,22 +229,74 @@
                                     Linux by default.
                                     You need to install these packages
                                     separately.
-                                    </para></listitem>
+                                </para></listitem>
                                 <listitem><para>
                                     The <filename>makecache</filename> command
                                     consumes additional Metadata from
                                     <filename>epel-release</filename>.
-                                    </para></listitem>
+                                </para></listitem>
                             </itemizedlist>
                         </note>
-                        </para></listitem>
+                    </para></listitem>
                     <listitem><para><emphasis>Documentation:</emphasis>
                         Packages needed if you are going to build out the
                         Yocto Project documentation manuals:
                         <literallayout class='monospaced'>
      $ sudo yum install docbook-style-dsssl docbook-style-xsl \
      docbook-dtds docbook-utils fop libxslt dblatex xmlto
-                        </literallayout></para></listitem>
+                        </literallayout>
+                    </para></listitem>
+                </itemizedlist>
+            </para>
+        </section>
+
+        <section id='centos-8-packages'>
+            <title>CentOS-8 Packages</title>
+
+            <para>
+                The following list shows the required packages by function
+                given a supported CentOS-8 Linux distribution:
+                <itemizedlist>
+                    <listitem><para><emphasis>Essentials:</emphasis>
+                        Packages needed to build an image for a headless
+                        system:
+                        <literallayout class='monospaced'>
+     $ sudo dnf install &CENTOS8_HOST_PACKAGES_ESSENTIAL;
+                        </literallayout>
+                        <note><title>Notes</title>
+                            <itemizedlist>
+                                <listitem><para>
+                                    Extra Packages for Enterprise Linux
+                                    (i.e. <filename>epel-release</filename>)
+                                    is a collection of packages from Fedora
+                                    built on RHEL/CentOS for easy installation
+                                    of packages not included in enterprise
+                                    Linux by default.
+                                    You need to install these packages
+                                    separately.
+                                </para></listitem>
+                                <listitem><para>
+                                    The <filename>PowerTools</filename> repo
+                                    provides additional packages such as
+                                    <filename>rpcgen</filename> and
+                                    <filename>texinfo</filename>.
+                                </para></listitem>
+                                <listitem><para>
+                                    The <filename>makecache</filename> command
+                                    consumes additional Metadata from
+                                    <filename>epel-release</filename>.
+                                </para></listitem>
+                            </itemizedlist>
+                        </note>
+                    </para></listitem>
+                    <listitem><para><emphasis>Documentation:</emphasis>
+                        Packages needed if you are going to build out the
+                        Yocto Project documentation manuals:
+                        <literallayout class='monospaced'>
+     $ sudo dnf install docbook-style-dsssl docbook-style-xsl \
+     docbook-dtds docbook-utils fop libxslt dblatex xmlto
+                        </literallayout>
+                    </para></listitem>
                 </itemizedlist>
             </para>
         </section>
-- 
2.24.0

