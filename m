Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18944CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 16:32:10 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.224061.1697560326003141688
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 09:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Yzrd1DZi;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66d0ea3e5b8so38313176d6.0
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697560325; x=1698165125; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/sFp/ZMRqJAcXiCik0MoOfwGDtDvbkBIrDRdcb+M+o=;
        b=Yzrd1DZi+Iz5ZMX5o097oPRH9QkcKMUdRTDA77eKGmYm+4e2objK75JhPAy3TnZlLg
         xZEKjrm6O0sgcs1ISdVbwcDRzY0f6T3QYYHNi+WUpqp0lNl9/SmvLiC+u2yqaJ/O+Ypp
         Cw7ixrACBLeVn4qeBZfPWSlty4k5b+9CIn53mmVr5No1ygZgC+JpVOmU0n2oXIvxRar6
         Dq6+LAjZJ4tj6LGwKgVG7ZC4pzsM89wtN7UxdsyiHsDqRyB+k7yICwUsjqtJZu5h9aeu
         GBFGxb3sRehMyt92HpOWcCKe9jsJWPiXfVjEKwjGflKFuwfv5RaBdLFaB5Zxgf1is8NI
         hIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560325; x=1698165125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/sFp/ZMRqJAcXiCik0MoOfwGDtDvbkBIrDRdcb+M+o=;
        b=cOI6OMjyPVLSBcxLJzn8OwY/IFxKS+wR4vhV2w7CFMauCkMk9Wfc/cAGTyz6eYumEl
         Ono8LDtHyvmE/4RnqpCbSWJUlf+nPOK8pMQvgWhSLMfKrDjRQ2Z4O1YV1ZjeBZdZxNWB
         gep4iPLm4tYpA8xSMI3UIPJxeNjNhnCHnDHzOd6PKwR+1dITRK5KJ5ZSi5FHrh2a3R1a
         rfRxLSX/ynxOignF2M4/rdALBwUMtvWPtQJJbwF7tjJlM72R6aU4+AK4akgIvPdBgeSy
         YXfd0I7TAIXnFy+QO0WynPvT/D7XJ8vTcDwRwTkwxGrXScIFl7jqYbo0lkI14Q5mxS6y
         LE4w==
X-Gm-Message-State: AOJu0Yz69rS6PUhYzJAMgZiIZTV8+rzJBQ5TX+hp6FLUwzifwTfASmXJ
	+ay3dIn5CMzD9WqZx6rykXdP/c4aPmCReTvrw7+SAQ==
X-Google-Smtp-Source: AGHT+IGdrRXcv3rAEMqD0O4Cpvur0VXni++gwzktQ4mL3nRJ7svEv/PW1TzyDVZQYXhJC3ZfS8clsQ==
X-Received: by 2002:ad4:5bc4:0:b0:65b:1468:8210 with SMTP id t4-20020ad45bc4000000b0065b14688210mr2961621qvt.23.1697560324696;
        Tue, 17 Oct 2023 09:32:04 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id lw13-20020a05621457cd00b00646e0411e8csm684427qvb.30.2023.10.17.09.32.04
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 09:32:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH] contributor-guide: clarify patchtest usage
Date: Tue, 17 Oct 2023 12:32:03 -0400
Message-ID: <20231017163203.2268267-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 16:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4405

- Make it clear that patchtest only supports openembedded-core for now
- Add a short list of instructions for installing Python module
  dependencies on the host
- Add a step to add meta-selftest with bitbake layers so that all tests
  can run

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../contributor-guide/submit-changes.rst         | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 8a300c366..f93c87ca3 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -282,12 +282,18 @@ Here is the general procedure on how to create patches to be sent through email:
 Validating Patches with Patchtest
 =================================
 
-``patchtest`` is available in ``openembedded-core`` as a tool for making sure
-that your patches are well-formatted and contain important info for
+``patchtest`` is available in ``openembedded-core`` as a tool for making
+sure that your patches are well-formatted and contain important info for
 maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
-tags. Once you have generated the patch files and run ``source
-oe-init-build-env`` to initialize your workspace, you can run ``patchtest``
-like so::
+tags. Currently, it only supports testing patches for
+``openembedded-core`` branches. To setup, perform the following::
+
+#. ``pip install -r meta/lib/patchtest/requirements.txt``
+#. ``source oe-init-build-env``
+#. ``bitbake-layers add-layer ../meta-selftest``
+
+Once these steps are complete and you have generated your patch files,
+you can run ``patchtest`` like so::
 
     patchtest --patch <patch_name>
 
-- 
2.41.0


