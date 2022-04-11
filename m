Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56508C54F3F
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.28031.1649675847978426163
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 04:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GJLjAbhs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e8so6099057wra.7
        for <docs@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQNVuHBu97IymUg2KQpxmi3fkLVQ84fb439oh1ftGZ0=;
        b=GJLjAbhst9atKa9BpGJ2Xais/xnAIu+u/2YI7hF5SjRzxDIL3+M/PXwmGq0g+d4TXe
         sGgE+ay1Vl86e1YMIkbpFef8c1/MMAUR3+K/B5QTwEUXG+gbKdthPyGLpAEiXgLTRh5y
         DaLdu/7Q9lftSBqthhllPnHrqaeFZtW+0AnbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQNVuHBu97IymUg2KQpxmi3fkLVQ84fb439oh1ftGZ0=;
        b=3wPeW97a2NEXPTbR2WCYoLIGrvACDVknwhI2qHMkmDdLPoixT5gzvvyUFY2KgE15gI
         VT96F92ycIteB5GCwpUcyZVNcSIJsF+eVsUzCvYevtwmXBlKnyCoVeR7wGFlO10asuQ3
         QRyNslsckSXP/a3r6H8sMFwbH/6JO5JDGtNkoefPFxRrh1RCbrT9dzht/F4/JG8EpN2J
         JXNHk2hIAP5ydk76TOeURv1Rr4y4K9HL9FMsdOqviCy0/VCjun/oGl2Mei7mkiIIDDu9
         91ld5ZckNM2tVpTHjwbSZswLQoXNxpXCkRRIG6/eg+je5I7cyGUvsiaMcf6K4t0UdtpF
         goXQ==
X-Gm-Message-State: AOAM532Ld0oxrM715d9mWpWl4lSHvuz3LgawG0vumvn77isYU3PV8tWX
	p82XXyMoGvju3NY4CCHtc352ikZX8mmaWA==
X-Google-Smtp-Source: 
 ABdhPJxBVQSQ+KfHpB0Zu6kbbxdTE2lRWtVhgSWuTMy4IO7s8cBbIjEcr1axYSKiTWvh6p0Zb2OBoA==
X-Received: by 2002:a5d:5248:0:b0:207:a421:1a26 with SMTP id
 k8-20020a5d5248000000b00207a4211a26mr5419786wrc.271.1649675845933;
        Mon, 11 Apr 2022 04:17:25 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f8d9:779e:103c:69c3])
        by smtp.gmail.com with ESMTPSA id
 w5-20020a7bc105000000b0038eb9932dacsm3485149wmi.48.2022.04.11.04.17.25
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 04:17:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guide: Kirkstone is now 4.0
Date: Mon, 11 Apr 2022 12:17:24 +0100
Message-Id: <20220411111724.2076095-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2759

Update the docs to reflect that kirkstone is 4.0, not 3.5.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/migration-guides/index.rst           |  2 +-
 .../{migration-3.5.rst => migration-4.0.rst}       |  4 ++--
 rename documentation/migration-guides/{migration-3.5.rst => migration-4.0.rst} (98%)

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index d45ba31e7..20c6ab9d4 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,7 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
-   migration-3.5
+   migration-4.0
    migration-3.4
    migration-3.3
    migration-3.2
diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-4.0.rst
similarity index 98%
rename from documentation/migration-guides/migration-3.5.rst
rename to documentation/migration-guides/migration-4.0.rst
index 8a4c56874..202999ece 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -1,8 +1,8 @@
-Release 3.5 (kirkstone)
+Release 4.0 (kirkstone)
 =======================
 
 This section provides migration information for moving to the Yocto
-Project 3.5 Release (codename "kirkstone") from the prior release.
+Project 4.0 Release (codename "kirkstone") from the prior release.
 
 Recipe changes
 --------------
-- 
2.32.0


