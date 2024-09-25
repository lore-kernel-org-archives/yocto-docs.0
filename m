Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD3CF9C6B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:20:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.16020.1727270434163488815
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aVfpUn9K;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so58804005e9.0
        for <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727270432; x=1727875232; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgY4sc6UmQu+Yf/If987dswsaD0qIIPk2MKgKnwp0uE=;
        b=aVfpUn9KJlCCYYYHpHcG1o2y8eQwYkPMhb0lrgPfkJvIsF/93fqHCr01aLdqINySQm
         dq81SioJ1ufURdYN9+vxHnmPpi0NrgbHUITqLpudUEujswfKC4TF8yZDqjYq0YeuqaWf
         eBZiUCepCwYyBEVQQhLbvemt2SFNSpzCI9Xyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270432; x=1727875232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgY4sc6UmQu+Yf/If987dswsaD0qIIPk2MKgKnwp0uE=;
        b=eAJ2T0frEPdwZ/f5zm3VSypcZEDCrb2QcUwOFzHGJEx+xIJeE69B/jKjGgDA+0wFvS
         BqKQenv6Ok6vSgshVYaotZzBu33t48Lw7M5pLXP80EP6RRQ8N94AeOJnMSVHSOd+/hFQ
         8gdjF0IY9reJf6M1BYMZqi8vfzx2AsXhaF7wWih5kSlhi1mRihCKx5rADb7S0Nqu/A3Q
         C0IW9Jmm2j3E7sbRig6tnU2E1jrW7rMW1zZZmUodkuGFI0wO0oyUnZIoRHZxb/okVaVE
         GI7xpTcUvldaAH7MQG/mguxUp/hpQem035bPRAebbGatN/YBqvxXH+fuPrwFuu0+okyw
         gjzA==
X-Gm-Message-State: AOJu0Yzf8lGKcgXK0zTEgjHLTrWTQmg/YheCqfMriEtTmahi1zl1z8n6
	etj0ZRrQsT/rKHU9Rj1LeUHMok80QBsLnnWcg+8IuIEYOIV+Oy3/0/VKOq1c6Hu6AZL873JwxlY
	d
X-Google-Smtp-Source: AGHT+IF9+3TyDidBROOmA3wfOVw23JVW89NnwpjxHMZkZyNqdo+nOSJjL1f4Jl9i4ws4vflcSnlXlg==
X-Received: by 2002:a05:600c:470e:b0:428:1965:450d with SMTP id 5b1f17b1804b1-42e96116f70mr20221115e9.17.1727270432272;
        Wed, 25 Sep 2024 06:20:32 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddad1sm18808675e9.9.2024.09.25.06.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:20:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 4/4] release-notes-5.1: document spirv-tools reproducibility
Date: Wed, 25 Sep 2024 15:20:17 +0200
Message-Id: <20240925132017.3427438-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240925132017.3427438-1-yoann.congal@smile.fr>
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 13:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5371

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits
47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index d6c72c5c4..8b51f5677 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -50,6 +50,8 @@ New Features / Enhancements in 5.1
 
 -  Miscellaneous changes:
 
+   -  spriv-tools is now repeatably reproducible
+
 Known Issues in 5.1
 ~~~~~~~~~~~~~~~~~~~
 

