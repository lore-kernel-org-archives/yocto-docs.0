Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.22937.1581346287131902450
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
IronPort-SDR: r6XXCukyLBYG8GwqRnT6y5eCoDJgv1Cmo2P0dE1wUZiACY98299igS8xCJ6Cx778pvnfE7oICn
 7Sh0qp5lxKY1NAp+wD6lMK+zwpPTpW6JCNBeK/hUtNNgSNL9gtHA3q7GW/bNOy0WU+MsdfKMif
 gQpXFgBZ05/vVa6rUyYBjSorCrDSIUcQTJvy6Qz4KaiyjzfGd1dvXuQGOQsZF49vy51o7FG/r3
 RIuWClNZqy6qofTRp3G+e1MUS+EYRi78bky7hjhCbIiKoeTZo/uVua0ToeCn5aHCoLBYfHE1rN
 eT4=
X-IronPort-AV: E=Sophos;i="5.70,425,1574118000"; 
   d="scan'208";a="5258085"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [master][zeus][PATCH 4/5] ref-manual: Add a variable description for AVAILABLE_LICENSES
Date: Mon, 10 Feb 2020 15:51:20 +0100
Message-ID: <20200210145121.18307-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200210145121.18307-1-pkj@axis.com>
References: <20200210145121.18307-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index c8ece0c579..9e6d37ec0d 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -495,6 +495,30 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-AVAILABLE_LICENSES'><glossterm>AVAILABLE_LICENSES</glossterm>
+            <info>
+                AVAILABLE_LICENSES[doc] = "List of licenses found in the directories specified by COMMON_LICENSE_DIR and LICENSE_PATH."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+
+                    List of licenses found in the directories specified
+                    by <link linkend='var-COMMON_LICENSE_DIR'><filename>COMMON_LICENSE_DIR</filename></link>
+                    and <link linkend='var-LICENSE_PATH'><filename>LICENSE_PATH</filename></link>.
+
+                    <note>
+                        It is assumed that all changes
+                        to <filename>COMMON_LICENSE_DIR</filename>
+                        and <filename>LICENSE_PATH</filename> have been done
+                        before <filename>AVAILABLE_LICENSES</filename> is
+                        defined
+                        (in <link linkend='ref-classes-license'>license.bbclass</link>).
+                    </note>
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-AVAILTUNES'><glossterm>AVAILTUNES</glossterm>
             <info>
                 AVAILTUNES[doc] = "The list of defined CPU and Application Binary Interface (ABI) tunings (i.e.  "tunes") available for use by the OpenEmbedded build system."
-- 
2.21.1

