Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3A3C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:02:02 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.5140.1702288911780660926
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 02:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Opg0xx4e;
 spf=pass (domain: snapchat.com, ip: 209.85.218.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a00c200782dso564886266b.1
        for <docs@lists.yoctoproject.org>; Mon, 11 Dec 2023 02:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702288909; x=1702893709; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJFPcEFHRYdtQyoJUrTeKgsIqFfQZ0N9FTy7hQspyaw=;
        b=Opg0xx4efsSGVKCJ2GKbLaLZ9V5/YNUPyTrUbs9aPkyoQS3OPXmvI+jknRivkaeTon
         vQ4ePVYoe5ZHS7C8aL3ry2UNh6BMzOSK2RFA7xssLBz0clQsPvCCkgSOk2/9+YsPFhYv
         FixyVwU6E46ATDjk4AgxntMfmFI6y5W9W1cHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288909; x=1702893709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJFPcEFHRYdtQyoJUrTeKgsIqFfQZ0N9FTy7hQspyaw=;
        b=eWCwpf7cPL40pZEmuA4saKqzP7jA/WKFUFBVnbsXPBTPBIezCykZKkMuOU/F+1t+ab
         InaE4JGB1exv16S2Ug/W9J6IYcPTM3CyoKi1O6bSjDorWPHbEDa3VKe8afGDXa2Tzwcr
         3hTd8/R/GwX/0Emh1sTnvJw0gYnZFvCFBAkwxR/9h9EJt+Z+aDGdh0iXqFe7wlFP0x4G
         e8ZeqXrOCiqNNfyjpE4lca/3NgCZtwJqMLvys83gQ1L6w1Mp1Wm7ExJ1zlgeX4mFxmj/
         1fQRuzmY8UFHLufi3twlakhmpVF/ROQd1+HrnIX76Jv/rRgfRsywa/6ghpwU9NmhDT9d
         ke9Q==
X-Gm-Message-State: AOJu0Yz3rIceaFIjOex9+NfGVgyb54zj8KFj1YrMJ4Ych+E8n+jQUaK/
	bR+Bxh+1DQ2xNC4rSImymWXkE26uKkgmoSnqPwMyAw==
X-Google-Smtp-Source: AGHT+IEawkZYdwbI+WbEmvl6/oFkEe+J6/ZW1BQWkBGISjtB0tFepfANcLAkRTa0STSt8Gtq0Gk1Dg==
X-Received: by 2002:a17:906:5354:b0:a1d:4f1d:fe5c with SMTP id j20-20020a170906535400b00a1d4f1dfe5cmr1131007ejo.122.1702288909482;
        Mon, 11 Dec 2023 02:01:49 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id li14-20020a170907198e00b00a1f738318a5sm4009502ejc.155.2023.12.11.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:01:49 -0800 (PST)
From: ecordonnier@snap.com
To: docs@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [docs][PATCH v3] manuals: document minidebuginfo
Date: Mon, 11 Dec 2023 11:01:41 +0100
Message-Id: <20231211100141.504795-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Dec 2023 10:02:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4672

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 documentation/dev-manual/debugging.rst | 15 +++++++++++++++
 documentation/ref-manual/features.rst  |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index fea2cb30a..b12dc284f 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do the following:
    Consider that this will reduce the application's performance and is
    recommended only for debugging purposes.
 
+Enabling Minidebuginfo
+======================
+
+Enabling the :term:`DISTRO_FEATURES` minidebuginfo adds a compressed ELF section ``.gnu_debugdata``
+to all binary files, containing only function names, and thus increasing the size of the
+binaries only by 5 to 10%. For comparison, full debug symbols can be 10 times as big as
+a stripped binary, and it is thus not always possible to deploy full debug symbols.
+Minidebuginfo data allows, on the one side, to retrieve a call-stack using
+GDB (command backtrace) without deploying full debug symbols to the target. It also
+allows to retrieve a symbolicated call-stack when using ``systemd-coredump`` to manage
+coredumps (commands ``coredumpctl list`` and ``coredumpctl info``).
+
+This feature was created by Fedora, see https://fedoraproject.org/wiki/Features/MiniDebugInfo for
+more details.
+
 Other Debugging Tips
 ====================
 
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index dd14339bc..b9d3b30f1 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -161,6 +161,9 @@ metadata, as extra layers can define their own:
 -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
    during boot).
 
+-  *minidebuginfo:* Add minimal debug symbols :ref:`(minidebuginfo)<dev-manual/debugging:enabling minidebuginfo>`
+   to binary files containing, allowing ``coredumpctl`` and ``gdb`` to show symbolicated stack traces.
+
 -  *multiarch:* Enable building applications with multiple architecture
    support.
 
-- 
2.36.1.vfs.0.0


