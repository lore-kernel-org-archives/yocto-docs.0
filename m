Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.758.1583771652775761353
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hH/dWKic;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id h131so9063736iof.1
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hCgIvHD59xsgRqfZMB6CTMQI4T85FazB2pSoVx1yVrE=;
        b=hH/dWKic9tKZJvlSezKvA1/R5xCNOAM7VgQFq3C2IaDeYLkQmY1via/U4H7zn5aY97
         DWl26sKHcV2Fb+55uYx2ZSXmLanO9nZYqO1nPbQeC8LysljDzUuEHr3oNrx/FHgZinyX
         D9cDKhi966z8c3cuUq3WcJy7O0ESojEQKd6FkXy4u7PNzhJvS+CeKKM0+760DOVPC2p6
         OkAnLujS7QEWWTx7FkM1ZBZJ6w8e0Q4kp1G/HejinC86JRko6vn2IDkC8uEGLKW4GgUN
         BxzVmhflkXZ5N64pBwRv/EreHJbiMgmkIUS1jiO8dOE2Mu6+Bx8PehoLZusR4bIv6IV4
         Cn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hCgIvHD59xsgRqfZMB6CTMQI4T85FazB2pSoVx1yVrE=;
        b=YAEuW0uBGOihvGyJQJJUJ5qmwYaDPGmMFa6cp1CORExKsnzEBreIhrA9HkDIQ7IRRJ
         WxCDFvV5SQsix6Lid7szavdksWMfpWl1VAxjibVhzq74294fJJIdcvCdtEgBMOvdTOcq
         tbNypxxQskcosbmAzzzdjKql8ukQFONoykW4hUZPct81xgYd3xxLbRQ1tJJcPJmF11Qe
         O6JXugtBQGtQdcl7F/C96DdFZXz4mK5BTUJeiQMd4GPwu48GjM5djlKocXPvQ69teURN
         xbCkliliw6ef00Boz69RvPreI6uWucQCClnWcpo0m2n59tLEQwZld25PSBIcXj2J6YV2
         gyKA==
X-Gm-Message-State: ANhLgQ0MN83ofZvVpUR22S/NTLv6ENkdn8Pro/4KlbwmyZOJ/kRnR+8v
	butFz9yMTFgztrsYECR+NJk=
X-Google-Smtp-Source: ADFU+vuCU6/O6/5itRtQqNzLZqweth16lsaVTahf2Gb3x/mnNCVIAC6bftU3FZGw8HnDdH/kA/ZNGg==
X-Received: by 2002:a02:8184:: with SMTP id n4mr16069273jag.31.1583771652260;
        Mon, 09 Mar 2020 09:34:12 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:11 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 13/15] bitbake: Add autobuilder logging configuration
Date: Mon,  9 Mar 2020 11:33:51 -0500
Message-Id: <20200309163353.15362-14-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Adds a configuration file that the autobuilder can use to capture
interesting logging domains above the ones that show up for normal users
on stdout/stderr.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/contrib/autobuilderlog.json | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 bitbake/contrib/autobuilderlog.json

diff --git a/bitbake/contrib/autobuilderlog.json b/bitbake/contrib/autobuilderlog.json
new file mode 100644
index 0000000000..103a1141f6
--- /dev/null
+++ b/bitbake/contrib/autobuilderlog.json
@@ -0,0 +1,27 @@
+{
+    "version": 1,
+    "handlers": {
+        "autobuilderlog": {
+            "class": "logging.FileHandler",
+            "formatter": "logfileFormatter",
+            "level": "DEBUG",
+            "filename": "autobuilder.log",
+            "mode": "w"
+        }
+    },
+    "formatters": {
+            "logfileFormatter": {
+                "format": "%(name)s: %(levelname)s: %(message)s"
+            }
+    },
+    "loggers": {
+        "BitBake.SigGen.HashEquiv": {
+            "level": "VERBOSE",
+            "handlers": ["autobuilderlog"]
+        },
+        "BitBake.RunQueue.HashEquiv": {
+            "level": "VERBOSE",
+            "handlers": ["autobuilderlog"]
+        }
+    }
+}
-- 
2.17.1

