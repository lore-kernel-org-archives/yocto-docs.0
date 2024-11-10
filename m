Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB69D5E39B
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 10:58:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.34329.1731236275356881241
 for <docs@lists.yoctoproject.org>;
 Sun, 10 Nov 2024 02:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9F291wX;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: bhstalel@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4ee8d15aso284609f8f.2
        for <docs@lists.yoctoproject.org>; Sun, 10 Nov 2024 02:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731236273; x=1731841073; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BvUWRNM4+aeWmt/EoLJHBVR+KdTNss4w6RRP0RteANo=;
        b=N9F291wXE3xE2Jlh+QcobqoR8q/5UtaZr34icHx6hJr/laehKRFN+ClKCb3K4fTg2o
         I/5Z3+5sNuMun1SNWJC59IhuiEY8o3Z9AyqJnoH6G99FtBRBhFg8sW2zrMibQ7FzZ8XB
         3IFNt+qU5fuj+QBVU8KcL1u5k08f3WNYWTvGXK0B7gWU6rxpNv8ymaEzL8yrP0qeg+G2
         rcZBKlXTzwQojnHuOUlO6Hv5Q7t6Sb2DFBN0R/x6rxs9uFF7sEeyrup72fdTPkYKbYIS
         SH13YDjt5KmiodLpbrrlP9ka7LAdUSUA4omRdZ4eYvlCQg5kN7s4kHhXJJvYQX5ClL2x
         LJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731236273; x=1731841073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvUWRNM4+aeWmt/EoLJHBVR+KdTNss4w6RRP0RteANo=;
        b=LiSI/lf05RFDCZuTApdjYuJ+pyoAxMest7QNWhnQ7k9xZwQ82IACOxgWIdeUyNlbJU
         ZHt3BDF/5/8NC3VSiU8gx/aif5IA0PjkUKhw+HtVHaviFBrv94h2RY5PmjWG9hVt7Awu
         F9GoovwL04P4S4ywhvd3JSO0qgEb3x/m/ZyLuITxKue1aXPA+JY6/LcErPz3poP9r9nZ
         FwlOZmEeOR6M+oOEqyuvFT4ANVrO9DstYqNG/UuqGDXI/h6KZpWOda+OSJ+y4EIdCO5/
         bLyoDpNUv4JmzMfUqQVOQGc8vpWDso/n6lAFkL49gy/WcKS+RjPEf7sI+Zg8LvBoNos6
         I+wg==
X-Gm-Message-State: AOJu0YyXAZlslWw7jDQ36mH1k8B8i1zvqTvTeAF2/HGrzbOYXCp9mjn0
	1V+SG/X4+J806zmRt8KJLO9yCFtUnYEpCGb3wpua+cKyRVbw4UocBEfj4PHvUqM=
X-Google-Smtp-Source: AGHT+IGlVMAJk7u86bueZBrmqQIGmt4ZpxXkLtCodRSkzxbAGJW4nxydWlBbc6a5Vj24uaRSlVZoHQ==
X-Received: by 2002:a05:6000:1863:b0:37e:d930:1d9e with SMTP id ffacd0b85a97d-381f15c1287mr2855009f8f.0.1731236273206;
        Sun, 10 Nov 2024 02:57:53 -0800 (PST)
Received: from bhstpc.. ([196.176.193.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a1d8sm178343435e9.27.2024.11.10.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 02:57:52 -0800 (PST)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [docs][PATCH] contributor-guide: Remove duplicated words
Date: Sun, 10 Nov 2024 11:57:42 +0100
Message-ID: <20241110105742.567048-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 10 Nov 2024 10:58:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5711

Remove "and then" as it is duplicated.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 47a416b24..7dc8da7ae 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -483,7 +483,7 @@ typical usage of ``git send-email``::
    git send-email --to <mailing-list-address> *.patch
 
 Then, review each subject line and list of recipients carefully, and then
-and then allow the command to send each message.
+allow the command to send each message.
 
 You will see that ``git send-email`` will automatically copy the people listed
 in any commit tags such as ``Signed-off-by`` or ``Reported-by``.
-- 
2.43.0


