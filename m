Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.13722.1593280109456904990
 for <docs@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 10:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UTwkl+0o;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id j4so5490106plk.3
        for <docs@lists.yoctoproject.org>; Sat, 27 Jun 2020 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=ZkKYhKDbnS5HzTzPeB29iHSclDn8EFTRJRtv8VaMA5k=;
        b=UTwkl+0oE/Fd8MCudljdoPuP0eLMw0qmd9D8GZVAS/T01OivcGXOAB18g8AB4QNTWR
         qv/8IAhChu3GPLrV3+eb9ycEhAo7+fprh5wACjMYcPybpf7/LZjn6z1JqXmaKeDev9kM
         HpmfFjx5D0ENf98tW49Nwbsq9NEDLwOiPQBeaUEW90FyIbSCFbQCDglwzHOPrcDbnNVI
         6K0wZOqxNSmmfPkeP0eFqIEvNF42CRRgaDBIIWzG02HwE/NA0FjUlUz0xW4u58aaAtob
         peYr1JrXY6NyOincb0Ytq9pAh5wuujP3G2tF9rcwFg7GzvCUC83OQb9CK8m0lx41B6pw
         fUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ZkKYhKDbnS5HzTzPeB29iHSclDn8EFTRJRtv8VaMA5k=;
        b=HLkycuv6ArhjLzva9499XiwONWgOOl1QOipNCJhEBK9KIBlm4hsNRTaduEbPRm5mVa
         iK6lEIPMrKtKunzKjZq2RvlbKJkZZGyepMxvxtRO0oYNH024pHRKpbLZoekdjLsjSf35
         bAEYdcz50eC44uTmrE3QF2+ljzFKj3z7u0m0UdkTsv8lR0PuIOPAq6l8Dy+r9/eS3veC
         aNRSo6LUQyoX5rEG1QlDJOzq5olv7yBUWPzdQLt6r/adYUH/1mwwIikGqaRPAww9GRCh
         /ciEizVuj57lusaSwjgKzH9guEdikQe6gSsYnPPBM7eeIRwd1OF4nYDfkVEi6QntQXrY
         Ajmw==
X-Gm-Message-State: AOAM530nfSOb6M6yuJxrMei75HGMXDo1zLRVEFY0KE+2R2tLE5cHPtXz
	IA2lyYxYRyg3B+eIDTtsAySzvwXT
X-Google-Smtp-Source: ABdhPJznjojZgdQ0S0H/6qG15FGf7jOwbSk7uujL5YJCTKW09P7yiMATE8cL0MzsTxVO12WVp4kNfw==
X-Received: by 2002:a17:90b:705:: with SMTP id s5mr2587136pjz.11.1593280108444;
        Sat, 27 Jun 2020 10:48:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f4ca:9bde:369a:d30c])
        by smtp.gmail.com with ESMTPSA id r8sm4408632pfg.147.2020.06.27.10.48.27
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 10:48:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/3] overview-manual: add SPDX license header
Date: Sat, 27 Jun 2020 10:48:24 -0700
Message-Id: <20200627174826.7030-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/overview-manual/overview-manual-concepts.xml      | 1 +
 documentation/overview-manual/overview-manual-customization.xsl | 2 ++
 .../overview-manual/overview-manual-development-environment.xml | 1 +
 documentation/overview-manual/overview-manual-intro.xml         | 1 +
 documentation/overview-manual/overview-manual-style.css         | 2 ++
 documentation/overview-manual/overview-manual-yp-intro.xml      | 1 +
 documentation/overview-manual/overview-manual.xml               | 1 +
 7 files changed, 9 insertions(+)

diff --git a/documentation/overview-manual/overview-manual-concepts.xml b/documentation/overview-manual/overview-manual-concepts.xml
index f085dd710..58b64bd26 100644
--- a/documentation/overview-manual/overview-manual-concepts.xml
+++ b/documentation/overview-manual/overview-manual-concepts.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id=' overview-manual-concepts'>
 <title>Yocto Project Concepts</title>
diff --git a/documentation/overview-manual/overview-manual-customization.xsl b/documentation/overview-manual/overview-manual-customization.xsl
index 22360e7ba..1dd91bde8 100644
--- a/documentation/overview-manual/overview-manual-customization.xsl
+++ b/documentation/overview-manual/overview-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/overview-manual/overview-manual-development-environment.xml b/documentation/overview-manual/overview-manual-development-environment.xml
index 36ebf8a32..8415d1dd7 100644
--- a/documentation/overview-manual/overview-manual-development-environment.xml
+++ b/documentation/overview-manual/overview-manual-development-environment.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='overview-development-environment'>
 <title>The Yocto Project Development Environment</title>
diff --git a/documentation/overview-manual/overview-manual-intro.xml b/documentation/overview-manual/overview-manual-intro.xml
index 39433aa41..0e0bfed6e 100644
--- a/documentation/overview-manual/overview-manual-intro.xml
+++ b/documentation/overview-manual/overview-manual-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='overview-manual-intro'>
 
diff --git a/documentation/overview-manual/overview-manual-style.css b/documentation/overview-manual/overview-manual-style.css
index 97a364b12..eec934161 100644
--- a/documentation/overview-manual/overview-manual-style.css
+++ b/documentation/overview-manual/overview-manual-style.css
@@ -1,4 +1,6 @@
 /*
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/overview-manual/overview-manual-yp-intro.xml b/documentation/overview-manual/overview-manual-yp-intro.xml
index 1b60a3030..2097ed36e 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.xml
+++ b/documentation/overview-manual/overview-manual-yp-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='overview-yp'>
     <title>Introducing the Yocto Project</title>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 210d644b3..8021a2e95 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='overview-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
-- 
2.17.1

