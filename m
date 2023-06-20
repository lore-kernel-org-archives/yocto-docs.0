Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7342EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 14:01:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.11149.1687269656387341291
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 07:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=QIN88IjX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3113dabc549so3052985f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 20 Jun 2023 07:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687269654; x=1689861654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNlkRJ40taOa/ErigyI2T3El1cq7oPbGiRgynWZXU1g=;
        b=QIN88IjXPLR6Ob8pQYWzrHRNvQlQBFhoU+/lcviESwcmLatvO26o+Wj6U2Q/enrPjf
         K1GSPy7GM2WISGH+LptJBN/P9fMMeTEYAXmVeLQXMsGH+11Sa3RPo2lXdJLYMOZxPygp
         neMK3WKK5NR9ApCM75KWaGhlm2lAGbPYqnt6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687269654; x=1689861654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNlkRJ40taOa/ErigyI2T3El1cq7oPbGiRgynWZXU1g=;
        b=Es7T6i2IJiJzXT4RbLzVR4yimjqiK75qi28Mzj/xfSJjpxQhYz7HmLksHqe0Qp2q40
         HhyyjGCdK6f/9+TvvN2PlEPNziDcH4GEjP3G0X7x2wVTfJitVKEPCqrdoEbZHnNdQi+G
         npOwWmhP9Cu/X9yCm9GyvJtS4dq/yPIUN0ynlLTefAZqWIEf00966qOLMnTtJYm/hoYu
         nthNs9roQkf6xkmWV+QSYTWZB2YBqD/yIXggwpJOUWlKworw9U1Nqus8mSbbxTN4r5Pt
         DHs84HDn6kKhxwrrEAfaJMaOAvBV/U+X72muvpdwQooClTNzvC6yMKmJm1Mcm8pxq9r3
         +1tQ==
X-Gm-Message-State: AC+VfDw5a1CSuS6VB03ghiaIgHY21uyj379JDmaatrcsaSCj3u9Fyrau
	vxncnDM+E7KY1lZWDKN+HKoUyBzGYHwxvnyi1k8=
X-Google-Smtp-Source: ACHHUZ6zKeJFvuggYD8p4s9No5zgmzmoDXAGIUgnDzkvyJU7mFFk3fOe9+IzGVgGSYVJbYl/FecTAA==
X-Received: by 2002:adf:e986:0:b0:30f:c767:68c2 with SMTP id h6-20020adfe986000000b0030fc76768c2mr10543947wrm.54.1687269654274;
        Tue, 20 Jun 2023 07:00:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dcd0:3b81:1cae:b795])
        by smtp.gmail.com with ESMTPSA id s6-20020adfea86000000b0030ae3a6be5bsm2059307wrm.78.2023.06.20.07.00.53
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 07:00:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] migration-guide: Add notes on FILE_LAYERNAME
Date: Tue, 20 Jun 2023 15:00:52 +0100
Message-Id: <20230620140053.2802542-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jun 2023 14:01:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4011

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/migration-guides/migration-4.3.rst     | 10 ++++++++++
 documentation/migration-guides/release-notes-4.3.rst | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
index c2e5699cc..e72967bf3 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -26,6 +26,16 @@ no longer the default supported configuration. This setting does not affect whic
 kernel versions SDKs will run against and does not affect which versions of the kernel
 can be used to run builds.
 
+Layername override implications
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Code can now know which layer a recipe is coming from through the newly added
+:term:`FILE_LAYERNAME` variable and the layer-<layername> override. This is being used
+for enabling QA checks on a per layer basis. For existing code this has the
+side effect that the QA checks will apply to things being bbappended to recipes
+from other layers. Those other layers would need to have patch upstream status
+entries for patches being bbappended for example.
+
 .. _migration-4.3-supported-distributions:
 
 Supported distributions
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index d782a5917..24295f633 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -17,6 +17,18 @@ New Features / Enhancements in 4.3
 
    -  :term:`KERNEL_DTBVENDORED`: whether to keep vendor subdirectories.
 
+   -  :term:`FILE_LAYERNAME`: bitbake now sets this to the name of the layer containing the recipe
+
+- Layername functionality available through overrides
+
+  Code can now know which layer a recipe is coming from through the newly added FILE_LAYERNAME
+  variable. This has been added as an override of the form layer-<layername>. In particular,
+  this means QA checks can now be layer specific, for example::
+
+    ERROR_QA:layer-core:append = " patch-status"
+
+  which will enable the patch-status QA check for the core layer.
+
 -  Architecture-specific enhancements:
 
 -  Kernel-related enhancements:
-- 
2.39.2


