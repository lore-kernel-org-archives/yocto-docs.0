Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.203.1591057728058318836
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 17:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JIdtkdVm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id p30so4239104pgl.11
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2020 17:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pym7BBbBb3ktCgX5HjJiFuQGTeZHjUCh6w+fqfxTU0s=;
        b=JIdtkdVm29XQsLflg/RQ9a4DdsWYBp5MTXcfECULgK3deuMaQov/JaXlcvweHtBmsP
         UZd/6SKt2d6krYJlRiO+0y6FNOVSPcWSgSYNqnqe6XJZuc5jnieDaPrr3ulSA5ySdkqQ
         KeQCr8O7da9X7KfqGSa/+YYGgJ9leHnEChFZyFxnd3pdW/m5lQ95EjN/dcP1cxp0Vp5d
         fddG1wbaVMbtZLRFR6J6d/3IDnFsIAkE9E8rPAImu7ttmcqZi0TLBnvsxcVhrGPi2/gq
         X3wIT+hBaTOpeKO/I0GvqpFIRH+HkZPBsJJbXH/QT0ZjquQ5Lg69Uzgn2rTj7c13+plG
         GTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pym7BBbBb3ktCgX5HjJiFuQGTeZHjUCh6w+fqfxTU0s=;
        b=qkb9+kQ4zmmaySg0NfFmSDIxc1yFBSf4PkIzn1youFm9lNybNzelHdd7+LLt42AtTU
         CZGxK7pn2WyPXjrjHWt52Sew3WkK8a4VI3EYQNnzT/xDURe0XbWTvVcF3DA2il059PR0
         qZ3JsnVtVODF+bId2gTGnAxwt3bjpZ2gjF00spmMBTc/S2FFMzulVHyd+8jt4V8CwxqH
         4RT7QLsuAvLTj7InreQAjJqi8HMJ4sBy+A6hPqePdXA9Qd6DZb1NxX4Ja2J4gCyZ51yp
         9fhf9bEQKiGYS3jCt3yyw3CWZ3QSZUn1gfqN9f2yoyMvq8IjFV+53cnCdU9cDbfnEYZR
         d5yQ==
X-Gm-Message-State: AOAM533Pf6q536U1tnfDr1pxmBiVUEfoPCulNpBDGOUpmbxnksBKTf47
	ILiOY6p2jGHfRQqr1x2q3Mrsc6V6Z0I=
X-Google-Smtp-Source: ABdhPJx+GUyzIE8rNQ26XmY3uCD0BDEJv33s/uHPESfWHocFRVDiNM0E7IY/2xwoDmRjt0MOP6kiUA==
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr21944900pfd.129.1591057727086;
        Mon, 01 Jun 2020 17:28:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p190sm474461pfb.107.2020.06.01.17.28.45
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:28:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 4/6] ref-manual: Remove long-dead PACKAGE_GROUP variable
Date: Mon,  1 Jun 2020 14:28:22 -1000
Message-Id: <2deac02f283547f66d1f7a002f5bf07ddd449401.1591057623.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591057623.git.steve@sakoman.com>
References: <cover.1591057623.git.steve@sakoman.com>

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

This was, years ago, deprecated in favour of FEATURE_PACKAGES, so
remove all references, other than the entry in the migration section.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/migration.xml     |  6 ++----
 documentation/ref-manual/ref-variables.xml | 22 ----------------------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index 9422b5a27..affc8b90a 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -875,8 +875,7 @@
                     not work.
                     This change is intended to catch those kinds of situations.
                     Valid <filename>IMAGE_FEATURES</filename> are drawn from
-                    <link linkend='var-PACKAGE_GROUP'><filename>PACKAGE_GROUP</filename></link>
-                    definitions,
+                    <filename>PACKAGE_GROUP</filename> definitions,
                     <link linkend='var-COMPLEMENTARY_GLOB'><filename>COMPLEMENTARY_GLOB</filename></link>
                     and a new "validitems" varflag on
                     <filename>IMAGE_FEATURES</filename>.
@@ -1404,8 +1403,7 @@
 
             <para>
                 The
-                <link linkend='var-PACKAGE_GROUP'><filename>PACKAGE_GROUP</filename></link>
-                variable has been renamed to
+                <filename>PACKAGE_GROUP</filename> variable has been renamed to
                 <link linkend='var-FEATURE_PACKAGES'><filename>FEATURE_PACKAGES</filename></link>
                 to more accurately reflect its purpose.
                 You can still use <filename>PACKAGE_GROUP</filename> but
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index c3e3c5015..9ebe72cbd 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -10292,28 +10292,6 @@
             </glossdef>
         </glossentry>
 
-        <glossentry id='var-PACKAGE_GROUP'><glossterm>PACKAGE_GROUP</glossterm>
-            <info>
-                PACKAGE_GROUP[doc] = "Defines one or more packages to include in an image when a specific item is included in IMAGE_FEATURES."
-            </info>
-            <glossdef>
-                <para role="glossdeffirst">
-<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
-                    The <filename>PACKAGE_GROUP</filename> variable has been
-                    renamed to
-                    <link linkend='var-FEATURE_PACKAGES'><filename>FEATURE_PACKAGES</filename></link>.
-                    See the variable description for
-                    <filename>FEATURE_PACKAGES</filename> for information.
-                </para>
-
-                <para>
-                    If if you use the <filename>PACKAGE_GROUP</filename>
-                    variable, the OpenEmbedded build system issues a warning
-                    message.
-                </para>
-            </glossdef>
-        </glossentry>
-
         <glossentry id='var-PACKAGE_INSTALL'><glossterm>PACKAGE_INSTALL</glossterm>
             <info>
                 PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."
-- 
2.17.1

