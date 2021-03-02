Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.1393.1614704832069211147
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 09:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cfHOKI7n;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id l22so2841412wme.1
        for <docs@lists.yoctoproject.org>; Tue, 02 Mar 2021 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JKh1Jlvj2GgJ/naX/eLjLyQydfxHUwDc8RX8pWbgNCg=;
        b=cfHOKI7n8zAQ8FxYQzI/FdV9tZ7Fh6GQu1oitoCRlv49zaXrp6n8g3AwuAxPQ8/+y+
         xde3oVfNIxcarEX8WWnvMnyK5di7YHNdhqQJHTMWSc15Db8r0ygg7miQcPfm24Ke1A5t
         e97TJEbzRXV74ppowvd9ZCNPbUD47Y9A4X9QE/lvLFecJY6B3VxkJ4sIyiao+hOrT5Gm
         mtBb7rYLrGV53msLp8Am8ipvX3bctT3lqQ93XSR50U787xASo1FWAdcuDG4Csc/MBr6/
         Wn1jKSr9xbipTO7WyRgB2/2hldm/4v8l+AyuT7fBKIex9Y/ocIclQju7qWrjkZXpaeQG
         gTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JKh1Jlvj2GgJ/naX/eLjLyQydfxHUwDc8RX8pWbgNCg=;
        b=qdwym4Q4MNCJ0kYWdpPfZPspXLQrAX0HmHPqCg3l9W2tg8qnEBr4+EQUs1xwDScKwI
         uRf5bEq8kXrETLK8tWz2H95FQtihovtTCWOndADB2y6nQ+dMVkwmQofj0Q9ycH5i3CMQ
         FrVmW73+fcPpLbGEw9ODWBrfIpMJA0hwtEhvw1ERphFCXq/MKqEtqkpTJbY8JVLcZgFQ
         w5eBiboXJYxbBVVUy/YS2T4OdaGUrjeMj2OWCqo+S24J9YnpDzydNTwdXRASM2tQoRRX
         K1mgfi4C2uUDxa2nMYtAMBrBpJUfKkb0tX5d7w5I/n+CdUhlZWy82nmSQliWaiBJm3lh
         acnQ==
X-Gm-Message-State: AOAM533jCLuSsqSiwu2S9xIfI5ff4E3RzikM+g8cJLsmyBUfBpAT+xy9
	78xWj8Z0k5iSdjHlQk935ni41J+INo0=
X-Google-Smtp-Source: ABdhPJyl0KeaVyONz099XaaAkvxqD16qVQOaj5ylevFFUgEblenlI7kQpGbgcrQt0DL4/1+J+9TUbQ==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr5070447wmd.1.1614704828868;
        Tue, 02 Mar 2021 09:07:08 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.37.59])
        by smtp.gmail.com with ESMTPSA id w4sm3123004wmc.13.2021.03.02.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:07:08 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: docs@lists.yoctoproject.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v2] dev-manual/common-task.rst: Added documentation for debuginfod support
Date: Tue,  2 Mar 2021 18:06:51 +0100
Message-Id: <20210302170651.24475-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added documentation on running debuginfod server and using it on the target.
Added the term DEBUGINFOD_URLS definition in ref-manual/variables.rst

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 47 ++++++++++++++++++++++-
 documentation/ref-manual/variables.rst    |  6 +++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 65db4aed3..7d334b6be 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10023,7 +10023,52 @@ before starting the debugging process. These extra computations place
 more load on the target system and can alter the characteristics of the
 program being debugged.
 
-To help get past the previously mentioned constraints, you can use
+To help get past the previously mentioned constraints, there are two
+methods you can use: running a debuginfod server and using gdbserver.
+
+Using the debuginfod server method
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+"debuginfod" from "elfutils" is a way to distribute "debuginfo" files.
+Running a "debuginfod" server makes debug symbols readily available,
+which means you don't need to download debugging information
+and the binaries of the process being debugged. You can just fetch
+debug symbols from the server.
+
+To run a debuginfod server, you need to do the following:
+
+-  Ensure that this variable is set in your ``local.conf`` file:
+   ::
+
+      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
+
+   This :term:`PACKAGECONFIG` option enables debuginfod and libdebuginfod for
+   "elfutils-native".
+
+-  Run the following commands to set up the "debuginfod" server:
+   ::
+
+      $ oe-debuginfod
+
+
+To use debuginfod on the target, you need the following:
+
+-  Ensure that this variable is set in your ``local.conf`` file:
+   ::
+
+      DEBUGINFOD_URLS = "http://localhost:8002/"
+
+   This :term:`DEBUGINFOD_URLS` option does the client configuration.
+
+   ::
+
+        PACKAGECONFIG_pn-gdb = "debuginfod"
+
+   This :term:`PACKAGECONFIG` option enables "debuginfod" for "gdb".
+
+Using the gdbserver method
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 gdbserver, which runs on the remote target and does not load any
 debugging information from the debugged process. Instead, a GDB instance
 processes the debugging information that is run on a remote computer -
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2cb37b6a2..d8d121830 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1553,6 +1553,12 @@ system and gives an overview of their function and contents.
 
          DEBIANNAME_${PN} = "dbus-1"
 
+   :term:`DEBUGINFOD_URLS`
+      Points to the URL of the "debuginfod" server. Such that for every
+      debugging information lookup, the debuginfod client will query the
+      server and return the requested information. You set this variable
+      in your ``local.conf`` file.
+
    :term:`DEBUG_BUILD`
       Specifies to build packages with debugging information. This
       influences the value of the ``SELECTED_OPTIMIZATION`` variable.
-- 
2.17.1

