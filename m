Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B12C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 15:38:15 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.19925.1661182689751090598
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 08:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ypPYE9l2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id f4so8111746qkl.7
        for <docs@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=92X/Q+yRZB1+dIAW1reMm8Sotp3AugbQnazBFz7xaNE=;
        b=ypPYE9l20LSLOr9U9PyieC3hJYj0iroxgBF+WSuGeQQplmQZLkhnJ5aSiUwPxoSB/1
         CytTgG45vv2pRBS7Uwq0OcpRo1RgZ6NmJkot8+RexsHR50JxSmL9dTR65ebXdUgjOUIk
         kKEHhH/Pom26Efa5xrdsn5C4Njr7iB6ENF2KvTuep8Ghl3PCAhNb6xEwbWfvG4jv3uXe
         sZyBWptdvA3y8yKa0VicAT/7a9vIScIzo5bwu5odv+1SOv/MZxWm5yuTMCrBpexgClYm
         u9P/sERrm3I8wahmWPnm0ec0BhrXpgAo+vlvWXBKLDFX7mP5c/kaZt52kKVTMtJsFU2v
         vsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=92X/Q+yRZB1+dIAW1reMm8Sotp3AugbQnazBFz7xaNE=;
        b=6JL7UNd8P/91I9pcsbNFLq8WnsQg1X/CbQsjDaLfi67KEDnFYq0NE3ASh2P+syZsAm
         QmusVdOf+uGne+qGrAAlwTB8ggjnVUbbNeEy0wWM1iIMSr5FPHnMvsCYdEOPO5Cn7hoE
         yt+sWsdAzpR8aa7paSisMAvbK38qoZgjVrOb92uY1TiRMl7Ma1SaN6KmgSzag35vxgrE
         RWSSIZ2SdfecGoaarbxBjH19o0Ahi75scqLCGRVOmlp5cUnvjXg1izp/FX7zx0obYNu0
         BR6Gxge+OW1EIQX5AuWksj3yKheqVBrn3s8cJ3ze0knCI1xdGYRlxSd7wJ0aoc4NE/qV
         HHzg==
X-Gm-Message-State: ACgBeo2gtc+Bwj0JikfgWPd1IDR8eKUyQOOBcWHocaWduZp+awqx3lmA
	bg6q+86Rjok02vZUhELLvE0KB4tsJB5emMUn
X-Google-Smtp-Source: 
 AA6agR70ZobALhdFdg29FWe70Tz1LBkpXUxHk4i5ATT5hEcEROQ+2tuZKfhmWI6xPg+op+/x6xzxKg==
X-Received: by 2002:a05:620a:2681:b0:6b5:b547:40d with SMTP id
 c1-20020a05620a268100b006b5b547040dmr12967513qkp.34.1661182688352;
        Mon, 22 Aug 2022 08:38:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a05620a444b00b006a5d2eb58b2sm11802085qkp.33.2022.08.22.08.38.07
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:38:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: add numa to machine features
Date: Mon, 22 Aug 2022 11:38:07 -0400
Message-Id: <20220822153807.3806687-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Aug 2022 15:38:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3121

numa is an existing machine feature, add it to the list so that users
are aware of it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 documentation/ref-manual/features.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 17521ac2a85f..8dfe29d66a63 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -62,6 +62,8 @@ Project metadata:
 
 -  *keyboard:* Hardware has a keyboard
 
+-  *numa:* Hardware has non-uniform memory access
+
 -  *pcbios:* Support for booting through BIOS
 
 -  *pci:* Hardware has a PCI bus
-- 
2.30.2


