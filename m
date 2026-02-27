Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FBE1039881
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 20:02:54 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105088.1772222567011449730
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 12:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eyRCwvuq;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so2489262b3a.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 12:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772222566; x=1772827366; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WA0jhCNtCrzOTph6bHWLeXoAiuSjKyLbLQl0R4jMF/Y=;
        b=eyRCwvuqPV12agvHy13/gSG4T9NXlCnxRpMHwaysPNYHHcAp4dazXkT5Z+zudtVvoK
         HMwLTqID5/cwkmg5OkCqrFSgFqFT8Cmbr05a4/NSM0D8ggGGExZTLpg7Pu+lVj2+vdKL
         JOxj7rxxmrRgCcoSlMP7oPIwKHbUitpSbNk67JKrD61Vh9XWrnY+HY5Ja48Ais724kaS
         M5f4SZP+Z7V1USkOzrWINY0a8tQsc6MBbjZZOhWT9Vy1WfoMTeMxBYk51hoYACQ0tZJc
         0o8PytB7EJTCGMRHmr/2pd9i2PfvnIEbzeGYfLB8mSKgs7ZRVvq8q8yLtIKwNdGAtxwa
         9ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222566; x=1772827366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA0jhCNtCrzOTph6bHWLeXoAiuSjKyLbLQl0R4jMF/Y=;
        b=Un7/75Nu5MCCR7uHzNKJFZ4ERomtxxJnqVdasrWth6y8OurfyxUGSM9H2+7aXwufFA
         CKu8MefMVgIpryO6YUPPg0WhWGU6ocQl/CCEFyeR0/a820c+Ww+ZA+uD7zEMafdwCL1w
         xpHgJMnLkycHAq8Iml+o9YyK58JHz9qA6KBGPj4O68WC+wj4ol/kGomZzz38c1buQpgl
         3cP2zNvUN2UWxDU4svFAmcnwKzZ7OMGYBgt2W6EjgayLB3nntMVRn3gv9MekcbNufIGc
         LOrraBT3fOXQzdAA920tqRj363DsZUBp9B2URyYCRmKD83590WZb0P7bEMrfBPmnfc2E
         B0IA==
X-Gm-Message-State: AOJu0YylgVBJeKhE1eRGcCdkezBbEM8dSDpiJq0IEVR8EE+9E9gJ/9Kh
	O1Y1X+ZL3TF3ryAmDjBxkWffDax2n69dpUN2JPcXP+ZP+Vkcte3pfzqeCcBZ0g==
X-Gm-Gg: ATEYQzxdVQue86vdzfn/CB5PN6sieMVqmAE+Er8EDtgfzNCpwEFg01xwgyhwPJeitPs
	4pCi2ol13vW73W0hJjVe2/cL4TGaEsPtwnHYV+GmRo7qSbgtXHNJ8JRyjdp7EduOA6WtstlpDUa
	qgIT8q5bi3q/SjNeRF2r4052+cMDipD1FidtFYKqrOuxoS0OLgC8ubX4nSoaB0WTWwjP5jjMtDN
	du5GzZzOm0CXT3t8XxZfPow2lxr25QSw9tCEPsvMkne/vOOZbxwDCipvCGDc9XA4YJjzsffXtRF
	5AzpuhNAysOeGyuRZBNHUFVAY4kYB7zVF90rg2K8qBOu/wpLCi2Bows4mMghRba68gt6Sv/L/W6
	BKp63k8ZlNEydcP2wFuUXUAMNnhQE18bIezxJPByVvV0Gm9tntdUHW7F2vtJN2PKMvithxI+j40
	dNQvF7w2pcdxg3hqdN/ShmEyUXp11N9lt5et7ajomlOtgey6V/s+r0HiKG3eXtpRBYiq2czMFgS
	We3qptJ9TekSWuXeXFebw==
X-Received: by 2002:a05:6a20:9145:b0:394:5ae0:2921 with SMTP id adf61e73a8af0-395c3b0f903mr4314479637.62.1772222565579;
        Fri, 27 Feb 2026 12:02:45 -0800 (PST)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35900700e69sm9462387a91.0.2026.02.27.12.02.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Feb 2026 12:02:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] ref-manual: document PTEST_RUNNER_TIMEOUT variable
Date: Fri, 27 Feb 2026 12:02:41 -0800
Message-ID: <20260227200241.66128-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 20:02:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9014

Add PTEST_RUNNER_TIMEOUT to the variable glossary and mention it in the
testimage class documentation.

The variable was added to testimage.bbclass to control the per-suite
timeout for ptest-runner during runtime testing. It defaults to 450
seconds and can be overridden in image recipes.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/classes.rst   |  5 +++++
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index eb76c8916..7a045b6b7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3110,6 +3110,11 @@ after it is built, you can set :term:`TESTIMAGE_AUTO`::
 
    TESTIMAGE_AUTO = "1"
 
+The class defines :term:`PTEST_RUNNER_TIMEOUT`, which controls
+the per-suite timeout for ``ptest-runner`` during runtime testing.
+Image recipes can override this variable to adjust the timeout for
+specific images or multiconfig variants.
+
 For information on how to enable, run, and create new tests, see the
 ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
 section in the Yocto Project Test Environment Manual.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 208b5e43d..587f67cc6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7793,6 +7793,20 @@ system and gives an overview of their function and contents.
       For more information, see
       the :ref:`ref-classes-ptest-python-pytest` class documentation.
 
+   :term:`PTEST_RUNNER_TIMEOUT`
+      Specifies the timeout in seconds for each ptest suite executed by
+      ``ptest-runner`` during :ref:`ref-classes-testimage` runtime testing.
+      The default value is ``"450"`` (7.5 minutes).
+
+      This variable is set in the :ref:`ref-classes-testimage` class and can
+      be overridden in image recipes to adjust the timeout for specific
+      images or multiconfig variants. For example, in ``core-image-ptest``::
+
+         PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi = "600"
+
+      The value is passed to the ``ptest-runner -t`` option on the target
+      at test execution time.
+
    :term:`PV`
       The version of the recipe. The version is normally extracted from the
       recipe filename. For example, if the recipe is named
-- 
2.50.1 (Apple Git-155)


