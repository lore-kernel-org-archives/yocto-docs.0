Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AECCF31A9
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:38:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.2682.1727858322629105933
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 01:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r2xT7K0F;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37ce18b042fso2772674f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727858320; x=1728463120; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dF6uJ0JXQJSwh6RoGXEI4tbyQxhTBIbRaSLDI3tiPls=;
        b=r2xT7K0FQZsfi6Z0vOp+rNwuTPW7lsfyKIgh1NUS7SJf/6A1YChemSN3Or1JAg8n43
         9aWu4KJw4yZqAkiY/sHH1JgXXzjy+cgP3i8pxXkV4gGWDdmVGFk+X28WKG/WJBv8vAH3
         tDqHU/hiMCbGi98ec0dk2bC95CYTw0zL+lSl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858320; x=1728463120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dF6uJ0JXQJSwh6RoGXEI4tbyQxhTBIbRaSLDI3tiPls=;
        b=uO0HDp3gVeuqmVX7uTihUWk8JpUXtHuTMbTe1O/5NK0ucxizsUxrwk9c1ZwHsqoaSN
         mp+/Z3eCPBk+VUkYq1t/Jxjyq8wMfaGeLiT7C3qk5mXvCxVw6pDhx77lk54Sqsp5opme
         ItMb0bdjxIf7rhVGQMUIgCggdcZ21NDsOQwIrGxCaD9vQhBwLFzJZJTLwqXWXDwv8Ie8
         pDKuJNG7eTwuxAhoI5y+bLiDRa+MPgWJ5d66UZGaN8M/R9e2TezNkRT9ftJpCalLJXAe
         voJfiw8Y73s5Mm6KApc+zQj0rd9GPYH4G0lIWV8hdAqAa30IDaiwMwsWKj56toq7cLUk
         J6og==
X-Gm-Message-State: AOJu0YxDno6SNSTpjlOyllMQ6Hpg6/+ZybBWVeCzo3/ufWWRxk96SXgU
	vEJp6xDBE17kPEYHuPxpRjxsEC94npqcM1WHhB/fD0rpJKzENle57wsxgrFXQxBdZ6Q42SXd9dv
	I
X-Google-Smtp-Source: AGHT+IHgOIoyn7gx49DOF95y70k+UUk3LnftnohZSyYuGUyVmMifeqkbou/EoTPaDigmPbo+sVwpSQ==
X-Received: by 2002:adf:fb0f:0:b0:37c:cdcd:68ac with SMTP id ffacd0b85a97d-37cfba13a20mr1528271f8f.52.1727858320283;
        Wed, 02 Oct 2024 01:38:40 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e94c4sm13433204f8f.62.2024.10.02.01.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:38:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v4 0/4] Document my team's commits for 5.1
Date: Wed,  2 Oct 2024 10:38:20 +0200
Message-Id: <20241002083824.933981-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:38:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5395

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

v3 -> v4: Antonin Godard review: double ticks to single tick in :term:`BB_LOGCONFIG`

v2 -> v3:
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>, Thanks!
* Reviews from Quentin Schulz, thanks!

v1 -> v2: Reviews from Quentin Schulz, thanks!

Yoann Congal (4):
  migration/release-notes-5.1: document oeqa/selftest envvars change
  release-notes-5.1: document added python3-libarchive-c ptest
  release-notes-5.1: document fixed _test_devtool_add_git_url test
  release-notes-5.1: document spirv-tools reproducibility

 documentation/migration-guides/migration-5.1.rst   | 14 ++++++++++++++
 .../migration-guides/release-notes-5.1.rst         |  8 ++++++++
 2 files changed, 22 insertions(+)


