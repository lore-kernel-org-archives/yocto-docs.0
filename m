Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web09.10828.1625836952475034599
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jul 2021 06:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bPS9LVFX;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id f93-20020a9d03e60000b02904b1f1d7c5f4so8589599otf.9
        for <docs@lists.yoctoproject.org>; Fri, 09 Jul 2021 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZAJpUiofziOwbOhPaczkzzUUNXnGAzjOu+AMNIkxdrI=;
        b=bPS9LVFXeQc0GrVg4pIuO3tD/nd62OH2WTyxfr+x9wLNoBKnB8i6MnVDifMcS+cRKU
         LDhcXXNuET8tSBof3oVbfTAMzCh/BlNieiWOf71gFUWHwzSu/URwqomGKS7m0RxSPG/C
         XoIMPNqtw2+yxs0MHCLY9KDxbaSsle78egQMRKe+gOk5jpCgRuxCRVHBnIvQo4KmLqAD
         jGUvtCSZcRRJgbH7FhqTwuLZ0i46+BUSURVfeOztiUOohaqIwtZsTOVkAP1J77O08DGq
         cyOi9R2C21VNwLhZ/Xhzk9MwD1Tw8nB1fA/1sYWBmoHSbqKiD2DxJP7qJEoFXP57kIns
         bq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZAJpUiofziOwbOhPaczkzzUUNXnGAzjOu+AMNIkxdrI=;
        b=JY9l8kOVvGC9WWX67sOW5E2jAykPklowxbDQazCGkjxw9pwwmXTolgsuF//d/z7+/K
         bqSzFaKr5euAGZ49OSCUNCuHolcN22FUGMCt5P7J1AbdcbOzj89rs+nMotqeedYzJ9qF
         3EleUlBj03eype0oUHqGiKQq0TGwGQkmteR4mv1Wah3667Y5FJ5pANGzWCMVrjRLX1pB
         cmcz3iNcG88tBXRbX2GcItuJh8Hc2oTxGWxArIAUF5XRLZJVg4ESaZ5LfBZ6WdxkODTC
         zoKDP/WkRbN6iO0A1giGjjUp6ibZRous7D0XcNtGlZz4c7uLflraB2+YM6H5Zpo8icW4
         ubOw==
X-Gm-Message-State: AOAM532DMe5CqkdzIkGV3q2Q704nayOv/jvneZ4ahkfCZhYmhzv0uZjq
	UJfCmnbh+zGBCE5t2gMzIxnUeKrNxug=
X-Google-Smtp-Source: ABdhPJwgl0XjjmmuHEobOol9qJ5dAfSjrIk6QoQFGpTkBE4yVOXesKqj0PvzmOt82kXk+NjKCIoymQ==
X-Received: by 2002:a05:6830:1bd8:: with SMTP id v24mr28448322ota.343.1625836951589;
        Fri, 09 Jul 2021 06:22:31 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id t15sm988542oon.3.2021.07.09.06.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 06:22:31 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] ref-manual: Document BUILDHISTORY_PATH_PREFIX_STRIP
Date: Fri,  9 Jul 2021 08:22:24 -0500
Message-Id: <20210709132224.35196-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71c2e11d9..f78b3beec 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1021,6 +1021,20 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 
+   :term:`BUILDHISTORY_PATH_PREFIX_STRIP`
+      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
+      class, this variable specifies a common path prefix that should be
+      stripped off the beginning of paths in the task signature list when the
+      ``task`` feature is active in :term:`BUILDHISTORY_FEATURES`. This can be
+      useful when build history is populated from multiple sources that may not
+      all use the same top level directory.
+
+      By default, the ``buildhistory`` class sets the variable as follows::
+
+         BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
+
+      and no prefixes will be stripped.
+
    :term:`BUILDHISTORY_PUSH_REPO`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable optionally specifies a remote repository to
-- 
2.32.0

