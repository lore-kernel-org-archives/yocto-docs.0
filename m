Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF60CF58C7
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:20:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.16003.1727270433688498951
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zLDhK6QJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso58709555e9.1
        for <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727270432; x=1727875232; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy7qz3UrZgT4PYqbwKRCy+QJBJjzB9evpk8DMsrusyI=;
        b=zLDhK6QJfehNvrLI0QjRoOPjRqTWOIksCb1YJkOp1iedLVLcRQ4GF2rf6v4QCcMV77
         /ghWykEpV3s1o2Nz+BXH6cDQlOJ+Kc2VIkcohm0L5kupMPYJu8AIRc/itrkEVrHV15S6
         k6M0TtzAPrn+3kISMDvUIbnRM3lcPOuMloxeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270432; x=1727875232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cy7qz3UrZgT4PYqbwKRCy+QJBJjzB9evpk8DMsrusyI=;
        b=aR6jRwmRWyMY0Bht+HyjXQf5JbCwL49muOHRjU6VDvw1xPhT5lRs/uXK7Fj61PJo9r
         HAqDF2LVm5rINMazuY3qLuuR495SxHCbcItUTaRPV6qHV5Uemd27F6qPwz4C1tyYRA41
         G0tJMSYd+UvC2NR7EdPDrWb/7dz49aAWAtyGDbp2j9AHbUmkg+EvFBa1sKqwROsGkIjQ
         n3Fq1SWFpncSLyzYvrOmA0ja1kZCKOJtPHxNs53wP/tnzfxmMEXYhXDbo8SQXaYlOad8
         S/QyhmmRG5ogTzRLqOBSAfsjrBX02RgauPAu75dgUATDX0etACgEqj3bEAwFdjAT2aA+
         QXSA==
X-Gm-Message-State: AOJu0YylEhBTDqIC1revB9kHngjZVtmHB74Dkiz8h7rVIu3pDE6wsB+R
	9JTugF/wBacw/R3MEjvEXHRp/nYMBc71JWzcVs0uiCai6qqDkdwZB+tQ5LhHd/z4SdAG9+JQJSd
	k
X-Google-Smtp-Source: AGHT+IFj+6FdGap5CRxbwHYDygKzevyZjrsy+8HbzI22J0H1Ll/6j4UcLa65+oLvMcv+qSwMs92KqQ==
X-Received: by 2002:a05:600c:46cb:b0:42c:b1f0:f67 with SMTP id 5b1f17b1804b1-42e96144f67mr17795935e9.27.1727270431642;
        Wed, 25 Sep 2024 06:20:31 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddad1sm18808675e9.9.2024.09.25.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:20:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 3/4] release-notes-5.1: document fixed _test_devtool_add_git_url test
Date: Wed, 25 Sep 2024 15:20:16 +0200
Message-Id: <20240925132017.3427438-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240925132017.3427438-1-yoann.congal@smile.fr>
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 13:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5370

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits:
3c05286fa10 (oeqa/selftest/devtool: fix _test_devtool_add_git_url, 2024-04-26)
268dfbd9491 (Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2", 2024-04-26)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 3d5a885d3..d6c72c5c4 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -36,6 +36,8 @@ New Features / Enhancements in 5.1
 
 -  devtool improvements:
 
+   - Fix _test_devtool_add_git_url test
+
 -  recipetool improvements:
 
 -  Packaging changes:

