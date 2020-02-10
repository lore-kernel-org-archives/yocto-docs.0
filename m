Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.22937.1581346287131902450
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
IronPort-SDR: LFyxkZwjrnPeEYxDKA39uHcorip02SYjmm0lLw/zhxFEFkp+6x+Cj7FzP6OjOUtBMInEohjrTK
 oI1qGeItyHH5Bx9h5zX77Hueb8kEh3P0MXfOy3OnS0Glvxa7PrDhoZ/KdZ457aALve/O4Nt3t8
 Ut9jxRdJbS+dh/UO4we3tZxglveL1rF4Z0nWoMfB+9FT+tduqOewrBX9zMrlP0OSQMwUkmYcpp
 kTPcyW9GwVZPXMQJzPped5+jxePusxaqtpRdc9mh3RCVERlqYZWXTqbgiPVqP6RmrGWkuh5MOe
 a/k=
X-IronPort-AV: E=Sophos;i="5.70,425,1574118000"; 
   d="scan'208";a="5258082"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [master][zeus][PATCH 3/5] ref-manual: Update the documentation for USERADD_ERROR_DYNAMIC
Date: Mon, 10 Feb 2020 15:51:19 +0100
Message-ID: <20200210145121.18307-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200210145121.18307-1-pkj@axis.com>
References: <20200210145121.18307-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

* Update USERADD_ERROR_DYNAMIC[doc] and the first paragraph to match
  the definition in meta/conf/documentation.conf.
* Add a note explaining the differences in behavior when setting
  USERADD_ERROR_DYNAMIC to "warn" and "error" respectively.

[YOCTO #12932]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 33 ++++++++++++++++------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index e6009926be..c8ece0c579 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -16770,18 +16770,21 @@
 
         <glossentry id='var-USERADD_ERROR_DYNAMIC'><glossterm>USERADD_ERROR_DYNAMIC</glossterm>
             <info>
-               USERADD_ERROR_DYNAMIC[doc] = "If set to 'error', forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files. If set to 'warn', a warning will be issued instead."
+               USERADD_ERROR_DYNAMIC[doc] = "If set to 'error', forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in any of the files listed in USERADD_UID_TABLES and USERADD_GID_TABLES. If set to 'warn', a warning will be issued instead."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
 <!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
-                    If set to "error", forces the OpenEmbedded build system to
-                    produce an error if the user identification
-                    (<filename>uid</filename>) and group identification
-                    (<filename>gid</filename>) values are not defined
-                    in <filename>files/passwd</filename>
-                    and <filename>files/group</filename> files.
-                    If set to "warn", a warning will be issued instead.
+
+                    If set to <filename>error</filename>, forces the
+                    OpenEmbedded build system to produce an error if the user
+                    identification (<filename>uid</filename>) and group
+                    identification (<filename>gid</filename>) values are not
+                    defined in any of the files listed
+                    in <link linkend='var-USERADD_UID_TABLES'><filename>USERADD_UID_TABLES</filename></link>
+                    and <link linkend='var-USERADD_GID_TABLES'><filename>USERADD_GID_TABLES</filename></link>. If
+                    set to <filename>warn</filename>, a warning will be issued
+                    instead.
                 </para>
 
                 <para>
@@ -16808,6 +16811,20 @@
                     <link linkend='var-USERADD_GID_TABLES'><filename>USERADD_GID_TABLES</filename></link>
                     variables.
                 </para>
+
+                <note>
+                    There is a difference in behavior between
+                    setting <filename>USERADD_ERROR_DYNAMIC</filename>
+                    to <filename>error</filename> and setting it
+                    to <filename>warn</filename>. When it is set
+                    to <filename>warn</filename>, the build system will report a
+                    warning for every undefined <filename>uid</filename> and
+                    <filename>gid</filename> in any recipe. But when it is set
+                    to <filename>error</filename>, it will only report errors
+                    for recipes that are actually built. This saves you from
+                    having to add static IDs for recipes that you know will
+                    never be built.
+                </note>
             </glossdef>
         </glossentry>
 
-- 
2.21.1

