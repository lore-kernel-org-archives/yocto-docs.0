Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.1046.1614613802259009305
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Mar 2021 07:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ua9bCS/S;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id v15so16680933wrx.4
        for <docs@lists.yoctoproject.org>; Mon, 01 Mar 2021 07:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=w+uT68h0E/zo6grKCycLxgfs6PHbM+rbFmwhH881uG4=;
        b=ua9bCS/SKIVt2W/jmCs98UV1ZMc402s6tnR1fhRHyAsXzymcDViuySxXJ/4HgS9nDt
         9rcq6KwnyvGP/8WfjLCA8qyxHhlnyrh2ts0vwMpkcchxqqUzsmVGrolzav1OgG6UVRAq
         AIkjdLPOz1NBqUH0/vMqYAOW0OSsyVrDfIlzNOow/1dA1lvWo10eFFUPsey2Vm5/brWR
         QFgU66BdwDpbwzACTRTfrg+p6wrj8xGXUY/yGKe+lOazTqXCmCfmOrT5Bz3IAnqgZ4t+
         /RWAVGkAISaLgjHov6BCmGA4x5sBdkHuKqvb+D/rPpM1dDWju70P/c58fOKOTWg/ERWj
         nvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w+uT68h0E/zo6grKCycLxgfs6PHbM+rbFmwhH881uG4=;
        b=YNcUjZ9NGdqiGJ80bkv3V4NXYLXIftjGUMepZ2y6UV+LvF/6UvNjAg+FRuJZTIBc2H
         MhBmvGit+oRnBXA4OWfkSzzwILnUmahy8hbUuYw7UrPuVxQtRV7ZMzTADZAlGP5ettq9
         ipUWPNz1Idryq+pF7LtYBSBmP6QCQwnCB5z+b32G0A9RobSC0HKy5+KsKvTLU2P2Wt1j
         yWyz7aXzL6TH1xJfC2Q+th6uE9KaLIRLAI/zmgY1ha+gPurkqszKogE7d+Fakhd6g7H/
         V/E0igqOEi5vx/f98IV6n5rJdk5yPu16V4EIOjcC0mh/MeEVJVCe3VaAFrT97zJKKDzE
         S9tA==
X-Gm-Message-State: AOAM531UHyxTQ9NOR4qBsxSvru+kRuqGuL6NOhzXTfX2qtvZuVszMXtJ
	I2C30qJT7ixKydmcBcUwKUmPdcfKIR4=
X-Google-Smtp-Source: ABdhPJwc/UgIbqH/rTmZtTg6xytGGSe7Kdmis/6GtvSdR1gYpVvpuEYW0a26gtv9DPson2rlceevvg==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr17407529wrt.381.1614613800591;
        Mon, 01 Mar 2021 07:50:00 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.145.200])
        by smtp.gmail.com with ESMTPSA id h11sm21059371wmq.26.2021.03.01.07.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 07:50:00 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: docs@lists.yoctoproject.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] dev-manual/common-task.rst: Added documentation for debuginfod support
Date: Mon,  1 Mar 2021 16:49:52 +0100
Message-Id: <20210301154952.29473-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added documentation on running debuginfod server and using it on the target.

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 46 ++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 65db4aed33..d4a2b2f28d 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10023,7 +10023,51 @@ before starting the debugging process. These extra computations place
 more load on the target system and can alter the characteristics of the
 program being debugged.
 
-To help get past the previously mentioned constraints, you can use
+To help get past the previously mentioned constraints, they're two
+methods you can use: running a debuginfod server and using gdbserver.
+
+Using the debuginfod server Method
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+debuginfod from elfutils is a way to distribute debuginfo files.
+running a debuginfod server makes debug symbols readily available,
+which means you don't need to download debugging information
+and the binaries of the process being debugged. you can just fetch
+debug symbols from the server.
+
+1. To run a debuginfod server, you need to do the following:
+
+-  Ensure that this variable is set in your ``local.conf`` file:
+   ::
+
+      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
+
+    This PACKAGECONFIG option enables debuginfod and libdebuginfod for
+    elfutils-native.
+
+-  Run the following commands to set up the debuginfod server:
+   ::
+
+      $ oe-debuginfod
+2. To use debuginfod on the target, you need the following:
+
+-  Ensure that these variable is set in your ``local.conf`` file:
+   ::
+
+      DEBUGINFOD_URLS = "http://localhost:port"
+
+   This option does the client configuration by setting DEBUGINFOD_URLS 
+   to point at the server running debuginfod. Such that for every lookup, 
+   the debuginfod client will query the server and return the requested information.
+   ::
+
+        PACKAGECONFIG_pn-gdb = "debuginfod"
+
+   This PACKAGECONFIG option enables debuginfod for gdb.
+
+Using the gdbserver Method
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 gdbserver, which runs on the remote target and does not load any
 debugging information from the debugged process. Instead, a GDB instance
 processes the debugging information that is run on a remote computer -
-- 
2.17.1

