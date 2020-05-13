Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.56.1589401284207801797
 for <docs@lists.yoctoproject.org>;
 Wed, 13 May 2020 13:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CohOXP4k;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id f23so247949pgj.4
        for <docs@lists.yoctoproject.org>; Wed, 13 May 2020 13:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pym7BBbBb3ktCgX5HjJiFuQGTeZHjUCh6w+fqfxTU0s=;
        b=CohOXP4kO9sM7yWLf61INF/eSZOhGMQ5fgKWAGtk6E4fCRKzDyyczJoLBsP0NTkP+o
         NzzEHy+I95YnWaCmy8bkGzJeVfu2YjJRXOQdsMEsJ7eTedrOgEgjWCEBUUXkDcHgzMeh
         x6SrhzfpvoR9ha8K7MsD2DZ2/7h8Vl0Tk9mFWv2LS5wd0W1QG/gnDyG0vCRWzMh9oaig
         e2/xIJrKEv6LX67B97OTn4dvqTVAAi9i8tvo4waqOjnpGUjtMlcTl2DL4rUubNsmmgyS
         oeJHXG87qA/sB2mHLJQOMnrEv9IW8iIQ+hH7Eb2A9M8kaM3q17Q82Q86DACv7+V71Tv0
         KB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pym7BBbBb3ktCgX5HjJiFuQGTeZHjUCh6w+fqfxTU0s=;
        b=iNdFIrruFpQZf5FCtEtSx7O4bJdrQCg4e+P9iCxNj5eItRZjVbsizrqWa+chiJvFDy
         rDGSW7pqu5nIV9CXXAAW4p0zZKHNa1NH/fDASyvNycnH2WDeOCMNPh0Uj6qPrJ2AZQxH
         hxr0lDe+ojZ1Qw8GtdHPDu7y/q5CyDy7LRsnb2GDEHfrct6cp1E9/FXD9ztJsrHZ+mE7
         QzRBD7DakaZBcpyv0vHrTp8isB3eBgtozvs0joZr4D4VYXRotvZIl3TxD0CgOzPFUyDC
         KfrDZi20YQ3BgWBO/kN+pr47lSu38pc37ktiIbjhd2saPQFNr4GQrIAl3SKjfVyImjUc
         glOQ==
X-Gm-Message-State: AOAM531cC4iqv9PBOqI1M0artctyNoH/sPL17sLa+2X2iNymw0jq/rTo
	lMH0NpNK+IbMYI6Y/Ceo8EOa8YsxdSgSog==
X-Google-Smtp-Source: ABdhPJy987/KpyzGNgB+aoO9MrRagOIck1FzuU31MBIOK0tfFFHyrPvgnnvj64Vre2hmrC9CPNVtMQ==
X-Received: by 2002:a62:1789:: with SMTP id 131mr970902pfx.287.1589401283207;
        Wed, 13 May 2020 13:21:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m12sm462440pgj.46.2020.05.13.13.21.21
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 13:21:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 4/4] ref-manual: Remove long-dead PACKAGE_GROUP variable
Date: Wed, 13 May 2020 10:20:56 -1000
Message-Id: <2deac02f283547f66d1f7a002f5bf07ddd449401.1589308928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589308928.git.steve@sakoman.com>
References: <cover.1589308928.git.steve@sakoman.com>

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

