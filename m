Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.19368.1592231060692196358
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E9Eg+Z1i;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id 23so7869396pfw.10
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3TBP8/JMat3+YKTJyfnaHGfYHaIjMAFZvBUJ7Tt6SPc=;
        b=E9Eg+Z1iWcSl9O+XDEAiBVpj+IcNStnMxHa72bXlOP5VCNuEz9OJfb0MD1e2r97pJm
         N+813qSg+YHlmbwuyX0gcxjFTGJMY4GLo6bSX47YZXEN4VIhJ0YrcJI/i9VN4i/F85nB
         9Y1HDGoK2hfcadiQ6svNp/GfM36KU9uxjMc5t0Xve9J6eM9Sx6dN9hxQ1cZAHuv7Nwtd
         S37H8wRPAWJILQiltKN9SJT/lBXZU7wtlRopmCm1QLAW4QYPQ2dI1ctffgIGpHu1c2fG
         utoJVnTL0bv37nwvxfOe9Wtzj3UwuWYwAAxocAbcv1oesnY/Yl4rw8Iw/YpvHkNLaTxI
         YzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3TBP8/JMat3+YKTJyfnaHGfYHaIjMAFZvBUJ7Tt6SPc=;
        b=ljyJiylx34yerNLAxF9I1H7Dhum1ewo9j3XYmDTPDDpN/4Psha5v1b4/dN8D5705qP
         6Mff/FA99IWCXRTdh7YjRmDNQptecKs9IcvnP0VdoxnWPc9k5uC64PBW8NwoM3CA888d
         nIp8zcGoumOFwDuKFzVVfyXTWS+vKqQypNpLT74CZegWjV4uV3NQyTN3RSonUfhYwFwr
         mwgr2Yazm3j3TF8fr92rarz/TzGBR2Wx+WIA0I3Aw5W6vBtoTOp4iwYU/MnCtQwEhU3S
         gu2SeERO4Gf3lvyLaC1GmFl+DPUcF3xjrDI3sRBMtjmDHQ8KJYcNXH7QJrBWEM1BAfXl
         szWg==
X-Gm-Message-State: AOAM532gWN/UMmfRX6jdDE3yrs5R8XdW9EEDz9lB9AVMTbw7Qllodf0E
	uHg2m754kb5TZ/fUu1vaf0Ksw4Iw
X-Google-Smtp-Source: ABdhPJwCHr2Q9ZxmZfenKWJtxcIymZmamAyBCWzZm/1RSzC2kJ/3SFu/D+c08xQlt9gUV2bsffQOeQ==
X-Received: by 2002:a63:2160:: with SMTP id s32mr22178173pgm.64.1592231060057;
        Mon, 15 Jun 2020 07:24:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.19
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:19 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 8/8] toaster-manaul: Add SPDX license headers
Date: Mon, 15 Jun 2020 07:24:12 -0700
Message-Id: <20200615142412.30882-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615142412.30882-1-akuster808@gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/toaster-manual/toaster-manual-customization.xsl | 2 ++
 documentation/toaster-manual/toaster-manual-intro.xml         | 1 +
 documentation/toaster-manual/toaster-manual-reference.xml     | 1 +
 documentation/toaster-manual/toaster-manual-setup-and-use.xml | 1 +
 documentation/toaster-manual/toaster-manual-start.xml         | 1 +
 documentation/toaster-manual/toaster-manual-style.css         | 3 +++
 documentation/toaster-manual/toaster-manual.xml               | 1 +
 7 files changed, 10 insertions(+)

diff --git a/documentation/toaster-manual/toaster-manual-customization.xsl b/documentation/toaster-manual/toaster-manual-customization.xsl
index d78694ac1..3a9b22eb8 100644
--- a/documentation/toaster-manual/toaster-manual-customization.xsl
+++ b/documentation/toaster-manual/toaster-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/toaster-manual/toaster-manual-intro.xml b/documentation/toaster-manual/toaster-manual-intro.xml
index e84964c4e..6ee9ec720 100644
--- a/documentation/toaster-manual/toaster-manual-intro.xml
+++ b/documentation/toaster-manual/toaster-manual-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='toaster-manual-intro'>
 <title>Introduction</title>
diff --git a/documentation/toaster-manual/toaster-manual-reference.xml b/documentation/toaster-manual/toaster-manual-reference.xml
index 7440580e7..ae267f418 100644
--- a/documentation/toaster-manual/toaster-manual-reference.xml
+++ b/documentation/toaster-manual/toaster-manual-reference.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='toaster-manual-reference'>
 
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.xml b/documentation/toaster-manual/toaster-manual-setup-and-use.xml
index b4caebbe0..d810b9d57 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.xml
+++ b/documentation/toaster-manual/toaster-manual-setup-and-use.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='toaster-manual-setup-and-use'>
 
diff --git a/documentation/toaster-manual/toaster-manual-start.xml b/documentation/toaster-manual/toaster-manual-start.xml
index fc187ecd5..8a857006e 100644
--- a/documentation/toaster-manual/toaster-manual-start.xml
+++ b/documentation/toaster-manual/toaster-manual-start.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='toaster-manual-start'>
 
diff --git a/documentation/toaster-manual/toaster-manual-style.css b/documentation/toaster-manual/toaster-manual-style.css
index 6d6b9fb65..a7f430df0 100644
--- a/documentation/toaster-manual/toaster-manual-style.css
+++ b/documentation/toaster-manual/toaster-manual-style.css
@@ -1,4 +1,7 @@
 /*
+
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index e6d424523..136b4df96 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='toaster-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
-- 
2.17.1

