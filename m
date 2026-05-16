Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B672ACD4851
	for <webhook@archiver.kernel.org>; Sat, 16 May 2026 19:12:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11359.1778958711338445352
 for <docs@lists.yoctoproject.org>;
 Sat, 16 May 2026 12:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iF15/ILI;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a5174670eso412107f8f.1
        for <docs@lists.yoctoproject.org>; Sat, 16 May 2026 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958709; x=1779563509; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ai0oP0m5S+CEn5Osnnf9QduL8sDbCqCItLi5cO9MBwY=;
        b=iF15/ILI9cZTa4msrXWTscVItEDfbOm2FM7aAzEZrHDOvzWValbNN0y3BqY5vVVbxY
         rV0IVsszKjXuTfifXeFPlDO68ymNuwoJqxKNCSLwSdQIiKpoh7mbz21tVnj1cYm3tK5k
         /604hW28cAiRrhmn9eDY7YsiK+UtxFfe/nar5pxV7nW6ae0RUPkT4GT/gmc9YWOpUBzm
         dnIIYZIV1LIxdDcX6NC39jq7r4D4EsswShmXhfwQ1zO0T67sJwunK50701dPaQzBrQDD
         4p1E5CmVH/Hz/p2bWp/DRvKhgmzeetfYwYIUqjGb02yXrK9bDTdZ+KR6acW5CqxyfYrr
         sOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958709; x=1779563509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai0oP0m5S+CEn5Osnnf9QduL8sDbCqCItLi5cO9MBwY=;
        b=driNL9CYzV4ZwIjazMUtugiDPnyT6r3gGRVk+ZcC77Dhg+6y3Ff10FA187H2F3//6l
         o3d/y+RdO8qKZDBbxlDfigm6Q+kIIc5RJji+MtWxvmtvk02wsbyLzQonrSIEHrl0VpWX
         Y4bDsapaPRPOxiZi9JYlnEpeWwz6ouF7AQzHa2wotfXIPJb3Ti+TnB2CcZCI307daG3s
         JTETacQvRDVvOcn0bpuBgVuvNlCoHIrU3TTlaXL/U1qbQ7g1VeGaTjfZsSUTR2/O7Xeh
         I29aXFYTx9/j/t5jlJLjrNeNttHakVj7/8opf5wlvkWtlHWmAdTR3XO8YybJeHZfPb1X
         +20Q==
X-Gm-Message-State: AOJu0YwVk/8S5EhcpN4fi6URRNUhDiZWtoVNRxWGl13k9pa8pB/09T7N
	i3CNYok/56qfmH1wZjvhlW7JTvPSqaKw6C4GP0Ew4Iua8zt1yRvsvIUN
X-Gm-Gg: Acq92OH7IQHhXdD+p5+VS6bF9JS9viKe0K2jJNnVJXM4oeofGNPqDU45bOdxQmco7LI
	TYl+GnlDykCqq5OwDd6NVnlWX43z3+yi2id+MnArSKzdco7pkJ20gArMJJvtTJl2ROuAJSivag6
	weN7+b+Yv919M7RLPz2O9JpdE6gw+NGzbPbTTMi2JxMErfEo6XaZcY1/xpXH41GMXuaed2jj+3d
	oW5dOdG76B9F+Cq65GCMw1Nl8/GWwo6AmGHX44jo8u470G8K8wLFrlXkbmVhdziE69IJLu9aUXU
	67ecfjk0uERhwld5BlGraftfPiJO1LDlyAfR+6nmoK0FANQxKXqnhTha04bExoxlp6Lg2X33bpV
	SXehoo3JTV1ZKROg+ZQPJuQELhLytbOi0+/sGAteLpcq4atBgFFUhq7icB/C0nSeWhquASxptle
	BTQVjeWlCTLGXjzvEJm3FZ+jpHZIPutbPq5Y48sqg8vnnFldf1+AT7nx9ajo0SF/NoqwZAnv2NS
	dx2aYmQa7haXkaWU3AQQxjg6PR83bOTx8sxzILc0CQR9O7LjPmd1Q==
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-48fe6de1dc5mr78081565e9.17.1778958709137;
        Sat, 16 May 2026 12:11:49 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:5f4a:8ba5:a0d5:73db])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe53804aesm138951905e9.15.2026.05.16.12.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:11:48 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	mathieu.dubois-briand@bootlin.com,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v4] doc: bitbake-user-manual-metadata: document inherit_defer limitations
Date: Sat, 16 May 2026 21:11:37 +0200
Message-ID: <20260516191137.11033-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 16 May 2026 19:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9472

Add a warning explaining that anonymous Python functions cannot be
used to influence inherit_defer, since they run after the directive has
already been resolved.

Also rename VARNAME to VARIABLE for consistency throughout the
documentation.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 .../bitbake-user-manual-metadata.rst           | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 0c7c3ff99..134cf8ff1 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -827,17 +827,17 @@ the variable after the line is parsed will take effect. With the :ref:`inherit
 
 Here is an example::
 
-   inherit_defer ${VARNAME}
+   inherit_defer ${VARIABLE}
 
 One way to achieve a conditional inherit in this case is to use
 overrides::
 
-   VARNAME = ""
-   VARNAME:someoverride = "myclass"
+   VARIABLE = ""
+   VARIABLE:someoverride = "myclass"
 
 :ref:`inherit_defer <ref-bitbake-user-manual-metadata-inherit-defer>`
-defers the evaluation of ``${VARNAME}`` until the end of
-parsing. Assuming ``someoverride`` is in :term:`OVERRIDES`, ``${VARNAME}``
+defers the evaluation of ``${VARIABLE}`` until the end of
+parsing. Assuming ``someoverride`` is in :term:`OVERRIDES`, ``${VARIABLE}``
 expands to ``myclass``, which is then inherited.
 
 Alternatively, you could use an inline Python expression in the
@@ -853,6 +853,14 @@ In all cases, if the expression evaluates to an
 empty string, the statement does not trigger a syntax error because it
 becomes a no-op.
 
+.. warning::
+
+    Setting or modifying variables within an :ref:`anonymous Python function
+    <bitbake-user-manual/bitbake-user-manual-metadata:Anonymous Python Functions>`
+    will have no impact on the value of that variable in an
+    :ref:`inherit_defer <ref-bitbake-user-manual-metadata-inherit-defer>` directive
+    as the function runs after the directive has been resolved.
+
 See also :term:`BB_DEFER_BBCLASSES` for automatically promoting classes
 ``inherit`` calls to ``inherit_defer``.
 
-- 
2.48.1


