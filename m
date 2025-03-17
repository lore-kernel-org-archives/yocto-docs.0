Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C344EC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:35:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.59314.1742232917919929209
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 10:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JCFcfSw3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0782d787so16606495e9.0
        for <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 10:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742232916; x=1742837716; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iKLs9pDRWmxT3aMBgmLdeYpz6mTULhDahFgHye8CSU=;
        b=JCFcfSw33CS7KBnymZVXku+mqcmYgqsKVVkk45txNgg75r1FV5v9Jtcv/Wu14AfktK
         uRxLbR/U9xMgTCDoUo8LxrrHdjzmvK8SEOAFALMolv+520KY4beYR0Mo4Ur5HWjKyUzt
         1HqvS1xvsr/5BE/+XusabfyYxiJI1EDrG482rKTx/G/KnaC8DKShLFQGVgqGMHDJWLPj
         u6vtNtvM7+W6xgf1y7UXQGv1aU08HhW3nlmVAzRAzSRcwE5bVvqCrjaHKY9xg9nGxjSa
         CYAW66gr141vmDrlWa+agRr88vhM+rKboz4tFJIt3sC+qFIZzOckBFg9n8sED8voyTiN
         Dh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742232916; x=1742837716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iKLs9pDRWmxT3aMBgmLdeYpz6mTULhDahFgHye8CSU=;
        b=aIXNaLHR5ljGbk/GSjgEV7svDz7uCwdxJXjD2nHHV/aTfHIcvh4CN5r2MTUMgBEaTF
         R+PidOYt+GDG3OlYwSjpgab6QdWTKI+EMdeBzWuFFSGUzwmAvdo/YIV3f7eqy46YhoOg
         +u0ozcTTDOb2z846wN+xEp24MEli4chIXydPI1ES9d3nHddeylsuT+8UHNSZRng1OHZ4
         5Z642CofixFC99nPTigMXoauxrtTfmyf3F/eb3p3OtKX55TtF71VJ6U9bkSrFabz23x+
         lRLPJeHT6ErrHERY545kDOL3szQH7rTPX10YxnZ4NFmrcweHy0R3+OvTWBKXhTS5JAi7
         jKIA==
X-Gm-Message-State: AOJu0YzfEZsdV/uZCMM3sBQhXisUqJB4d0Od3rcGDvV8JFYw3qg26cST
	UcU2/jl2A/7t1j/Du5eHubTduAWBbpZtTTOpUbQPJm8Xkc9C0mUVSm/c7Q==
X-Gm-Gg: ASbGncsH47E0dlzwQjM5wjuw98OuKnLraiEuzzu7yi+URReRZsOTMYaSDZYAkctK2cx
	3lo8LBCeKCxLGjcsQ7f4E8fsQ0R3S7dD+0Qp/qLitglp4aMmTF2BlDPLUFiEiMoUaKThNrhLw6C
	sEBCB1W8ZfLmKkavOnv1mZSqcpP9+cmjEF2E+qaRDYGNseQR09A83unMlyBsrv/WrAQBI4M+J/e
	ADc4URCbzBZuVlihlCuaS1eFnzrVBOOO5bKUcncKTYW1zvBZHKBpNdPyHzcMIjVT+BC6eBUJbf/
	k0rEfKcogp8NtsXKOArdNPYvYHcRTa3arFqB7RsTqbzCaqkP9bmbgOS1eVRF74/a2Zg=
X-Google-Smtp-Source: AGHT+IFvmOvwcpJdGH5Ac99zliT5M1S4ymsLSWVVtvv8+PG+XCsilr3a9GQQdpR91loh2GCPso2xpQ==
X-Received: by 2002:a05:600c:3146:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43d1ecb1019mr128472845e9.18.1742232915590;
        Mon, 17 Mar 2025 10:35:15 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe609a2sm110171665e9.30.2025.03.17.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:35:14 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
Date: Mon, 17 Mar 2025 18:35:01 +0100
Message-ID: <20250317173501.965049-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 17:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6584

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
 documentation/ref-manual/variables.rst | 34 +++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 861b04eaab1..5b5eaccc2a1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3170,13 +3170,35 @@ system and gives an overview of their function and contents.
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
+      If :term:`UBOOT_SIGN_ENABLE` is set to "1" and
+      :term:`FIT_SIGN_INDIVIDUAL` remains at its default value of "0", only the
+      configuration nodes are signed. Since configuration nodes include hashes
+      of their referenced image nodes, the integrity of the entire FIT image is
+      ensured as long as the image nodes are loaded via the configuration nodes
+      and the hashes of the image nodes are checked. That's usually the case.
+
+      Enabling :term:`FIT_SIGN_INDIVIDUAL` typically increases complexity for
+      little benefit. There might be exceptions such as image nodes that are
+      not referenced by any configuration node or loaded directly for whatever
+      reason.
+      For most use cases, setting this variable to "0" provides sufficient
+      security.
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


