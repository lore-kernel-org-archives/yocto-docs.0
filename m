Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13B9C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 20:56:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.49731.1741640190757907854
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 13:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=REc8mui/;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914a5def6bso919706f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 13:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741640189; x=1742244989; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RXJBZgWaUzGkyIXBLNwDWihJrhbsgwD5Nyah+vvOTM=;
        b=REc8mui/fC6NHP2Hzbgr8JNltnTAd+FZxGWyLjsDbUvyO8x2hiFmUlADxBvIe+YyGm
         irdiI1MxzBuLeEnHpK5S69+QRyz9SLR0VmHKF3wvmoQ+ijrcKKw1B7eFrrqUat11WhH0
         qsa6MITwihCUfeJPEXfgaALPm0YGNE+h3sl8L7dSihkRyLUuwEfnetyZj6MHG76/U8ki
         wp6k3XGSSYkcw7F40U3LkwjphgUB3dJncbSIXOZidvXyRZzeaZ6LqKqZYmn2mKch+gKS
         HL6hyJTm8+vGRe8JxrykEo2O/aqgHbBbnFpKVGoT1bJOFeGUFh526FH1DRluY3Q68826
         QVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741640189; x=1742244989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RXJBZgWaUzGkyIXBLNwDWihJrhbsgwD5Nyah+vvOTM=;
        b=UUSkEpCrqlDl2R7QBpEqe2cbJHqrKNQk45jZfhU6XN5pTDwHfjQ84mkIYUjAUjp0iP
         vD8uUy1riXMhE7sM6Y0and4HoYqok31FXO1HWAGgslFSBglpKCyBHpwf6vTH5IM/TKHF
         sO39b7pt0tiEMya0WxhRfGIHXRjbrNw/47iNurRiuRKTTIzKkC+eV+qzWttVJ/eYQgZm
         loT8tkzSc0tkDNpqbugcIa3Chp5MzfA4DugwHP0r5dHK20Yf8s1WZKauS40LzPgXR4qE
         DuFcGisKvyl6e+wG7STxqDu3yTMOgpiHtJJZ2lTkjHLgdGsj/xLtRlqABlr5FQd9wdJo
         INaA==
X-Gm-Message-State: AOJu0YzP8N5aGSMd4ufrfTKPZ081xRzvJ9KTficHCpe9A3bQOtwr37Py
	FjY4qc4C3S/kFbcxq1Yw2tn4dY0krfY3cwM0MQm/vbIRwRMycl7n+mIZcQ==
X-Gm-Gg: ASbGnctw3yJyEtPT+A79fIlua1/ChtmbVyxUeYUt+ntg9E/PJkMwOtKII7bevTu31oX
	zcCTVUKEFAWKUIXdgRapyUjpcBW8EIC4/bG8pM5rgd0V6juWvcTCeIMzfHDoFVSyaVbSFgPsqpY
	qpmso+htprphJD+a/I5yJ7ogvhftS3vuUNr/BxyGGGE40WxmuzY4F63sBM1L0LfcnIujUKFZMez
	CIp5yMa0zb6Dk9zhlb1UWEJongg/VwnQCE268xTc1taIlk6367gZlI6CH3Xb3Wxas/vPYyCi8Ie
	xS4KatumYV1vdyBlYewn2MBPD1x5T7w6SaOwpz9/e+0LDuWJ9z2Jr9kEh6DzpVVW5PhQ
X-Google-Smtp-Source: AGHT+IEY/NCtAsg4xPhe9/ylXaUWKoMXa4bFJbtUMnhkeR3pBjW8CJaXnE5zhUSfGes1QPm/2/9hCg==
X-Received: by 2002:a5d:6d0c:0:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-39132d89abdmr12794599f8f.33.1741640188732;
        Mon, 10 Mar 2025 13:56:28 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2f4fsm15905216f8f.77.2025.03.10.13.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:56:28 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
Date: Mon, 10 Mar 2025 21:56:19 +0100
Message-ID: <20250310205619.8884-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 20:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6525

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
 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 861b04eaab1..aa8a894bfd2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3174,9 +3174,27 @@ system and gives an overview of their function and contents.
       class will sign the kernel, dtb and ramdisk images individually in addition
       to signing the FIT image itself. This could be useful if you are
       intending to verify signatures in another context than booting via
-      U-Boot.
+      U-Boot. This variable is set to "0" by default.
 
-      This variable is set to "0" by default.
+      If :term:`UBOOT_SIGN_ENABLE` is set to "1" and :term:`FIT_SIGN_INDIVIDUAL`
+      is left at its default value of "0", only the configurations are signed.
+      However, the configuration signatures include the hashes of the referenced
+      nodes. This means that the integrity of the entire FIT image is ensured
+      because each hash is compared against a runtime-computed hash for each
+      node.
+      Further information can be found in the U-Boot documentation:
+      `U-Boot fit signature <https://docs.u-boot.org/en/latest/usage/fit/signature.html>`__
+      and more specifically at:
+      `U-Boot signed configurations <https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configurations>`__.
+
+      If :term:`UBOOT_SIGN_ENABLE` is set to "1" and :term:`FIT_SIGN_INDIVIDUAL`
+      is set to "1", then the FIT image is signed twice, which is redundant.
+      As this leads to additional complexity without providing any obvious
+      advantage, this feature will likely be removed in a future version.
+
+      Signing only the image nodes is intentionally not implemented by
+      :term:`OpenEmbedded-Core (OE-Core)`, as it is vulnerable to mix-and-match
+      attacks.
 
    :term:`FIT_SIGN_NUMBITS`
       Size of the private key used in the FIT image, in number of bits.
-- 
2.48.1


