Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web12.710.1583771642332330952
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=roTZoxZ9;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id f5so9248530ilq.5
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IUQaYnM7cZ5ZotvAiDXpdTlR0FVB7RzAZvDyS1M6mUU=;
        b=roTZoxZ9AJaXdnoexwuZtNBAE4OiRSrKQTh+5lFjT8unp1DYSQeQSE4aZ+2doT8PuX
         TzWd607g8rjgG3oz7+vhgwchSPdhtQqZv6HegGG/I5m4qBekHv64vkoj71X3Ate1ZhTN
         JiGOSaK/iGoU2FEdr3byjiMcBuohQG51KPTkFIV2RS/Y/YgpR0HK83BTUoqdMrbfOkgJ
         tcY5oRK1f8yYwU81ZXlVn/2bFEj00/VszsSX/CxPPr5koKFnyhoTJWYZshJWPQpyJfmj
         6y7Xj1HSaqL2WYzlyxx8huC7Lv2F8mtmKxmuO5tlZvWf78lLrBU6AslU+ANykl78W3wX
         4feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IUQaYnM7cZ5ZotvAiDXpdTlR0FVB7RzAZvDyS1M6mUU=;
        b=aeKVjNGhMk4YoLrhVj6JbYT3XMS3KpTjdtz0DT5eTxumZ5yma2NV/n81jVGyhT19zO
         Y/4yk6brXuj8kOBW1OiGzTKHyt838YQRZvH9SVFDuXdTDs/whIyPmX+qePXjvg9UcTh4
         VnSWgvQR52AbRdAwq0cjOArUwvA2pNXcUx3zmG0RTOFC8Ndy1KjXr1AiAIzDKgcCVj9m
         HeiW1F2tym9H8oCtA+w5lXI0WUVsn9+Ww06ONvLMlV+CnwZi8k1LiEz4mOgZhckGwgmO
         0FuBN87nJwhLLicbUI/jUUXvICMzBFFJ3xkLQkibHLtDork1p8M13Z+JH3305epTeW7U
         0W4Q==
X-Gm-Message-State: ANhLgQ2LyUx9hpUDbi8fJVCAGIzJrTd10NDaXePPvE4m872kxBLIPBEe
	rSq7ynKKcWC0ca5DMpqOw7Q=
X-Google-Smtp-Source: ADFU+vsDmo1MBWn3Lmf/iO3hw7Ke2VF3nlCe4JrM95JWBy9SkROCbeU/hTUhHGfwmeAEJI1I9suj5A==
X-Received: by 2002:a92:8151:: with SMTP id e78mr10137402ild.227.1583771641811;
        Mon, 09 Mar 2020 09:34:01 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:01 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 05/15] bitbake: knotty: Add commented logging_tree code
Date: Mon,  9 Mar 2020 11:33:43 -0500
Message-Id: <20200309163353.15362-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Adds a comment section that can be easily uncommented to enable dumping
the logging tree. This module is extremely useful for debugging issued
with logging configuration

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/ui/knotty.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index a6a92b920f..aac12cd479 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -430,6 +430,11 @@ def main(server, eventHandler, params, tf = TerminalFilter):
     llevel, debug_domains = bb.msg.constructLogOptions()
     server.runCommand(["setEventMask", server.getEventHandle(), llevel, debug_domains, _evt_list])
 
+    # The logging_tree module is *extremely* helpful in debugging logging
+    # domains. Uncomment here to dump the logging tree when bitbake starts
+    #import logging_tree
+    #logging_tree.printout()
+
     universe = False
     if not params.observe_only:
         params.updateFromServer(server)
-- 
2.17.1

