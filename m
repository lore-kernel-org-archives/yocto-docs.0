Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3743CF6486
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 22:00:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.2610.1727474454945953865
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 15:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q5FvlKsb;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37cd5016d98so1181273f8f.1
        for <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727474453; x=1728079253; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V5s8FinvVcye+6A/Q9WMB/pMAUGahpxKayeD2Cef5Wc=;
        b=Q5FvlKsbwhcefPcy6d77PyNMO75J0oAzrEddN03uZE9J7M/npwuikV53ieMuUSaowJ
         QxUTfdF8rHjDFT837rTnJvc3eLwmrcBP+FoEQZ0SM7zJvjQVFIZfKgXzEjgo2uVDhbU3
         WSsoh7dGvlfTg11rm3VmYJTWY3n4nTEBRPcsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727474453; x=1728079253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5s8FinvVcye+6A/Q9WMB/pMAUGahpxKayeD2Cef5Wc=;
        b=VitasGL5ODy/AZ2IR7eiFl83Wojd0f/wX91gg/yDO1NmHbvpreCEgUpkB24cuV/2Dl
         0BzZz1KeIZrVu7Z95X5lz4xlQX9+sn43xvih4ZjR6rrL6v+VHevxPogVclKe87zr25IB
         2EIzLwQ81Mx+TouZYpooyG2AYs9QN/V7h/KM1DA4ZwWTwjfad1Y4gMlo/Bf2G57SFiCT
         wUmq7hKpyknokNZZqKVN8f6bt9Fi97UiT4Uh35k2hwx9nHLviXoGmz36/5ei53L61kko
         7Jw8mzaAFhwn6nXc9F4nnA/hwXmC/Mda4kxz4/hqWP6lAVp0C+CznJFOyTuofbuOWavg
         Md1A==
X-Gm-Message-State: AOJu0YxqSsZbNsoSw+ufIYxOlJdKcwM2wsucUYCJeXaH9kNZn5U7itHF
	eKHPk8BBa5SgKLEArJ0F2WGYGUpa9WnwLSC5s5WaNQXYEc4U/9UNi9YMddKRTc93EeTHKTzpflB
	k
X-Google-Smtp-Source: AGHT+IHc2tg8U/S0xPV+cj6YOF/XhPeHP86WZ35K+rycc5P7/wrmzhzzJaiMhQhd7bvRpCQc6luqPg==
X-Received: by 2002:adf:ab08:0:b0:37c:cd8a:50e3 with SMTP id ffacd0b85a97d-37cd5ab7109mr2795095f8f.13.1727474452908;
        Fri, 27 Sep 2024 15:00:52 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm3490712f8f.3.2024.09.27.15.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:00:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 0/4] Document my team's commits for 5.1
Date: Sat, 28 Sep 2024 00:00:29 +0200
Message-Id: <20240927220033.3941455-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 22:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5376

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

v1->v2: Reviews from Quentin Schulz, thanks!

Yoann Congal (4):
  migration/release-notes-5.1: document oeqa/selftest envvars change
  release-notes-5.1: document added python3-libarchive-c ptest
  release-notes-5.1: document fixed _test_devtool_add_git_url test
  release-notes-5.1: document spirv-tools reproducibility

 documentation/migration-guides/migration-5.1.rst  | 15 +++++++++++++++
 .../migration-guides/release-notes-5.1.rst        |  8 ++++++++
 2 files changed, 23 insertions(+)


