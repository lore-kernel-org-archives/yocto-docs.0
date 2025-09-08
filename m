Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D03CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 14:01:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.14480.1757340055747531668
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 07:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ffiNc49T;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2932837f8f.3
        for <docs@lists.yoctoproject.org>; Mon, 08 Sep 2025 07:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1757340054; x=1757944854; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q1w7ZYb1jY5Wqk/z5pHakOkMM2heezIYBnDvgjN/a4=;
        b=ffiNc49TjH6r3ijSV9jeOewTz35v5Fr+svlrReLPiSivyj1e0jKdj45a6t5EIdzU1S
         P4zYA3a2/78yHz6s0u9UNrTEilLTR2dhmMbBDDR8+GJjKNqu9juX152naaa9SscN/a5/
         xCF+RLU5dYNFdjMDVvQvPAPd2cilNNGJ35hmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340054; x=1757944854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8q1w7ZYb1jY5Wqk/z5pHakOkMM2heezIYBnDvgjN/a4=;
        b=ccntCHbf59dPa0OfxV100qh5uzvYGCb2LHAVF+zGWrVdYUXa0d8FrZplGX0UbIIQcP
         RuHdwRUtZmbFrp/my59phRgBYSiXNCmQ9PwZ1xad6Z9zNjLcoVqYtGXRHEx0WAopsI9H
         fVcq60vk/sJz0g7w3LIj+hHS3BAbHTcE4wFXuEAuypWwm35DsrD0Wcu8J7FJadUJlZ+r
         tkny3pjAwa8aRAqA/kbZMlf4as4caU2QCQh/z4tvu5+Cyej2RCHeLD1963YnMt8sbrUd
         DJbQYyS0YK0CO3CIlFWxkvUL7MkJvXE8l8gxKLO4EsvL/i9ugrolrgiQ26shBK47lMVc
         2kWQ==
X-Gm-Message-State: AOJu0YwQV4B+zgNmXedoPJLjnAsiKJdtQV7w0V3X5GSgcimEJvGt18sj
	DybfnpU8zKv0HXAGg2VNrbG/TbqYvKOMY9w7Ync8WreUOw4aHm+JFB9sWVcI6GYwLLM8zK5CAxd
	Xm8DS
X-Gm-Gg: ASbGnctdWsg5lvMASj3oVqFshY6eRVs00MVKKoW8ODCYYFPmKZpElcokpxXgz+2G8+j
	6DPe/mRypXU0D2ou7UUNsy3jjvxTYfzOPCrEy02XEEBzqREdE3iymvfa6foNFqtw40VlyX+ao2w
	uUOAlzl0tJMWNR6Qs7c8+Xf5muZu6gzMDHLQ/+7I7BoTSSi60Tr+LkrZ0WXacpTDdZpJd8CiZPk
	Th9Gm8vPGkLxpm3Pph79zMs0LNCWiUxXvt9vA8gl1KB0RjYY/gVkJY+dMyS/azHw123ENuqHBLv
	sd0HBNpY5F5hKW6PnOZWmMm6ZHXvYf62V+Nm7j42zLasMXVgbJiwuoXbDES+UW3HcOcxK4UPpHA
	3O0soODrP7vBQTtZJgPEPaEarETqYCwZi9gb+d80nIJuk+Jzy0wLeF3D1PYuKInF2EpQPjhtsjz
	/sFigpGEM1Dgof2C+IJq/kwlxrtmVy64nsw7Ihgolb
X-Google-Smtp-Source: AGHT+IHwIq4TTBF+eNlWRAufbq2YoBcZfkpZndiBabhxKIONIE3VtkaZlb/5zMEYMlZlTPLtICvVqQ==
X-Received: by 2002:a5d:5847:0:b0:3e5:190b:b04e with SMTP id ffacd0b85a97d-3e64317fdd0mr4948644f8f.37.1757340054002;
        Mon, 08 Sep 2025 07:00:54 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000301bd0008156b32089b8a82.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:815:6b32:89b:8a82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm21938924f8f.33.2025.09.08.07.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:00:53 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] migration-guides/migration-5.3.rst: wic option extra-space renaming
Date: Mon,  8 Sep 2025 16:00:47 +0200
Message-Id: <20250908140048.352088-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
References: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Sep 2025 14:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7488

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

After commit 47533f20a7ec ("wic: rename wks flag --extra-space to
--extra-filesystem-space") in openembedded-core, document the
renaming of the Wic-specific option extra-space to
extra-filesystem-space.

CC: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 documentation/migration-guides/migration-5.3.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 97e41605f..805b2a409 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -247,3 +247,5 @@ Miscellaneous changes
 
 -  ``xserver-xorg``: remove sub-package ``${PN}-xwayland``, as ``xwayland`` is
    now its own recipe.
+
+-  The Wic-specific option ``--extra-space`` has been renamed to ``--extra-filesystem-space``.
\ No newline at end of file
-- 
2.34.1


