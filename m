Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.23162.1590957591486554176
 for <docs@lists.yoctoproject.org>;
 Sun, 31 May 2020 13:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lUAOqTeW;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id ga6so918312pjb.1
        for <docs@lists.yoctoproject.org>; Sun, 31 May 2020 13:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=S8Ko1/h71IzY8er7Ni61Pmj/hcjUVq2NKsWhSP48rWw=;
        b=lUAOqTeWYHC5eI+JudieTqVvM13FJckPaKEwmPHFyqnzH1T3GWKpAo5nxaDqhoztHh
         atEbbUULeLoauCA+8+R0ngPnzKdfr/tTg+Swnudu7XyVlq+woKmASi7dCtuce5I6BPXU
         kq46Ya3iaxIIqWHhDAQIJ1WxVJk0CnU3zHgKBfk3al7SpDoVZCjXqPwZn2xMp+6nD9eW
         aZFCRyH/dkut7i0UL6l0PYW3Pk5JXphdnh87WrCZNfCchxNJEqNFZD2pilka2DQST5L1
         5uFLjw5a1VMgJcnMPizGnuXt5j9vOgo46pSjTB4dbZtU+H9abzkMGoO7gVapxMEheqiq
         tCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=S8Ko1/h71IzY8er7Ni61Pmj/hcjUVq2NKsWhSP48rWw=;
        b=h+Rjsv6QSWTNbW8q3aQD4UpJJj2LgIhfcTer/AJRCmdC7CFfnpZlfLHNe9p7PcZg5D
         BHOrC20ygQZxQginWi4RJrUgjVaDNS9EgLcO+oInbtW2Qi/+x4aCuRB9kfnn2ZVG5AxA
         dEBZOadkm+tGEalTOBKQQowO3W79G4CBjyjRiwGsOH+0tpSiCEFIsWkw421UbRRzCU7V
         301E8x5NWgP5mhBCGr5QmloDsoYHp4aI9U6l2C3jo6OcjIt4pr1CeIO/dihbgheCtDJW
         wFl/yWXDbgG0MdPmSoz7LlqR9XpLKFaZ4Adx67IyVgy8kFpY5vbJeNGy6TfeRjB5Me1T
         EM2w==
X-Gm-Message-State: AOAM533VprN6tbCGd6WzEJEqz1bXMIYPhWDnAASDU4fUKneEYh4M+VPw
	LVAc4lmV44cb4l5v/vVSdrUnVhEY
X-Google-Smtp-Source: ABdhPJywYdISz9LFA+r6GPTVNwo7hDGg5/5eYOmfAcm3fUs9DWP3iRzKjs24Gw7U+Nag+wdwPMmbMQ==
X-Received: by 2002:a17:90b:ed5:: with SMTP id gz21mr2864427pjb.214.1590957590672;
        Sun, 31 May 2020 13:39:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id t6sm3481636pga.69.2020.05.31.13.39.49
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 13:39:49 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] yocto-docs: Add SPDX headers in scripts and Makefile
Date: Sun, 31 May 2020 13:39:48 -0700
Message-Id: <20200531203948.622-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/Makefile                        |  3 +++
 documentation/tools/eclipse-help.sed          |  3 +++
 documentation/tools/mega-manual.sed           |  3 +++
 documentation/tools/poky-docbook-to-pdf       |  5 ++++-
 documentation/tools/update-documentation-conf | 16 +++-------------
 5 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 15644bf92..2f7292214 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: CC-BY-2.0-UK
+#
 # This is a single Makefile to handle all generated Yocto Project documents,
 # which includes the BitBake User Manual and the Toaster User Manual.
 # The Makefile needs to live in the documents directory and all figures used
diff --git a/documentation/tools/eclipse-help.sed b/documentation/tools/eclipse-help.sed
index ab5c9affd..9716ea42b 100644
--- a/documentation/tools/eclipse-help.sed
+++ b/documentation/tools/eclipse-help.sed
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: CC-BY-2.0-UK
+#
 # Process poky-ref-manual and yocto-project-qs manual (<word>-<word>-<word> style)
 # For example:
 #   "ulink" href="http://www.yoctoproject.org/docs/1.3/poky-ref-manual/poky-ref-manual.html#faq"
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index b1ea9edb7..c525ab46a 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: CC-BY-2.0-UK
+#
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
diff --git a/documentation/tools/poky-docbook-to-pdf b/documentation/tools/poky-docbook-to-pdf
index f55fd278a..b36e74b6b 100755
--- a/documentation/tools/poky-docbook-to-pdf
+++ b/documentation/tools/poky-docbook-to-pdf
@@ -1,5 +1,8 @@
 #!/bin/sh
-	
+#
+# SPDX-License-Identifier: CC-BY-2.0-UK
+#
+
 if [ -z "$1" -o -z "$2" ]; then
    echo "usage: [-v] $0 <docbook file> <templatedir>"
    echo
diff --git a/documentation/tools/update-documentation-conf b/documentation/tools/update-documentation-conf
index 3f8d28009..adfca3ca5 100644
--- a/documentation/tools/update-documentation-conf
+++ b/documentation/tools/update-documentation-conf
@@ -1,23 +1,13 @@
 #!/usr/bin/env python
-
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # documentation.conf update script
 #
 # Author: Paul Eggleton <paul.eggleton@linux.intel.com>
 #
 # Copyright (C) 2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 
 import sys
-- 
2.17.1

