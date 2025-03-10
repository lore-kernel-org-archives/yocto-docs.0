Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF755C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:06:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.33061.1741597596494052311
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 02:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NBQkebB5;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso3212016f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741597595; x=1742202395; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7Ae74yD+dPuvRpHNu++VzHXWBejZF2B+RH1UM79w44=;
        b=NBQkebB5SmfsC+awYFg/mrQ7v6vISAN2keT24x6r8ipC1W8eB1wmF85UnVYf46tz/J
         8xixk6esLiTolKT0LYIHIvHo2xQOfqNlPH/pdc8XLPz8RFu6d609XmLM5HKzGBu14haa
         xqhlDgxh9KllBpVLxWBWOODlALHWLAC2OzPX9mrDgSnx8cM14uZywerKL1UlHaLtsGCD
         LICdjSy3PVDzS//BRdEt57mPGrcfG0hXKhk7FatwjqsPxVGsNg94qD2UZmzCb/u9Kzk/
         EnvUwMt9z0xO1/WzZsvQrgiM2OIoPj+ctMGUY60J1UR56dDboWSlSjeM5aaxd96wzVFc
         1QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597595; x=1742202395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7Ae74yD+dPuvRpHNu++VzHXWBejZF2B+RH1UM79w44=;
        b=aqmOPhOqc/sAFXepChkVhMVsrgsHGcxY9mFhw69DW5VGlSt7Aeqw4q/FxNVBUY2G8F
         Lan26WjQ9R19k/WaWZuSZLMhsWPuGtSmqq6ef5q/xGu59P4b6+vxcWMmYkmxw6iz/KFn
         saRveyBSZUkkcIAXUKL/zlbq7+KTxUMnahu0v9WxU8zuCA7ukyE1wWWniMXcW1COpZ3g
         ubITUkmbeFFiJexDBmQPWTsNn0E7Lbj6Ugsx22nl+K3+9wQRVJqJHHzoJZHgtPxM6X5R
         5BW4WEZFBdRIoTop7pz++BE+qpH/MuTfaKtc/U5+sAyzRaS+VJr7hcPw4aFg26T4cslY
         m1fQ==
X-Gm-Message-State: AOJu0YxQbr6rHiJYhUPEgPS5Rr/yH9cEgbZ/xjN0ITXvPGy/8yeWL6Yz
	XMXC2uOda9112lGU3BCqDjAdsqTMCvqVYdcy18y0tBazJo+HgsQN5iK5mw==
X-Gm-Gg: ASbGncsJP4+y01ewzr+fcHz0sZLd5d1eTpplnO2Qvz+tHaZGEisbdaZBNeD9Au1C2mq
	YYWI7SwYCuC/SaeY0tx3nE5R7MClLZ4VBaTcjr6JJK94684FVpP+aKazxaMPnGZjSBze6fRqIW1
	kZfRiAqFTfQqYzWjxDKvsmcPeZXJOj+JjRnGG1WBPHHMWpslrEL+VkY5/OYV4mIoSJ5v9bmkNuC
	zDIrzNHn+eXS4UXOPt9srKuW5l+dAiudiLyiF2uiZLpB4rqyE0OdFHPAO5IljnFNY/aJWLql1vq
	lLlKBEcpe0MsQGVJV9yMI/JAHZA+NQkpakRtPiMw4N3rA9AhsMhDSPCaHB3/b7TAc7U=
X-Google-Smtp-Source: AGHT+IEn74RN1ce77C1Xo85lVGVQ1O2taPLpzKyerwzAI7v/9aikUEiYwIYSRFQTJ3LuOE4UKmhA7g==
X-Received: by 2002:a5d:6d09:0:b0:38d:b52d:e11c with SMTP id ffacd0b85a97d-3913af06534mr4940102f8f.15.1741597594296;
        Mon, 10 Mar 2025 02:06:34 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01d81csm14414824f8f.58.2025.03.10.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:06:33 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
Date: Mon, 10 Mar 2025 10:05:44 +0100
Message-ID: <20250310090606.1981269-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 09:06:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6516

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
It is also noted that this variable may be removed. It is important that
we try to simplify the implementation of the FIT image as much as
possible. Adding appropriate notes to the documentation is a first step
towards this direction.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 861b04eaab1..08cf15664b3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3174,9 +3174,24 @@ system and gives an overview of their function and contents.
       class will sign the kernel, dtb and ramdisk images individually in addition
       to signing the FIT image itself. This could be useful if you are
       intending to verify signatures in another context than booting via
-      U-Boot.
+      U-Boot. This variable is set to "0" by default.
 
-      This variable is set to "0" by default.
+      If :term:`UBOOT_SIGN_ENABLE` is set to “1” and :term:`FIT_SIGN_INDIVIDUAL`
+      is left at its default value of “0”, only the configurations are signed.
+      However, the configuration signatures include the hashes of the referenced
+      image nodes. This means that the entire FIT image is appropriately signed.
+      Further information can be found in the U-Boot documentation:
+      `U-Boot fit signature <https://docs.u-boot.org/en/latest/usage/fit/signature.html>`__
+      and more specifically at:
+      `U-Boot signed configurations <https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configurations>`__.
+
+      If :term:`UBOOT_SIGN_ENABLE` is set to “1” and :term:`FIT_SIGN_INDIVIDUAL`
+      is set to “1”, then the FIT image is signed twice, which is redundant.
+      As this leads to additional complexity without providing any obvious
+      advantage, this feature will likely be removed in a future version.
+
+      Signing only the image nodes is intentionally not implemented by OE-core,
+      as it is vulnerable to mix-and-match attacks.
 
    :term:`FIT_SIGN_NUMBITS`
       Size of the private key used in the FIT image, in number of bits.
-- 
2.47.1


