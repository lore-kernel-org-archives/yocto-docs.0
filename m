Return-Path: <aatrapps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0487EC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 19:39:11 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.88752.1657049947221024230
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 12:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FUYJJr5Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: aatrapps@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id ay10so15243013qtb.1
        for <docs@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5pxtyIUYZ0aFI1Pd6tHHgXbTDj3Awl+CJP3MWNr/Jq4=;
        b=FUYJJr5ZUpCiiQQiBRLEsiMc7l4B161U7RSJAR0ORebtzJDT23+q2vBiC5I2odqVB9
         9sZfl/yZDhuVq7C4tNVsK2ZLvz8if+8kuFHJNXQoSgaP9AKdch1vRjZr8cf8KNd8ylCB
         TYoya9QQF7omZAvGUS5G3Z4aStHBxi/31fr3ePkQA490IEn/vW/Huvfy86eipFmSLvtM
         TkW2XsMevHn3VKIcwbAOg9WioMPLROcvjF5wqcxOf0TxN//JgPWo+wo4a/LqmKekrY9Y
         Rx0NutfQIRaAGbr4+7tCx2iYGw7iZbobWidpCSUUVnk40sWbwrr+PtyTI0oobUh5hbW2
         DI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5pxtyIUYZ0aFI1Pd6tHHgXbTDj3Awl+CJP3MWNr/Jq4=;
        b=aKWd64PopURtXkVBZ0qXMInOS98nhX9DLJBbqaGROsVfRKNmpbj53dcD92wktQeH+e
         slkyKHdUoSWLzuRCApgJZUQd6TeNt91n6eTruim6UN3BDnB2kQ44KE2VJsL04RfY/Cgd
         8uPjsCfOe4NjD16PMerrsg4trBuI9OSnwg1+rvNByZZGX5QAoVLZf2O6IxT5NgAGwAnU
         +XXfGAckuFk+2R2pjv3ncqwtezrR2+n6dmVuK83aMnrKNfYYODgpN2BqKUQLzU5PxrRW
         yO5+krrEQopQNWWmKWWW3HFd8RJwNGkmhzzBpQSnCbahitGiqwvzIg+OfM7IxlqsDERV
         hTnA==
X-Gm-Message-State: AJIora956lTaoxdrqF9M9BjZJrAI15NAbJ10FSlXfHyImOAyNwYGl1SA
	mbNhvGrjS66bah7E2ludBZq6SBCBurM=
X-Google-Smtp-Source: 
 AGRyM1tB4wFAT6JblvFxHzp7A6zmOWEX5PfQNP38SiNs5ymA3nq0HM9nnRdVsCFV0Yb9EZkfRtgQAg==
X-Received: by 2002:a0c:aa4d:0:b0:470:90f6:12aa with SMTP id
 e13-20020a0caa4d000000b0047090f612aamr33833059qvb.60.1657049946263;
        Tue, 05 Jul 2022 12:39:06 -0700 (PDT)
Received: from localhost.localdomain (ool-4578ffd8.dyn.optonline.net.
 [69.120.255.216])
        by smtp.gmail.com with ESMTPSA id
 br14-20020a05620a460e00b006a6ce613c7csm23661006qkb.89.2022.07.05.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:39:05 -0700 (PDT)
From: Aatir Manzur <aatrapps@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Aatir Manzur <aatrapps@gmail.com>
Subject: [PATCH] docs: Sphinx note directive for DISTO_FEATURES definition
Date: Tue,  5 Jul 2022 15:38:47 -0400
Message-Id: <20220705193847.12544-1-aatrapps@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Jul 2022 19:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3052

Signed-off-by: Aatir Manzur <aatrapps@gmail.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c4b2119f2..6a43e8dc5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1886,10 +1886,14 @@ system and gives an overview of their function and contents.
       optionally support the feature. For example, specifying "x11" in
       :term:`DISTRO_FEATURES`, causes every piece of software built for the
       target that can optionally support X11 to have its X11 support
-      enabled. Note: just enabling :term:`DISTRO_FEATURES` alone doesn't
-      enable feature support for packages, mechanisms such as making
-      :term:`PACKAGECONFIG` track :term:`DISTRO_FEATURES` are used
-      to enable/disable package features.
+      enabled. 
+
+      .. note:: 
+
+         Just enabling :term:`DISTRO_FEATURES` alone doesn't
+         enable feature support for packages. Mechanisms such as making
+         :term:`PACKAGECONFIG` track :term:`DISTRO_FEATURES` are used
+         to enable/disable package features.
 
       Two more examples are Bluetooth and NFS support. For a more complete
       list of features that ships with the Yocto Project and that you can
-- 
2.25.1


