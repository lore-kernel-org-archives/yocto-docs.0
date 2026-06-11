Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704B3CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 07:33:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40255.1781163188131340387
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 00:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TWugpypW;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3637b90so65217715e9.3
        for <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 00:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781163186; x=1781767986; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bj9FjLNgajJT0S3eUtzfOpvpc8XEq0a7f5pVNlXSlQc=;
        b=TWugpypWEqof1YROl3zkf6do5TndSiXfqk6EMHS5/kIYzdDAOXtzF4ZfaxpKgT+vFo
         651tMz10Yff4KyayfwLxVvXOlQyUTgBrYptkKRc6a0jfQJujKKjNPD0gnaALOAaPKQic
         BZLwrq2hLmGhmzGPyHQYmjB61Ul10Bx8pupX3rWCRaVL6DfPIOFeHw+B0n6YPx4OiQvv
         dYJnA+DgAmSTCBfO8Iq2QMzZbiIJtD1d0hSc7wf/0v00B1IcUuJoI20Etxy7K5jVD7IM
         7mRSrER+klu1My8rbIgaiLcwQixvvRfH9ZMV9yJSCyAn4J3nTqMi1ys+nvQ+KJNqvm0B
         bVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163186; x=1781767986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj9FjLNgajJT0S3eUtzfOpvpc8XEq0a7f5pVNlXSlQc=;
        b=OJdd7vlavU6LmTI7ZbAYxJmoNzEVKvohpKZhdT5KEh54oFv3MDEXy7XOVeDNMspoh5
         ti77IftcPdP40JuBm2ASXTiFd39iCyHbMnxCDuTb9HiYqHAfizgfO4KVrj+OCQNWHPRh
         FuvUxoN/gvcZ6C+CXXepP79tGGxaJ8V3xVUvMH5mpMA3bZVXGt+4FvtHgEZ4fnwFqwRw
         gzLvKYNmS/6bjr20EIW++/aJx9Mij5crncotGSAcPh6kXm5BvF4xAStH89pr6bEQqSd2
         eAne3OkDo0XLQ8Tom0jNGs2YL0ORJxaJIr0+QxvWewlYVXUMIXDo96OHUsKucn0JxkeT
         VhNQ==
X-Gm-Message-State: AOJu0YzB7tKCln+IjwTweqGx4oaeQJgAijxH8Ev3r/x9pZSqLPIZVuoG
	lM83wPSrkuo6GbsIrtNorwWFUKClk8LwmIEg8SWebQq6P5P5W2c7qbY2+Kk18agl
X-Gm-Gg: Acq92OF4fpHal3dHgfseasvBcShpU1Hi/FM80zQYbx6hpVlFFtY9uVYAsqyM5o8BsTb
	blcBSmc+kejP9GlgYpPGY75h34ayggvJnxz8EjRcLdUhN5+bWLA3OhYjbwUmigvIGBd8jDB8Xbm
	uCq6M3Y8PBYbYthJgBq2ep9D7usr56e1596K6aKhrwB4ShPtHAESHRUHLf6aQbn03yKs4/UUntl
	HCu4BWNGU3BAC7qsOsTSV9+GtlR+UFftNkHiWQleOUx25JwxHiTLbQRI4ZwEG5e80cJYaw5nT0u
	ALQuL03WE0QSHyWbwBb81GVNVZUOW0lM3Ajwg/2AFT2Q7q7xyrwob+FdBawD6OD4oQpIqkfWo19
	BTJNIj/VmKHtHhyDGcPzconst1pc14DQik4MQ6iwThYgKXEgSRIkKeKcnnnlf+QpxqEEveKBh9V
	TLXhfFNHxLXyhbafiNFkWzzqZyhYUTAReEZYo=
X-Received: by 2002:a05:600d:8498:20b0:490:bb3e:30c2 with SMTP id 5b1f17b1804b1-490e5604e5dmr11328375e9.18.1781163186213;
        Thu, 11 Jun 2026 00:33:06 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e5314f4dsm25902825e9.11.2026.06.11.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:33:05 -0700 (PDT)
From: uvv.mail@gmail.com
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] migration-guide: Fix migration scripts
Date: Thu, 11 Jun 2026 07:32:36 +0000
Message-ID: <20260611073236.879823-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 07:33:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9688

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The names in the find command should be in quotes, otherwise the
expansion is done before the find command executed.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/migration-guides/migration-5.3.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 8746141cd..9e6a5769a 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -83,16 +83,16 @@ How to make those adjustments without tedious manual editing
 The following sed command can be used to remove S = "${WORKDIR}/git
 across a whole layer::
 
-   sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name *.bb -o -name *.inc -o -name *.bbclass`
+   sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name '*.bb' -o -name '*.inc' -o -name '*.bbclass'`
 
 Then, the following command can tweak the remaining :term:`S` assignments to
 refer to :term:`UNPACKDIR` instead of :term:`WORKDIR`::
 
-   sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name *.bb -o -name *.inc -o -name *.bbclass`
+   sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name '*.bb' -o -name '*.inc' -o -name '*.bbclass'`
 
 The first change can introduce a lot of consecutive empty lines, so those can be removed with::
 
-   sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name *.bb -o -name *.inc`
+   sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name '*.bb' -o -name '*.inc'`
 
 
 BitBake Git fetcher ``tag`` parameter

