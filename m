Return-Path: <kichakarov0@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640F7104891D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 21:49:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107732.1772228980596513577
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 13:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5gMh432;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: kichakarov0@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4398dd671daso2740587f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 13:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772228979; x=1772833779; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=862J0+CPHGhNN0P4QxnqhqjtypGxdgbZOJXdQSea/6k=;
        b=P5gMh432lgc/HCIFsG2roBkXzMZ7IZTIkl26cILOKijQJrLOA+7cEUH5MhN8FzySq3
         NBGAEdP6LRi2oARj7FJHR+72sr1szPKtgnq4Bj3kxHkEnVu5n9Lh387Qw2PMU0ryUMUY
         1ZqMKmiMCsMj3m3URIcm65eFTQlrCeRQuupdEZuItv/z/AcgYy3A12GUV4MkfwEaQc2B
         n6F8wiueYk464DVUIQ4YgfWdjq+XbX9T68zGO8Zq8PVpPDAt8bA4Of8jwCVWBrIB4d96
         6GOXNrz0LojA/s5pHqlhOIq5RjtDcqk2xj7ar5k2CU9bS/Fwtt2aI7foLS/eUnzirym+
         lLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772228979; x=1772833779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=862J0+CPHGhNN0P4QxnqhqjtypGxdgbZOJXdQSea/6k=;
        b=U39nK0bG/gihBDeBhdyaneiXDRdep3yd+QmAQc/xP2sdG2D/SGn/t6ln7ExeMV7uqr
         la3l97nf5jfp2Kvjf6FtXWD40z6vufMHwmfuGLU6PW1SAKhaRYgHyAJt5hX/fTr3YU/q
         endE7qwxaau2VO6jxxaeMG05JeUwPOlKGreQdLDT1CXVzlRx+zFgNLPijcOr7wokFajS
         GDKkS4l5kUGhCFGZ4OeMaHUDaUeuQ8fuG5YIjfL14dglQgu8bM+6bORcgCJxwYNZRvni
         S9xZQdK5owoSHEAS0+r5vQ0VYv9VfwdYX7wRaMNGcVi0TtV/0WhoOQuacOj5s38spIkW
         7hIA==
X-Gm-Message-State: AOJu0YzcQMsa3SQDGRdsR8uApkv7WQhDfBh3HYL3LyW3fA0cEpxFuZwO
	3oyZ2CR98KA2wXR/cFwW8hsfIn1TVxQLHTtCEou8Y+ZZNRM5Hb5Q8AWVsFgkqdzkFHQ=
X-Gm-Gg: ATEYQzzDP4vDdqtkhqUiATPLTjs1+jJ58mCNtAWUHD9xdSbMF4ISnyCc6FamYuZRUJ3
	gLNCyVhn1ChjA36ngcyx9DP92AchAI5QK3jn7hwkuGjzIEOBzJPIINX9a+Da+xVOeGucH56G4XC
	0gZvNTNFxfLOSctsEFM24Zb5dQZSRt1U1VyB6I7JkWVvT/YqYZOjFCmpM2+Omz0tkNygKw1uunK
	2VGIlgWRtgKYSqhmw/NBMr/xVlIdmyLCr6pDuXuZ26hDDRmRstCcVX+6I943Ti41LHsV64cItBC
	hS1ith3KnYjJNL8vVvDya8u78YNNKm/KWNVaPcRyme2TFm3KY3Iqeehqc4WnSfL/KXaP8/E97ZX
	s7yBFF0QqlqAP5R/51zDfwi+FgQBFurZ8zStEoXsi8fBQvX2O7uwlAe33pVBFrQsveqGjaYSWNM
	AweRVd2Zm1Lj7qa4g8LAk48RonMnvKcc26SeICasVVBcMrOyaSu5pexg==
X-Received: by 2002:a05:6000:24c3:b0:439:8ddd:90be with SMTP id ffacd0b85a97d-4399de14ff7mr7490105f8f.24.1772228978817;
        Fri, 27 Feb 2026 13:49:38 -0800 (PST)
Received: from localhost.localdomain (79-100-209-27.ip.btc-net.bg. [79.100.209.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c71b498sm9685533f8f.15.2026.02.27.13.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 13:49:38 -0800 (PST)
From: Kristiyan Chakarov <kichakarov0@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Kristiyan Chakarov <kichakarov0@gmail.com>
Subject: [PATCH] overview-manual: escape wildcard in inline markup
Date: Fri, 27 Feb 2026 23:49:35 +0200
Message-Id: <20260227214935.15766-1-kichakarov0@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 21:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9016

This change escapes the wildcard in 'recipes-*' to properly italicize
the string

Signed-off-by: Kristiyan Chakarov <kichakarov0@gmail.com>
---
 documentation/overview-manual/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 2655b0d3a..cd3d09910 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -410,7 +410,7 @@ typically find in a distribution layer:
    (``conf/distro/distro.conf``), and any distribution-wide include
    files.
 
--  *recipes-*:* Recipes and append files that affect common
+-  *recipes-\*:* Recipes and append files that affect common
    functionality across the distribution. This area could include
    recipes and append files to add distribution-specific configuration,
    initialization scripts, custom image recipes, and so forth. Examples

