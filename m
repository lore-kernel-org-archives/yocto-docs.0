Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD24D6ED2B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:30:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.10628.1732195830043954585
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HwUAMJD2;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3824446d2bcso803821f8f.2
        for <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732195828; x=1732800628; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8fPj8DP3GcWupGdGkXM9dF6OVFtC6EYjGK6sPTvpDg=;
        b=HwUAMJD219dSh+UMNVZLCo1uFVhX2l9xdxKi+Cq0CMNGnGT8OHtGPpbHK7j+6dMKve
         NY1Qvi94sPgssOYTtlhb94vwpAtIOVPfvNti9XbPPevD5JGBXAhoBwfoNy4qNQ1hUJkB
         wjvg9mIFmxwkGSV0+z2bgbCRPnmcU0I5CTDEPi2RihH7HNwkl5HVXdX7npBfXDHCRTpd
         dl9tKkCr9Vf8JO8KSqCMI0TQ+V312BaQwgUpWGq3is3pHCDhW8eupMYYnTSXC9g/V+oz
         hJCVYSDIt4sLdgdweSLr5Pz1Ho1zp3/xT1iLCKAnxmF/beAhbP7j4Hqe0B+R+2mKxv3Q
         7IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732195828; x=1732800628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8fPj8DP3GcWupGdGkXM9dF6OVFtC6EYjGK6sPTvpDg=;
        b=bsK05+KdYnuD0en4wEgq6YLZe1WeFMInXfQxriOHeq/P2mCbEhQz0StpQ777In9BCf
         WC/YZarlljvI1OYBpWG1FZqtqNCjlOEwG5H7/AwJ1+HQiw7WlqaxuNnE7FR/KHp1KIX6
         MsAZH43H6INaQBSix7T8vGZPV6HfnQMj+VXnGSJqKlYhNb5cyRYQNo5dBmsdlLEXrGjd
         r8yRN25O13CzYicmtQB5IkKsfpeUcF938PIHVOmw04rfPNBLa7o5RfRrnHPP7RKhLA7m
         jNrs+aCURfgvbZufPPbGEnf3iJnirYUUQZYDFHIsSDUdBPvL0x5F5gF6+114GZyBMJBd
         uvLg==
X-Gm-Message-State: AOJu0YxIIbQW9f+ARQITZqw1ipVE41AHzaLgtWYWashZMcLloKQi1UYN
	VnEregM+xW0kKb/RPMEG8kzargmywzDtAT79hYiPCZq9LS6rYfejKjFqOw==
X-Google-Smtp-Source: AGHT+IEeyP7Tt7l9KHrkytN9MV1EHsYCP3Pk+L2MaDxWWYuEor/bFfvF+gV81dDuyDV2ZANQapXW1w==
X-Received: by 2002:a5d:588d:0:b0:382:4be3:b2bf with SMTP id ffacd0b85a97d-38254b13fd8mr6192122f8f.45.1732195828221;
        Thu, 21 Nov 2024 05:30:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493e975sm5189415f8f.88.2024.11.21.05.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:30:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/3] ref-manual: merge two separate descriptions of RECIPE_UPGRADE_EXTRA_TASKS
Date: Thu, 21 Nov 2024 14:30:23 +0100
Message-Id: <20241121133025.1064006-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5786

The second description was added due to confusion over the variable rename in oe-core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/variables.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 43f4d7966..30887f12c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7130,11 +7130,6 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
-   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
-      When upgrading a recipe with ``devtool upgrade``, the variable
-      :term:`RECIPE_UPGRADE_EXTRA_TASKS` specifies a space-delimited list of
-      tasks to run after the new sources have been unpacked.
-
    :term:`RECIPE_SYSROOT`
       This variable points to the directory that holds all files populated from
       recipes specified in :term:`DEPENDS`. As the name indicates,
@@ -7165,7 +7160,11 @@ system and gives an overview of their function and contents.
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.
 
-   :term:`RECIPE_UPDATE_EXTRA_TASKS`
+   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
+      When upgrading a recipe with ``devtool upgrade``, the variable
+      :term:`RECIPE_UPGRADE_EXTRA_TASKS` specifies a space-delimited list of
+      tasks to run after the new sources have been unpacked.
+
       For some recipes, after the new source has been unpacked, additional tasks
       may need to be run during an upgrade. A good example of this is recipes
       which inherit :ref:`ref-classes-cargo-update-recipe-crates`, where the
-- 
2.39.5


