Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.13664.1593280110696350941
 for <docs@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 10:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k5/sS71u;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id b92so6256490pjc.4
        for <docs@lists.yoctoproject.org>; Sat, 27 Jun 2020 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SiZA2Px8p12Ek/M6Vu8PDPCup8XOW/wruEPMeKwKTjo=;
        b=k5/sS71ulgVvBC7GgRHOiiWJI0BtxiM7LD67HNH7egruN/YjSt3n18tK0xe80Jq67N
         coqp1d4LUfzzflIEFdOrwcE3yR8GgfhDpXwAA65krB46XGfQHqIX0J9wZH2cJN1wSfnL
         YXFJ6pARSdOCl4tGEcMLUzGtnNsbHqzGZ7QgVWP49c1dFSEIt4I1aG/9dypljNHXTnVa
         wU1odEsE/grs/pSIn369/2nNFtC/vsoryrg74hWmcANourjP9f3wFHAg0LXKfhwu8yom
         vf/Z7lMStt+XU2nXW/p/W1NVNl/7KBWBMMjgeNrtFDwwl9/GLghMdUsW1al1GOXWk3tP
         g7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SiZA2Px8p12Ek/M6Vu8PDPCup8XOW/wruEPMeKwKTjo=;
        b=N+PKkSAzNnUC6MYo+5QH9Td0vVoGBBTHseo8YKNP5ycmFH2K0HTvGzt1gPvuCj2S3Q
         cwaVBSejyOTiwUoFBHDyDx0UPEzKFpvk7cyVdQsD23nKE38TsoHmCaDk6K7NxZU0FYe5
         Hxi8IMesiC4Xd4WwOhTL5F06Mq+Bh2QTD8g0EawQw2VYIrNqR1U90KB2vTSlr+Q/i+U2
         XN2G9qk4wZWy8RJWL0oy4VquXSkdr/7LeHpH/stgdUbAPEEN6BQMYtCzhPIJhL+siCYq
         bnlc2mOkSaliyYJqCUMqBHs+geJaCc3nQ04fDa6Yac5qzCIK4r60naZdgR/XFZ9Mq3R+
         GXuA==
X-Gm-Message-State: AOAM530jT4C2Sed7jTyZ6aJHW3rp9lPj6RunOyMumOo6UTggpPwef16J
	2QpR7w4Cl+WPzzsIL3kMfWS+2NP0
X-Google-Smtp-Source: ABdhPJwGt+VBjzsnfO9iQczFPwDRSRl9WXPVeefk9wbBPgYjNLvaJhqX2ojkhw4Kq8JfzDboRn7rFw==
X-Received: by 2002:a17:90a:1117:: with SMTP id d23mr9514377pja.136.1593280109991;
        Sat, 27 Jun 2020 10:48:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f4ca:9bde:369a:d30c])
        by smtp.gmail.com with ESMTPSA id r8sm4408632pfg.147.2020.06.27.10.48.29
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 10:48:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/3] ref-manual: Add SPDX license headers
Date: Sat, 27 Jun 2020 10:48:26 -0700
Message-Id: <20200627174826.7030-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200627174826.7030-1-akuster808@gmail.com>
References: <20200627174826.7030-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/ref-manual/faq.xml                      | 1 +
 documentation/ref-manual/migration.xml                | 1 +
 documentation/ref-manual/ref-classes.xml              | 1 +
 documentation/ref-manual/ref-devtool-reference.xml    | 1 +
 documentation/ref-manual/ref-features.xml             | 1 +
 documentation/ref-manual/ref-images.xml               | 1 +
 documentation/ref-manual/ref-kickstart.xml            | 1 +
 documentation/ref-manual/ref-manual-customization.xsl | 2 ++
 documentation/ref-manual/ref-qa-checks.xml            | 1 +
 documentation/ref-manual/ref-release-process.xml      | 1 +
 documentation/ref-manual/ref-structure.xml            | 1 +
 documentation/ref-manual/ref-style.css                | 3 +++
 documentation/ref-manual/ref-system-requirements.xml  | 1 +
 documentation/ref-manual/ref-tasks.xml                | 1 +
 documentation/ref-manual/ref-terms.xml                | 1 +
 documentation/ref-manual/ref-variables.xml            | 1 +
 documentation/ref-manual/ref-varlocality.xml          | 1 +
 documentation/ref-manual/resources.xml                | 1 +
 18 files changed, 21 insertions(+)

diff --git a/documentation/ref-manual/faq.xml b/documentation/ref-manual/faq.xml
index d94cb32a8..98ae0a975 100644
--- a/documentation/ref-manual/faq.xml
+++ b/documentation/ref-manual/faq.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='faq'>
 <title>FAQ</title>
diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index affc8b90a..d3d5b16bd 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='migration'>
 <title>Migrating to a Newer Yocto Project Release</title>
diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index f8920d8c1..ab12373ae 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-classes'>
 <title>Classes</title>
diff --git a/documentation/ref-manual/ref-devtool-reference.xml b/documentation/ref-manual/ref-devtool-reference.xml
index 11f7399c5..6c3ccc303 100644
--- a/documentation/ref-manual/ref-devtool-reference.xml
+++ b/documentation/ref-manual/ref-devtool-reference.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-devtool-reference'>
     <title><filename>devtool</filename> Quick Reference</title>
diff --git a/documentation/ref-manual/ref-features.xml b/documentation/ref-manual/ref-features.xml
index 294b297c2..8cab5ec3a 100644
--- a/documentation/ref-manual/ref-features.xml
+++ b/documentation/ref-manual/ref-features.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-features'>
     <title>Features</title>
diff --git a/documentation/ref-manual/ref-images.xml b/documentation/ref-manual/ref-images.xml
index 1f96186c6..aaeda5522 100644
--- a/documentation/ref-manual/ref-images.xml
+++ b/documentation/ref-manual/ref-images.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-images'>
     <title>Images</title>
diff --git a/documentation/ref-manual/ref-kickstart.xml b/documentation/ref-manual/ref-kickstart.xml
index 1128bd50d..45db1c0ff 100644
--- a/documentation/ref-manual/ref-kickstart.xml
+++ b/documentation/ref-manual/ref-kickstart.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-kickstart'>
 <title>OpenEmbedded Kickstart (<filename>.wks</filename>) Reference</title>
diff --git a/documentation/ref-manual/ref-manual-customization.xsl b/documentation/ref-manual/ref-manual-customization.xsl
index c58dd905b..3181f618e 100644
--- a/documentation/ref-manual/ref-manual-customization.xsl
+++ b/documentation/ref-manual/ref-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/ref-manual/ref-qa-checks.xml b/documentation/ref-manual/ref-qa-checks.xml
index 424a19c59..0071e4a55 100644
--- a/documentation/ref-manual/ref-qa-checks.xml
+++ b/documentation/ref-manual/ref-qa-checks.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-qa-checks'>
 <title>QA Error and Warning Messages</title>
diff --git a/documentation/ref-manual/ref-release-process.xml b/documentation/ref-manual/ref-release-process.xml
index 5efe17417..87f530806 100644
--- a/documentation/ref-manual/ref-release-process.xml
+++ b/documentation/ref-manual/ref-release-process.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-release-process'>
 <title>Yocto Project Releases and the Stable Release Process</title>
diff --git a/documentation/ref-manual/ref-structure.xml b/documentation/ref-manual/ref-structure.xml
index 27f17dd91..8588e9c2d 100644
--- a/documentation/ref-manual/ref-structure.xml
+++ b/documentation/ref-manual/ref-structure.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-structure'>
 
diff --git a/documentation/ref-manual/ref-style.css b/documentation/ref-manual/ref-style.css
index 7077e4b70..622ceb8f7 100644
--- a/documentation/ref-manual/ref-style.css
+++ b/documentation/ref-manual/ref-style.css
@@ -1,4 +1,7 @@
 /*
+
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 7a11ec2cf..43e217c6d 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-manual-system-requirements'>
 <title>System Requirements</title>
diff --git a/documentation/ref-manual/ref-tasks.xml b/documentation/ref-manual/ref-tasks.xml
index 011e0d749..5b09b3f2e 100644
--- a/documentation/ref-manual/ref-tasks.xml
+++ b/documentation/ref-manual/ref-tasks.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-tasks'>
 <title>Tasks</title>
diff --git a/documentation/ref-manual/ref-terms.xml b/documentation/ref-manual/ref-terms.xml
index 722fa7ee2..d2605c62a 100644
--- a/documentation/ref-manual/ref-terms.xml
+++ b/documentation/ref-manual/ref-terms.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-terms'>
 <title>Yocto Project Terms</title>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 657f6cf3d..9fe744aff 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <!-- Dummy chapter -->
 <chapter id='ref-variables-glos'>
diff --git a/documentation/ref-manual/ref-varlocality.xml b/documentation/ref-manual/ref-varlocality.xml
index 54524d5b6..a2436fb31 100644
--- a/documentation/ref-manual/ref-varlocality.xml
+++ b/documentation/ref-manual/ref-varlocality.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='ref-varlocality'>
     <title>Variable Context</title>
diff --git a/documentation/ref-manual/resources.xml b/documentation/ref-manual/resources.xml
index afe8e288d..4899b2e59 100644
--- a/documentation/ref-manual/resources.xml
+++ b/documentation/ref-manual/resources.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='resources'>
 <title>Contributions and Additional Information</title>
-- 
2.17.1

