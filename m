Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE58D2A012
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 12:56:54 +0000 (UTC)
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9354.1768395408555042207
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 04:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4drmMz2GgyzTyv;
	Wed, 14 Jan 2026 13:56:47 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4drmMz046fzJs;
	Wed, 14 Jan 2026 13:56:46 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 14 Jan 2026 13:56:24 +0100
Subject: [PATCH 4/9] sdk-manual: working-projects: properly highlight code
 code-blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-code-block-misc-20260114-v1-4-174a6e5dba69@cherry.de>
References: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
In-Reply-To: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 12:56:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8548

From: Quentin Schulz <quentin.schulz@cherry.de>

There are some blocks containing C code so highlight them as C with the
"c" lexer.

For autotool'ed files, there's no lexer available so "none" will do just
fine.

Finally, there's one Makefile code block so highlight it with the
"makefile" lexer.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sdk-manual/working-projects.rst | 28 ++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index ceae1fedd..d64dae435 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -56,7 +56,9 @@ project:
    Create the remaining
    three files as follows:
 
-   -  ``hello.c``::
+   -  ``hello.c``:
+
+      .. code-block:: c
 
          #include <stdio.h>
 
@@ -66,7 +68,9 @@ project:
                  return 0;
              }
 
-   -  ``configure.ac``::
+   -  ``configure.ac``:
+
+      .. code-block:: none
 
          AC_INIT(hello,0.1)
          AM_INIT_AUTOMAKE([foreign])
@@ -74,7 +78,9 @@ project:
          AC_CONFIG_FILES(Makefile)
          AC_OUTPUT
 
-   -  ``Makefile.am``::
+   -  ``Makefile.am``:
+
+      .. code-block:: none
 
          bin_PROGRAMS = hello
          hello_SOURCES = hello.c
@@ -271,7 +277,9 @@ example:
 
    Create the three files as follows:
 
-   -  ``main.c``::
+   -  ``main.c``:
+
+      .. code-block:: c
 
          #include "module.h"
          void sample_func();
@@ -281,12 +289,16 @@ example:
              return 0;
          }
 
-   -  ``module.h``::
+   -  ``module.h``:
+
+      .. code-block:: c
 
          #include <stdio.h>
          void sample_func();
 
-   -  ``module.c``::
+   -  ``module.c``:
+
+      .. code-block:: c
 
          #include "module.h"
          void sample_func()
@@ -321,7 +333,9 @@ example:
    two lines that can be used to set the :term:`CC` variable. One line is
    identical to the value that is set when you run the SDK environment
    setup script, and the other line sets :term:`CC` to "gcc", the default
-   GNU compiler on the build host::
+   GNU compiler on the build host:
+
+   .. code-block:: Makefile
 
       # CC=i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux
       # CC="gcc"

-- 
2.52.0


