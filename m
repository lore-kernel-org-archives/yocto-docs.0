Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A868C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 21:14:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1078.1741900487962418306
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 14:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Czh2MNOZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9309265e9.2
        for <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741900486; x=1742505286; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHwKcFZ0tN9Qnq8omz7f2WZrjHhbryv6LnsREouEnLg=;
        b=Czh2MNOZiKSgGCBKcMl2lsejLN5O7plTJTA/Z8lFDcZ/YVyBV2sH+LGwZF2MeiOv03
         q8X1j/4tgt7a+6x2jLjYECy/I+q5G1qoGJozqBrqf2wX0xbkWIAekihSwpGEae0nRHiI
         RYebGe4F7h+sEmTlh8epjDk5cp97wFX9Xl8XEwtWa3fxO7t8zMI/RufxiRp77o1g3ieH
         GIxekDbB87gsOHfBwHKm6DpcTVj/oy/JUpcXjgz8P9Z1yfTjVzlUTOvh3oOv8SPVMgr9
         TaeYp4XxDLOkXuxodMEaPyHqy8BVu4iowH2DJ2fLy11tYQOGTA0/7A1CSmq6GYsZBgQV
         805Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741900486; x=1742505286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHwKcFZ0tN9Qnq8omz7f2WZrjHhbryv6LnsREouEnLg=;
        b=K5uQGFP5Fs/d9o3CUqAvDLQ7Xxme6RfZt4ao+LwZLWNJLYPxiy/HOyfXVW2oqCLDbd
         bksO3JFNCmidOmg8QL8vyNxmuIcU2mS9Zk7w/ZXjpvo7J07Mi91dwEcEvdkijK0qcvob
         ZKOfhB4b377GGSb5iunUUSU8TMmRj4QWf+orvwwn+2zMrltueJI9bCtiLaSEyMRqB2Ww
         pJX7yrAvohE8N1KezjnMoy/2LqSOwVQFJ6rYd6I9KH1jOiVlrV0GGVuSDgbCsV1C7iwB
         hMmGW0d3QFQRHQUB74tow6i3HNy1GFs0f2WzAYagH8kfqhtJbl3dzTrnd1PY76L5lEeU
         qtiA==
X-Gm-Message-State: AOJu0YzCCI+ewN30xzVsPcQPCpuRDzmUPYS1+TrgqYoVXMIQXGM7+jxz
	lOSFMhMUMyhQwYaA2RWDfDmrIzIjCaitDoudHNq1+E1Nm43pkiV85a25Lg==
X-Gm-Gg: ASbGncucg//42Ilsp6vLJSBElCc7cPfcFfwBdjeD8OUhuuAtvcEX+no29SMKmUAZNHd
	lh1wFk3mwJN/rta1bltlgINNaXasdHQxFNmMRjt1bDfoK4TO2zYEW9y21e/CbkoJ1AmW6AZh7Vk
	XXfPbR47x0Ms0WVb0bO3BYH721FmZURF4LQRdf1+a5CH4OYC5KnIdEGqRT+MNOXQHFH+2Bork7d
	IjsXYcewXAPEcnXcWvGrHAVKbgUyCvIHw12uKnG1ba5ZgGwlbPQyWZ0ThzwI0QHS/Q4ZToiHcK9
	gjw8TaY+nM9GMJ6dtw1aBOL/d3u+M/hkEsycB1JqwSy0W7NlpHcN/C6MuAMaVJMFIJw=
X-Google-Smtp-Source: AGHT+IE78mGdhpIh9B7zlQXzL1m+iZPqyrQqqeTL8eXgIoeMXvyCWpHGZ8/UTOmu3K8W715aHwWlFw==
X-Received: by 2002:a05:600c:354d:b0:439:a155:549d with SMTP id 5b1f17b1804b1-43d1ec7a995mr1331445e9.12.1741900485747;
        Thu, 13 Mar 2025 14:14:45 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a75sm3322275f8f.76.2025.03.13.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:14:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
Date: Thu, 13 Mar 2025 22:14:35 +0100
Message-ID: <20250313211435.3042719-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 21:14:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6557

Incorporate the lessons learned from a regression introduced with commit
  OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
               u-boot: kernel-fitimage: Fix dependency loop if
               UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
and fixed with commit
  OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
               u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
               behavior
into the documentation.

The use of the variable FIT_SIGN_INDIVIDUAL is explicitly discouraged.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 32 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 861b04eaab1..4a85de9586e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3170,13 +3170,33 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_SIGN_INDIVIDUAL`
-      If set to "1", then the :ref:`ref-classes-kernel-fitimage`
-      class will sign the kernel, dtb and ramdisk images individually in addition
-      to signing the FIT image itself. This could be useful if you are
-      intending to verify signatures in another context than booting via
-      U-Boot.
+      If set to "1", the :ref:`ref-classes-kernel-fitimage` class signs each
+      image node individually, including the kernel, DTB, RAM disk, and any
+      other image types present in the FIT image, in addition to signing the
+      configuration nodes.
+      This can be useful if you need to verify signatures outside of the
+      U-Boot boot process. By default, this variable is set to "0".
 
-      This variable is set to "0" by default.
+      However, if :term:`UBOOT_SIGN_ENABLE` is set to "1" and
+      :term:`FIT_SIGN_INDIVIDUAL` remains at its default value of "0", only the
+      configuration nodes are signed. Since configuration nodes include hashes
+      of their referenced image nodes, the integrity of the entire FIT image is
+      still ensured. At runtime, these hashes are verified against newly
+      computed hashes, ensuring integrity.
+
+      Enabling :term:`FIT_SIGN_INDIVIDUAL` typically increases complexity for
+      no benefit, except for image nodes that are not referenced by any
+      configuration node, which would otherwise remain unsigned.
+      For most use cases, it is recommended to keep this variable set to "0".
+
+      For further details, refer to the official U-Boot documentation:
+      `U-Boot fit signature <https://docs.u-boot.org/en/latest/usage/fit/signature.html>`__
+      and more specifically at:
+      `U-Boot signed configurations <https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configurations>`__.
+
+      Signing only the image nodes is intentionally not implemented by
+      :term:`OpenEmbedded-Core (OE-Core)`, as it is vulnerable to mix-and-match
+      attacks.
 
    :term:`FIT_SIGN_NUMBITS`
       Size of the private key used in the FIT image, in number of bits.
-- 
2.48.1


