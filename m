Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.1747.1582230461848926578
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 12:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=qH8NvvwC;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3278; q=dns/txt; s=axis-central1;
  t=1582230463; x=1613766463;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LDu9CWwIdONWA2QXlpbM+CNGV6h/oeaEMUWlzvmSf4Q=;
  b=qH8NvvwC5D2UVuNSykcVDFGf/M3Yx4LQXy03wVOZCREYatSsdKB0SvNA
   fTKUrLCRtcdCT88IrzznEa8vIZgW57jNbf+Ze2IqnG9+/Pv1x6NQnfeql
   Oc/SzpviSEGVbT/yUalTFmc6mfg7pcfTlbT/9USlomTXCv3Ddoegi3F9B
   3CI/NbwZ05E2gs9T8PJPd13vGk1ypFP1+MXqJr1s8NbXt56XAfrybfQXc
   o6TV2QP+QUVZf19TR5IIc7EFj/aec6gjPGQDhidtwfolMCtF5YEZuseGb
   /uq0T6Vq0D+5ERX6uQCZy1K5ELjzJ71d+dFfnSy0x8nMyQOWyiOqXLXjy
   g==;
IronPort-SDR: YcnO38RYXtbR4pHWQJXFkxGaGSzXl9Kw3rKXR9HISnt8ApJCiaBBTtFvbSqtNE3VbQeJBRKae4
 ZFhVN2VJR5y/uEPrTCyE9OU0Klyu00xFujuhSAUAPx5IcvuvO4MS80GCeGJO4Y45drw0t7bmEZ
 gRkZi+LyCQRkosA0cxcVtK7sFIA/qLT8vrJNhDeld3oMwAHfYrufbvnmpaiBdJpnVdFyvvCJnw
 1uPZ8nRJeCY2RDHk0GGKkwkvKn62k9vvC5wXPEdavtjeYGlhE6eM3RfAwp+up4ciRGbUCHdfhF
 P5Y=
X-IronPort-AV: E=Sophos;i="5.70,465,1574118000"; 
   d="scan'208";a="5657850"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [Resend][PATCH 3/5] ref-manual: Update the documentation for USERADD_ERROR_DYNAMIC
Date: Thu, 20 Feb 2020 21:27:31 +0100
Message-ID: <20200220202733.21907-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220202733.21907-1-pkj@axis.com>
References: <20200220202733.21907-1-pkj@axis.com>
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

