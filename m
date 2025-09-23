Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AB2CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:14:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.15335.1758629668805054936
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 05:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbN4ZCJz;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so9621039a12.3
        for <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758629667; x=1759234467; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sZMTWWjNiXT0FWBY8fLltdrCDsHbyZYTrekNh36GFU=;
        b=LbN4ZCJzZxSdBKwrLePUbqAGHdq35ghjz34SH5+I6vDWG4PF6msUsdTJgmWo5oIu8E
         4gWgxGpmAc2xJGnhuJWbsWAY1xQaJvlfcqXpuS/K1Ht6tab11Fo2zgu3fWNt6SbL07H+
         SeDogEigF2PrE1csDbBDuXU4mWXBpsqrkW1dp4DSzmicnEGbimIDu69qfEXeEjM/Ryat
         FtCovDNXCoVYiyF9fd8ZCqb2P3YmK4UXH6pwflNGoMz7r0YqCP11xs5y8u6Ct6opVVNK
         I1TUVOchfHMrfzr/qpIIol7gBi5MitACB+jFiJ/74cjmgdIHoQ5100kEzPgMo6aJtwVL
         8xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758629667; x=1759234467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sZMTWWjNiXT0FWBY8fLltdrCDsHbyZYTrekNh36GFU=;
        b=AVNZ3qZp9qJdChbD05Pz60F1rNoEbl4rME0I8Jx6rz9vnz9kS++d06D7T9AXajatfC
         XQ6oshLMGYbW7/ZDViVnjskbex7yGbPiPSJ9J8ygHUfG/YUfqq2XUahNeqRiZW7fsuRt
         iG1HV9jLwWyziQP8yrYjiMhMP1P3JzmA5D7YQXpiRdAEQSDfUytA8nnEL6ZC6tdEPM4I
         eicAytaLtCh9/Vn+rdH1gO6OlZ6/bh7mUbCUCNSxuO2G1TeXnAniInVE6si7ra2F0H5u
         13hQj8OUnREwmbi3Oc9+WRPVH+llUOAhz+Y0OYqrGd2q7FsB6wLZFtD2oK5xRvsLkjn5
         72Dw==
X-Gm-Message-State: AOJu0YxI9gCiBxdTlBgkK+GTwdwONUcz5rxkzYNfLF+z2n9oZx2aw5yf
	GILxE8Dnzd3j714LL/hvxxroJPJ671GYpdIxQ6cyofDPZi4MkeekESjdH5tXWg==
X-Gm-Gg: ASbGncvnpg2qMsAZgmXgbQPS0/z/8uOMGw6Jp5qhWhiSTopAczXw2NQCgVqdQcevG2l
	u/mCTRZnMZSdWuMysRMBR2Lqw8nwD8M5N8uazpJwdg1pAooOp3YNFB6j9Pit5a7Nj663sepFyLZ
	+Ay+gg95eeNPIIg0RRvdXYtdTUFZrmqKuX1/8M7LAv97bSwb4PFQ+6MxCQqCSWX8aFlgiOthpkE
	3EA+PPVDciOdXphmzi+w4hsBli4SpPjNY5eEPh7qZaJge/qLoCL+FHmdSST8yerB8PgVKIIyw6l
	5LCPfqtb2LwuZKLCYddpCPwcOdUsW7rt41mINFANjTtbxddPKg92Ci1/IgU00HvC+N3P5wDzA+0
	CdCo+GG+yEQ17gbtc6A7po/24aX6WyjfMnkyDvd5CT54=
X-Google-Smtp-Source: AGHT+IEkoV5KxJfm2dN3uRv1rpT+6sx/BP8vogTMC0bbETUKo8Xmj5Nv79JrYBMkDpcsE+cnI7TEOQ==
X-Received: by 2002:a17:907:9618:b0:b07:c715:31 with SMTP id a640c23a62f3a-b302dc64158mr217693066b.65.1758629666979;
        Tue, 23 Sep 2025 05:14:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c8a8:7a00:b152:c504:c01e:e617])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b31a562fe38sm19852466b.45.2025.09.23.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:14:26 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH 0/2] Fix KBUILD_DEFCONFIG documentation
Date: Tue, 23 Sep 2025 14:14:20 +0200
Message-ID: <20250923121422.24593-1-adam.blank.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 12:14:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7580


Adam Blank (2):
  kernel-dev/common.rst: fix the in-tree defconfig description
  ref-manual/variables.rst: fix the description of KBUILD_DEFCONFIG

 documentation/kernel-dev/common.rst    | 2 +-
 documentation/ref-manual/variables.rst | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)


