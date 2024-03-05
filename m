Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD77C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:52:30 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.2632.1709668345748735868
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 11:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W5KIcPL8;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cfcf509fbdso2297718a12.1
        for <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709668345; x=1710273145; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weRBtS4BblqzaZQBteIlqINQwMKFdKNXb02dvjaiMUM=;
        b=W5KIcPL8nUK0rrcx3D7HikqC08SLueRw+VvRBdha+TXLPIAOO/sKY/Z4xoXiv+YoaE
         L3QnFH483zoAuAVdfYPC+pemz0n+a3czPj6XaGqnsxSxOG8j9AmW/z2dv9jFYw7tbWO8
         d2hiSo50sghAMgtu9rk19wKwAAHYeUtHxpz7X2HIMHiRSy8iG7QBvWlVdd98qF9jN8dO
         b3j6OGtvmQhAuMkZDuncegRvNLgKAeink5Sozn/p/iWiYqJXQgwELV7Bg4jHMeFaMXG1
         mprZNpxQbOBLt8VFzHQkYbV/FcQQy9CQ6RSxqte6YpTJHSLUbE++IATTIbu1/m0jp+EE
         DIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709668345; x=1710273145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weRBtS4BblqzaZQBteIlqINQwMKFdKNXb02dvjaiMUM=;
        b=XJntkWVNQ70ggJ1PP4LBFtDWHvdpH7B7rq462KXtiy6N1eLVB1xPeURUhPxXT02ZuP
         OV4cYjXYDkoSt42egqamMHAkABk2Fp4CRvdkM0QLVhcBPeTgB30j9Y5MuxxI4kPsY6Ik
         95Xtp1fGRYg6iofuzQggWJPCTRSwsAhYimeNkfg5uX+k50fMXP0MRS5SHgDMas8nXIwK
         hFh0ej96xt1q0EkHhollY4BrmP6R5izn708ZVzNEvDjo4IiEtppSYuZO9VfNc0mEjNvM
         RFAtiZlU37DleOYRMZT+V5Q9HcTn0GSz2o/Jlhn7LXA4OzYst3cyyh4LiSPSqJ8vbV4Z
         tXrA==
X-Forwarded-Encrypted: i=1; AJvYcCXK6nVXXAT1ExXmDEDu6UndzZHWrvTRzmjyWDHN+d9eNk7KrOtx8rAlfkRHgIFQfXLXe3D4i+JfoHj0hQVFPErm6iJ0b5mBXRX+b4Q=
X-Gm-Message-State: AOJu0YwBcDMLw/6vCmH2BW8HDRptlyog2eqR/ho668JNxn+grQEhQX8M
	7LnSGdF5JkLoHVWvDTrKKbVbDGG4fGPPyPZ/xPSuTk+bJ1f0aPSK
X-Google-Smtp-Source: AGHT+IFaDw8BUhOouG/5fMlwBy1Bw8hYYEvYXT2HeVr6S7+X3sqcQ1d6UwYnhSb+qFCnIYkzW7MRhA==
X-Received: by 2002:a05:6a00:1821:b0:6e6:3069:660d with SMTP id y33-20020a056a00182100b006e63069660dmr1636193pfa.1.1709668344904;
        Tue, 05 Mar 2024 11:52:24 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:faa2:7198:2727:549f])
        by smtp.gmail.com with ESMTPSA id q5-20020a056a00084500b006e535914f9bsm9595242pfk.97.2024.03.05.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:52:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	docs@lists.yoctoproject.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dev-manual: Convert to 'bmaptool-native'
Date: Tue,  5 Mar 2024 16:52:13 -0300
Message-Id: <20240305195213.1098945-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 19:52:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4937

Since commit 7a036b1a1ec7 ("bmaptool: now part of Yocto Project")
'bmap-tools-native' has been renamed as 'bmaptool-native'.

Adjust the references in the documentation accordingly.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Add docs@lists.yoctoproject.org on Cc

 documentation/dev-manual/bmaptool.rst | 6 +++---
 documentation/dev-manual/wic.rst      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 9add72cf3b80..3a2a61d8cdfe 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -22,7 +22,7 @@ system image files much faster.
    -  If you are unable to install the ``bmap-tools`` package, you will
       need to build Bmaptool before using it. Use the following command::
 
-         $ bitbake bmap-tools-native
+         $ bitbake bmaptool-native
 
 Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use Bmaptool to flash
@@ -45,13 +45,13 @@ any type of image. Use these steps to flash an image using Bmaptool:
 
    -  If you have write access to the media, use this command form::
 
-         $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
+         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
    -  If you do not have write access to the media, set your permissions
       first and then use the same command form::
 
          $ sudo chmod 666 /dev/sdX
-         $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
+         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
 For help on the ``bmaptool`` command, use the following command::
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 312f78c403a2..05e9cb381b31 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -503,7 +503,7 @@ Continuing with the example, you can now write the image from the
 built your image, and boot from the media. You can write the image by using
 ``bmaptool`` or ``dd``::
 
-   $ oe-run-native bmap-tools-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
+   $ oe-run-native bmaptool-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
 
 or ::
 
-- 
2.34.1


