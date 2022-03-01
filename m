Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31EDC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:36:34 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.10442.1646152594408992486
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=irxraljg;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id bx5so14546862pjb.3
        for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ezFHqJK/2egnxZPbpdbJocbhCDzR7PXHVow0m58h7HY=;
        b=irxraljglMeMPZNFHIga9+bb8XxfjjMzsOSluLRL8vol443vmaq1lWJr4lZbRaqSYf
         2B0UA5H9MM5uTrhT3ggLWLUzW11rtCzl0o9kZgT+dfsELBBbMkiPhuU2aF3igotavGn2
         RZmvfdYWEtkRNJzcfod/7KQSXRlr/Fz+53N/kmOP7DognsR/7n3Y6GqoneGfF/mtIAoF
         +pDtluW+6tExgy3yGIN8iVZSauhRch6RySM+pLLml4psLit2XZJDUBzqL+aCMmd1176d
         r5/+FOK7PIrsjq2tvXhoTvJnZWrEa7Y130yFdlQszJicvUn7SK7BKKTr8ypbBKbhiS/a
         UscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ezFHqJK/2egnxZPbpdbJocbhCDzR7PXHVow0m58h7HY=;
        b=Y5zTKxr3T2eah8BQZomVjMPB/kKB0orwczOu6rKQxS5+aZgkt51LCpfqXb58CMSXZR
         b3ZuS+8x706ZkwF+xQ/ITNo0umFwkHNhs3YfesDTBIaLJy1VklrjZhzhgysCvAo3sk2U
         5gPy9pseml/uDpndbBQEcSzrbTGZhY2ErZJ96NlVPefHaxQwjut7nKBA3VPT785tI93u
         fTPMEOYs+2daeFwKQS/OGCgZ9KRyJa4pVYeNBydxFGIiGZMitgY09G+HtXCCDPA5CE2w
         qJneyH4j3DYgLLuKsYjSycdNFGvHyuJYdFfJWMm3nLuL/Ng4FUz4OoEIfNQERj1eXFAC
         avkQ==
X-Gm-Message-State: AOAM533P2C4L9Za9WfJB5kNcwwGTw9NqEwMCjfSlRPEkJAfJVu6P1ZB7
	Ej7yw62xpxXccYARpbzJ7+s2hNV3Cmc=
X-Google-Smtp-Source: 
 ABdhPJwuP9/EnoWoSjBvBIwXh2yJocZkDpGbvmMGwh5EK4h+GWZ6bLuXgPGF0enZobuBh49RsKNb7Q==
X-Received: by 2002:a17:90a:a382:b0:1bc:202a:28e8 with SMTP id
 x2-20020a17090aa38200b001bc202a28e8mr22775214pjp.131.1646152593478;
        Tue, 01 Mar 2022 08:36:33 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a63230b000000b00372a08b584asm13450461pgj.47.2022.03.01.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:36:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 4/5] docs: migration-2.6 drop distutils labels, terms
Date: Tue,  1 Mar 2022 08:36:16 -0800
Message-Id: <20220301163617.1543257-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301163617.1543257-1-tim.orling@konsulko.com>
References: <20220301163617.1543257-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:36:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2520

The distutils* classes and DISUTILS* terms are no longer defined so
replace their usage with ``text``.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/migration-guides/migration-2.6.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index c68414e1c..11e659de7 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -118,8 +118,7 @@ For names of recipes removed because of this repository change, see the
 ---------------------------------------------------------------------------------------------------
 
 Previously, it was possible for Python recipes that inherited the
-``distutils`` and
-:ref:`distutils3 <ref-classes-distutils3>` classes to fetch code
+``distutils`` and ``distutils3`` classes to fetch code
 during the :ref:`ref-tasks-configure` task to satisfy
 dependencies mentioned in ``setup.py`` if those dependencies were not
 provided in the sysroot (i.e. recipes providing the dependencies were
-- 
2.30.2


