Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B85AC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:50:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.9198.1717077014372418215
 for <docs@lists.yoctoproject.org>;
 Thu, 30 May 2024 06:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qbKZPgHQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-421087b6f3fso9920225e9.1
        for <docs@lists.yoctoproject.org>; Thu, 30 May 2024 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1717077012; x=1717681812; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7eDKqoIgdEn6mAkx4ylvLJhWlULpeu5L8UBuuTO/K0=;
        b=qbKZPgHQ28CFVVeSwkZypT1IABTXgJ6Zj9BD1n5WW70Nzj+RcDFTozTCAD1rHdPItK
         OiLO0hicsQ4SPKynslrGJUHptoti7drLzqmJR4CAhpJ246lNb59rVqp6dz7VIU0CTPLJ
         WrWc/aoj2KZwXuJ6GksxAUPFzAoGTrd+xLWcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077012; x=1717681812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7eDKqoIgdEn6mAkx4ylvLJhWlULpeu5L8UBuuTO/K0=;
        b=TBcRDTcHd0EqIhE3rI/6uMG0fdOrYe7YYgaXL+r94SCBxGOHAr/acpwk3ovKZxqqOD
         V0QB+tf+o3cp9gMF1RdYNEP7QmTgVtR/RgC+5KjlaRFv625uPlDoNUFBsnfw5m5ztzmj
         DnA67JV75sf35LzuQaK2xEczuQKqIr8q0t4mAXhOZ63m8Grn0gUpzbJfXlQXxVkG3ZpO
         wu9TXga1gdd0RcXYcUrpAk5kxfyRHxm44teqxfG5WqAZ9jsvlGZbKxey1hLAirUx68ea
         ex0kduqqLBZ69Aofjw5NbnbcTs6ug0aoI1TAyE5O2uvjl0+1mgN5yu8wmNYCje1geuHF
         EfTg==
X-Gm-Message-State: AOJu0YyRdk/0RTvzOE3rnQe9ZhmjnkJArvMV+tQUILDl9xH79YSy8c6v
	W7GLKtkcUHmAEABO5lWhDflWPB0TDktd3Ygn8KchxSlGqvNiffzvE9HLQSLSHfnUyNgbrXQIIK+
	/
X-Google-Smtp-Source: AGHT+IGG1ZB2zSJ7zJWbPReJt8AHYiZ13FIbAbURz2JWGZvriaFZhC5qIKZuYldqAkQN4TIiZvOdXg==
X-Received: by 2002:a05:600c:4f53:b0:41b:f359:2b53 with SMTP id 5b1f17b1804b1-42127943a8fmr22902255e9.37.1717077007498;
        Thu, 30 May 2024 06:50:07 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212709d357sm25910965e9.35.2024.05.30.06.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 06:50:07 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] recipe style guide: add recommendation for patches without signature
Date: Thu, 30 May 2024 15:49:50 +0200
Message-Id: <20240530134950.14465-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 May 2024 13:50:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5267

From discussion [0], the presence of git version signature at the end of
patches has been questionned. To avoid a bit more noise, the setting git
format.signature is added to the documentation and its use is
recommended.

[0]: https://lists.openembedded.org/g/openembedded-core/topic/106323318#msg199967

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../contributor-guide/recipe-style-guide.rst         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 08d8fb425..01419a17a 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -409,3 +409,15 @@ This should be the header of patch that fixes :cve:`2015-8370` in GRUB2::
    Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2]
    CVE: CVE-2015-8370
    Signed-off-by: Joe Developer <joe.developer@example.com>
+
+Patch format
+============
+
+By default, patches created with ``git format-patch`` have a git version signature at the end.
+To avoid having a git signature at the end of generated or updated patches,
+you can use Git configuration settings::
+
+   git config --global format.signature ""
+
+.. note::
+   Patches generated or updated by devtool are created with no signature.

