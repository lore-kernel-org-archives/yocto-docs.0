Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46BBC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 14:48:22 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.78445.1747147699912329307
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 07:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vp2ZInd2;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: twoerner@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6065251725bso3656697eaf.1
        for <docs@lists.yoctoproject.org>; Tue, 13 May 2025 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747147698; x=1747752498; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LFGencIwdXT/3oktL56Zw7HRPwnpzqIyZoETqKhlCE=;
        b=Vp2ZInd2nF39FwEyMnDgsMEVVoKg8Jp4ZBr/cUt/l3LWVVsjHenCHOjUn5QiZFML6P
         SHeMm1w2fvbsd3cVXAJGyveGOIBNuZlH60b75L3+P+zl/ItWrMEGUjzc0mBOBUQMY4fX
         50T95mSmTD/eD+PvcbyJyh9wpxaKdvmRg7GqScySkHvsQdj85rNoaIFeuAqyRxSyGcNI
         iuF9Vuk3zOOaSpuW7jAhwdsx1WLMg1uBPIZlLbYrpSybguINAnksHVeSTxIQAKxxdVKT
         rvL+V8/04H0CK8F6D9IMe3+aBmGIsPKEF2RFla0N+h6CDDZ+B3NaAEPZhoEoHGG+tOno
         Cufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147698; x=1747752498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LFGencIwdXT/3oktL56Zw7HRPwnpzqIyZoETqKhlCE=;
        b=YQ8EhzPkdYKgijweWRle5EqQF/TzIe5L6JJLzbwbp7ZM1XZvVQghOKyOwVOrWF/U92
         IqPLsPaHrM4EwjMizE+jr3XepiI1ZIDYC4IY83NPG1cPjUaux6AB9VByaB1IVDYKzwjr
         pGj26t52on+1DmrKaPfUHzcI+NMNmakfymOkKNf/QcjwOzXMg81cpqbXZrf4xMYOykEu
         U1inbCzc1ntdsRI7QSjPshrVnjdAjjY5b9Cd8R7ErJBNVLEBrCHJ3n1rfMekuN57wDAO
         wOQZ84zB06wnN0vD3f0ww+phQ8YRFB1mZtJnuxtM9hvolC2bdFCp5bqTKzdQTR/Wr3V6
         XWFQ==
X-Gm-Message-State: AOJu0YyUA+RIvEqCzJT00GMLSgeYWZNIgGiFv4WG8WcxtwkGVITDIEwZ
	7FrSEDlV9RhlVn089UOQ8SmsGSTrLmTA7W61EMI4qF72fluoASgyPHtH9g==
X-Gm-Gg: ASbGncvfjMSvxhK/PsLVX5V2E3Lu32Rf3GlqghnGC+UyJxae+U2rC0tHaCCHsKgUzN2
	Z6SKFVSIHP9pKoFlqmiopUNvfumSLBInTypRpVTNiyk00Kw9Q7XMeKpdldl2cboU4ZMoe448c39
	+j27mCjTubeyz4msAq2vxnP+3CO7MwjWOZCkYQctF3C2Xmh9dDNk0l5nC1OJ3CCPmJf0hK2fQ3u
	PKBwOjAp1z/9oHMRYtBOU7BWlHoDOISIukLS7lzqlkGxCP0Va3CDYPzqUbyfjI8f+64n4PAWwDE
	2W5xh62qqdkEaVN5MXcPyfhtOIU+1Q6zcoKEvJlckcOLdq3/mWSumxNPe+VhDAIyMnSL0zwacK9
	1QstcO+jcNdgAP0/e9DM=
X-Google-Smtp-Source: AGHT+IF2NtDk0Qi6nfQERE/NKcY5+BWUWJ7U2rtgWN5dHTmkOHqFaNsuwJCXasdN8K/msQ4ZZpqtpw==
X-Received: by 2002:a05:620a:3188:b0:7cd:40:351 with SMTP id af79cd13be357-7cd01163523mr2809002185a.58.1747147687378;
        Tue, 13 May 2025 07:48:07 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fdc59csm713534885a.77.2025.05.13.07.48.06
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:48:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3] ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS
Date: Tue, 13 May 2025 10:48:03 -0400
Message-ID: <20250513144803.26956-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 14:48:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6821

Fixes [YOCTO #15509]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- add tickquotes for -D and --debug

changes in v2:
- link the phrase "Wic image" to the dev manual's section on creating wic
  images instead of providing a paragraph at the end to include the link
- remove any reference to a bbclass
- reduce the number of "`wic create`" phrases
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036b7d..670cb3e0ef28 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10942,6 +10942,20 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog-config`` recipe
       and also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WIC_CREATE_EXTRA_ARGS`
+      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
+      will generate a
+      :ref:`Wic image <dev-manual/wic:creating partitioned images using wic>`
+      automatically when BitBake builds an image recipe. As part of this
+      process BitBake will invoke the "`wic create`" command.
+      The `WIC_CREATE_EXTRA_ARGS` variable is placed at the end of this
+      command which allows the user to supply additional arguments.
+
+      One such useful purpose for this mechanism is to add the `-D` (or
+      `--debug`) argument to the "`wic create`" command. This increases the
+      amount of debugging information written out to the Wic log during the
+      Wic creation process.
+
    :term:`WIC_SECTOR_SIZE`
       The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic
       images. In the background, this controls the value of the
-- 
2.44.0.501.g19981daefd7c


