Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.787.1583771646154961502
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 09:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Za/zPDgW;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e8so9216724ilc.13
        for <docs@lists.yoctoproject.org>; Mon, 09 Mar 2020 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b28k5IksuIOB5UYEOsckZR3pAhNFeHaSY6AkGtWEhJ4=;
        b=Za/zPDgWYX+x/xWJBo+kcQqTqkSOOy0YmrNzHWaXRfCXamPukgOsP+XZeJnJQZMSM6
         OOlnCZCfvHEDg2ar/YhvLN3DDb0cyGEv9nL0zwqlijX4YMZluzWwKpqV019NebGnPaZZ
         bgSGaDHiEMV9Dp1y/W0wjfpnRKk7Ad39KL3lWgMn2pbWzpPLSTo4QJJfWHEWIYYcZEyG
         v/En6ZS54s2uVeLDCYeO4Rs13VpF4mHtErx/NHcAfvKiCagVFNyblKLvJbr4WEBqD4yb
         V8kosMcwKaZCTvQHQ2JtjJ560rt7AQoWCMyrWbMOMAJLqJ5VXNepFA7Y/3MDt0gctQHi
         Es8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b28k5IksuIOB5UYEOsckZR3pAhNFeHaSY6AkGtWEhJ4=;
        b=FupcvWiadk2V7wVc7hMm39q+YeSYRZ5fyWS13LvZlUgf8drqZqpDBrR89qU3U/XBzz
         CBpLFQ4UIIn5DCx2cVG7/iPS5tDiDuWn7b0EmR9Xn9LUUOxD/0Zfq6fCE30elQDrUwpo
         /GoY/Jtj28BQare9XfM+n7rIZXsWsT2/oZhhgqRv2q9DqDHcUcZ0bGSg+jIb0F2TP+pc
         W4S6gRjSdmpSVfFqpHC9kz7xPYvL74z76IvBLGHSp/ZOEB05gwD5CY+6NsEM/CZnhvFh
         OXf2W4q6lzh6+rD1RybTG/R6PwocnWTqbaqE+iVRQ+dNuItOiIpKUeoBGTm0nc+8KEtb
         hvFg==
X-Gm-Message-State: ANhLgQ2sOwYa7cDDTv4oKSiJwK6LmHhM4Sb9EnwOaHEU7mzAPuMYwVoh
	Ks9wSLYiY9trcacPPaBBePtpazJq26A=
X-Google-Smtp-Source: ADFU+vvmyXSFXQ/mraWG7Y9+tv9LNxsBsbwYVGg4yNDT3qs+1k/V0JDtLPDJptDN9rs5kaz0i070jQ==
X-Received: by 2002:a92:d09:: with SMTP id 9mr15200985iln.191.1583771645606;
        Mon, 09 Mar 2020 09:34:05 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id q1sm15049593ile.71.2020.03.09.09.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 09:34:03 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [bitbake-devel][PATCH 07/15] bitbake: lib/bb/msg.py: Remove unused filters
Date: Mon,  9 Mar 2020 11:33:45 -0500
Message-Id: <20200309163353.15362-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309163353.15362-1-JPEWhacker@gmail.com>
References: <20200309163353.15362-1-JPEWhacker@gmail.com>

Now that the filter are described using the python logging structure,
these classes are no longer needed.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/msg.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/bitbake/lib/bb/msg.py b/bitbake/lib/bb/msg.py
index 8561826a6e..cab079e333 100644
--- a/bitbake/lib/bb/msg.py
+++ b/bitbake/lib/bb/msg.py
@@ -119,22 +119,6 @@ class BBLogFilter(object):
             return True
         return False
 
-class BBLogFilterStdErr(BBLogFilter):
-    def filter(self, record):
-        if not BBLogFilter.filter(self, record):
-            return False
-        if record.levelno >= logging.ERROR:
-            return True
-        return False
-
-class BBLogFilterStdOut(BBLogFilter):
-    def filter(self, record):
-        if not BBLogFilter.filter(self, record):
-            return False
-        if record.levelno < logging.ERROR:
-            return True
-        return False
-
 class LogFilterGEQLevel(logging.Filter):
     def __init__(self, level):
         self.strlevel = str(level)
-- 
2.17.1

