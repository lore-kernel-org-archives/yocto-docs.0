Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F7FC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:26:35 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.8167.1708500393443072191
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 23:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KbdvmZWi;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e550ef31cso22389866b.3
        for <docs@lists.yoctoproject.org>; Tue, 20 Feb 2024 23:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708500391; x=1709105191; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUqZsjzjFQHA/UKLi+Zq9/VjGCBoiIf3XRGm+e76foc=;
        b=KbdvmZWihJ0RehSqyT5a/xUHZw+LdOjovsO8H3uccnXWUREUDOItINTRv4KhI5eXuI
         0e/VguuOLtgY13GBowrqhYzL67WqCTTx95zBbVOVJ+0aSGul88zuq/SoCEPiHBv5cq17
         45pYNaEaHuhrMZnRZ7UlumfWlMJD1dVHDNo8zK/9dJPwjGDAJtPtDIH1xDfCRamJLKrf
         /n5yGBTTVYGJB+8bRU/vWEpJoPcheXRl/3eKnThggYx4VZmARIzDlR4YgvkI5c+DsJFO
         Wnyc8pP9sUJ+vrVzgMelQYLrMmt3om/x+BEnT+/nxlj+LbFONJH1rFLQEN769NU30T+u
         JaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500391; x=1709105191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUqZsjzjFQHA/UKLi+Zq9/VjGCBoiIf3XRGm+e76foc=;
        b=AMa1tpToc7YdEFlYLCatNUdpbwroqeS0V9MZA25ugWAu0hcgBIYn+lsxaVHyRkIvhV
         yN1DHagriW50kPnUUAFnZbFAnkfrR7x3Z0QZpNo4p9EUlOLv0DjUuxUy9LlThIBdn8/4
         QJ6I0Vlb9nnQUn5i5acy2p5Y0u8KPeb5t7NPdYC9IgXWqf3PptDZlCuyCcMoPDERowfZ
         1zA7/bxrjj036x20iXUqmlyOISDkWt/cJTv4OAi7q6izbWq2clPF/03DXNPlopwHIhSM
         4gRoZPyxgcroUjOoeUrXEA0rx8mgbqzHaik3w2Ps41ANNC4zvAWFDkToAuFuVr0zByJa
         gVMQ==
X-Gm-Message-State: AOJu0YyvGTWOOqBLFd2Xk1hchTtGLIrQgxKwC21uCyOyIAiYmDuuSKdp
	YwA73Hq0qRXSeCnrciPPq/5BntVXu53fcQZOlJtoH+WO5pdMyMibOjEhfmNHXglMaYg1
X-Google-Smtp-Source: AGHT+IFdg3bUkbFb6zXXkU4tmg9s3WJls4qHuVwpD15csafuB91GZTEWut3SaFtCUCyo3SVogjwOlA==
X-Received: by 2002:a17:906:604d:b0:a3e:b66e:d647 with SMTP id p13-20020a170906604d00b00a3eb66ed647mr4664824ejj.41.1708500391482;
        Tue, 20 Feb 2024 23:26:31 -0800 (PST)
Received: from slackware.local (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id an3-20020a17090656c300b00a3e77f93ea9sm3201634ejc.98.2024.02.20.23.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:26:31 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] manuals: kernel-dev: Fix BSP in recipe space
Date: Wed, 21 Feb 2024 08:26:12 +0100
Message-Id: <20240221072612.79402-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Feb 2024 07:26:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4852

File fetcher doesn't have destsuffix parameter.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/kernel-dev/advanced.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index bcaaaeed1..bddff1158 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -718,7 +718,7 @@ If the BSP description is in recipe space, you cannot simply list the
 form from your kernel append file::
 
    SRC_URI:append:myplatform = " \
-       file://myplatform;type=kmeta;destsuffix=myplatform \
+       file://myplatform;type=kmeta;subdir=myplatfrom \
        "
 
 Metadata Outside the Recipe-Space
-- 
2.35.1


