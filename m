Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5386CF58C1
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:20:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.16001.1727270431248264420
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 06:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FfDp7nSu;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so55190045e9.3
        for <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727270429; x=1727875229; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9z4KVFweDqOYLqwAyDI5JleG77KdV/TY5hNvxTd2Ug=;
        b=FfDp7nSu21iW/ucdwfGez84hIgh5ze6zuq3nvT+3OS1x3EPLIlzPTbQWWNEgNx/M/T
         jMd6zJKzNgHNk4mxBFZl0S87ZnjkBmUcRB/g3N8Z7foFDNqFffm37xOOlFcmd+WuhPQN
         O5/nSb7W6D5th21dJhB4mKwn5KMkM+E95HNGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270429; x=1727875229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9z4KVFweDqOYLqwAyDI5JleG77KdV/TY5hNvxTd2Ug=;
        b=UMq6gSFR5BMcyxARMy9ZijmU7IqVKwTzkbLMmrtR41821bmo3yTS5AeOBVdv3fe5qL
         uhTIrOaikgwJ7rUJmiDu5WejWkqX0hhASe5bhpFnDIep8eo6SyJVfyK5dx6IonjuF9NG
         Bhn8Gzf5d827U32POnIlVuCoa9em0p3VxgIufb4agzp/17PCfYftexpLuHvTquI6VtRx
         nGeXkUy/5ME5LUgiFNIHkWsqFcNSTO4ajRwrK6p4nPoNt7d+eapAL2woS6dQ1v8HBggJ
         0/zBBIQG4rIGYt8eHP2VYvtN6WgRRDo5goCs9F51QmvO9/PCzL2lmPikpi5w7lisCYe7
         lluw==
X-Gm-Message-State: AOJu0Yx2qx5MofY2BLcfLBWKx2qbMYqXXu3yAnUt+/cvIgQccYRXvmyt
	zuSuCOZoZp1fGqaCgUDd8iLE4Sm0az8m+kkmIqfEzfxc93FcQyRj/XcJMsM5WdOz34tf9t/viRN
	h
X-Google-Smtp-Source: AGHT+IEFAObjz7CoSY/Efbby1UExekTN9If+mRH2RyURrghiK17S6BdhGKOuTBXRf74PHeIwifxeiA==
X-Received: by 2002:a05:600c:468d:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-42e96102f17mr14778005e9.6.1727270429034;
        Wed, 25 Sep 2024 06:20:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddad1sm18808675e9.9.2024.09.25.06.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:20:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 0/4] Document my team's commits for 5.1
Date: Wed, 25 Sep 2024 15:20:13 +0200
Message-Id: <20240925132017.3427438-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 13:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5367

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

Yoann Congal (4):
  migration/release-notes-5.1: document oeqa/selftest envvars change
  release-notes-5.1: document added python3-libarchive-c ptest
  release-notes-5.1: document fixed _test_devtool_add_git_url test
  release-notes-5.1: document spirv-tools reproducibility

 documentation/migration-guides/migration-5.1.rst     | 5 +++++
 documentation/migration-guides/release-notes-5.1.rst | 8 ++++++++
 2 files changed, 13 insertions(+)


