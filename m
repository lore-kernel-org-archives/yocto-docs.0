Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328C4CEACF0
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 17:23:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.87564.1727803371041203608
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 10:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wEj3ENHs;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cba8340beso115105e9.1
        for <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727803369; x=1728408169; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8d0YmEYvcCDwpHzmjsLK7fzsi8BX3iE6UA8BBPn6h4=;
        b=wEj3ENHs62AkY28/mkJSHLVOdOZ5IQ9dGawXmYE7OuO6HiBtwZC9FkaRA/OIzkVkcR
         jNL87T3uB1jJXxnkBohl+dctJIxHqPYi9Te81xO5MypktY2JZQoN9dzG6pTMuqO1q4z5
         26EyydFcS05dz4BQh1+9LrVo4MRom5YLEAwow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727803369; x=1728408169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8d0YmEYvcCDwpHzmjsLK7fzsi8BX3iE6UA8BBPn6h4=;
        b=iSOtNAa7xbDzum2aqIP9krMFBEHJ1fDZlvmFKfaxCvez75t4n5PRvv0Cj+nVdi4XP7
         AzcDCkuG/kXQDwm89tZyIUzsnTmjxVcRW83B1lAtpd7MvJJp+uKJH/ryf5s+AF221O91
         ScJxz2iaDBB+AR/SQcVJXQBMRWOo8UOOGtvmNxYfGdoP8PsR7NhuxOMCtqnyZp9e+AM6
         QsXrkF12lYXNgCbByGvuqOi3uO5DQazR/XLF9kSXA4rcEOoeYLrH6QbAE/9cEDmBDUiA
         MzTeY/AR+caxaBdgoDqW+YLbUAYwcgfHT27zQ1TTS2Oj8oagbysy0IEelzpoClATneFn
         K/0w==
X-Gm-Message-State: AOJu0YxZKNSEtAbi6q/vgsUjSGjtnxHqHmf089NMt918LIxJmz5wnNFk
	x4SQ7dEizVfsZxx8P4j0MFymqCD79WVIIf0ljFR0DttRMcZLED0g/B92QXp1d+YfHMPMFonvhg0
	B
X-Google-Smtp-Source: AGHT+IGnRMJB/MLbxPpZy5NZDgkm3pdqjTrgUU7EmnI61BzOwBtYR3IVmycdZPpDOSBuqui9IxzuiQ==
X-Received: by 2002:a05:6000:1844:b0:37c:bafd:5624 with SMTP id ffacd0b85a97d-37cf28d67d8mr3292033f8f.25.1727803368729;
        Tue, 01 Oct 2024 10:22:48 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36292sm185589715e9.32.2024.10.01.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:22:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 0/4] Document my team's commits for 5.1
Date: Tue,  1 Oct 2024 19:22:34 +0200
Message-Id: <20241001172238.2872529-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 17:23:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5389

This series should cover theses patches:
61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)
a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)
c01e633ab91 (python3-libarchive-c: add ptest, 2024-08-02)
47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
d85a10e4985 (insane: skip unimplemented-ptest checks if disabled, 2024-07-10)
c45d45422d6 (Revert "insane: skip unimplemented-ptest on S=WORKDIR recipes", 2024-07-09)
0df9d22928c (recipe style guide: add recommendation for patches without signature, 2024-06-06)
8fc967d0c7d (migration-5.1: add the recommended pattern for S/UNPACKDIR definition, 2024-05-28)
268dfbd9491 (Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2", 2024-04-26)
3c05286fa10 (oeqa/selftest/devtool: fix _test_devtool_add_git_url, 2024-04-26)

(Not every commit was documentation worthy)

v2-> v3:
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>, Thanks!
* Reviews from Quentin Schulz, thanks!

v1->v2: Reviews from Quentin Schulz, thanks!

Yoann Congal (4):
  migration/release-notes-5.1: document oeqa/selftest envvars change
  release-notes-5.1: document added python3-libarchive-c ptest
  release-notes-5.1: document fixed _test_devtool_add_git_url test
  release-notes-5.1: document spirv-tools reproducibility

 documentation/migration-guides/migration-5.1.rst   | 14 ++++++++++++++
 .../migration-guides/release-notes-5.1.rst         |  8 ++++++++
 2 files changed, 22 insertions(+)


