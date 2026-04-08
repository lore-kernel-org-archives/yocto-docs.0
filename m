Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE191073CB2
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:05:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105729.1775653537492618235
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cr42cOQ3;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97f9587e6eso828541866b.3
        for <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653536; x=1776258336; darn=lists.yoctoproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=er9XqMvIUcLPaXVbxfaWRA4zvF5t6P4T/rsctX6kSAk=;
        b=Cr42cOQ3Wyl6ihEWceaKpxjGKuXdG7xWQcpkdp3sjit7OqMa9ojDY1D111p/lU/UOn
         Uj3NjoaMGnrkojjWXbKY399bMN7sgyl9yihuH9KYRMDEPixL4w4EcZeAFww8GSxT5pEz
         2dxDkf4gYyBeNLMBeDI/k1D7VOYP/zjbdjnCsyr6ZzOu615ZBn+iMnZZvZ0mp26yYSoY
         +v4MMOGzVfA5kX8lmO5XsAUFLsISBiXhD/zqiTAD3ZVgbd3DPX3sOFHwzbDv/pl4htf+
         TWe+DEc/LIJyy7gy1ApArLVkLs80dIRxcEZChZxlb4zPiZnpF5eP2R0DyP3xoVcmu2G3
         ouJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653536; x=1776258336;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er9XqMvIUcLPaXVbxfaWRA4zvF5t6P4T/rsctX6kSAk=;
        b=FWkps9ZaRMwOLYBVZ6UcEARk9YWf2vswsguNQLb7ESaJDcP38ADd35vQfPe6vWYRDz
         EjArUxCDWgooLzCqp+iGpC1xdGqgZkrZvSNEBQuhZfKlHR5xMOUx9pCOmsINDsjg2RL5
         QgfLk+tUDPWRZmSuwEtOcOMKaLgHj+7YT27GGnz2KdnSbTISBxjot9qVQ8HaCY2YxMw3
         4ZA06pXHDn4WKEyjz9y9zT7gOF1v7CiRCoqarmou29VLVuXYXCFnsXpYOHZzFOhKS63R
         mJeMOqBu2t6u8l0ncj9/zw/D3ZGfLW5YhTTskka2J8QN1V8LJkF3G/zybBSm46aNCrwg
         jRbA==
X-Gm-Message-State: AOJu0Ywsgla1F8iuYGWK2zvZ/3z5CrpFpUBxgNJu/bAKz512995N66UG
	0W1S8+05IoDdDglnQfZL8WYZsI1IRa+ro0LQPqAiSR3h028Dglg3rXg7
X-Gm-Gg: AeBDievjOHOjqhWq6QzKdifbWa0O+fG72iAmHkmI0CfRPXyixGOMV5+UsukINyfl1To
	ZEl02t4sHAsBJPx9dsPPOc9qLAwaLPY3nXvQPKwANvJzLok4cPKGALX0pTZq/2NTVavwUkHo3xW
	MmB+B/x0KtSafHrVgae4BDQliv5Vyh6fTKIhvBnqyEEZ8mfXqcgvzB7EqKefPuOFstuyyVyFXw/
	2eFan8TQCpaByGGVTNJDOWrLaBz+zkYLdKyXlKb2fUc+JQ8DyOlhlJ+uu41K/O0vTAID9dOZ4EF
	l3B980BEbG18wzERoF/ipwJkn5GAHu4PYtOIICH94PG9SMpu+JZsE7CVxN4QgDYDo9soNYE3VqA
	xGnnvyUIjgyqSd1y2U1vi4hYoBfXgBn8KddqNeLzm3DwLbD4FVJ5hYM6li9Bm1hjKAsi2YuotLK
	+IbcUp41dPW0Di1hIJuzm6176aJl1lZQ==
X-Received: by 2002:a17:907:d08f:b0:b98:6177:2ef8 with SMTP id a640c23a62f3a-b9c67696d93mr1056252166b.20.1775653535599;
        Wed, 08 Apr 2026 06:05:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:dab4:c153:72eb:4100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm656643166b.21.2026.04.08.06.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:05:35 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH 0/6] (no cover subject)
Date: Wed, 08 Apr 2026 15:05:24 +0200
Message-Id: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJRS1mkC/yXMQQrDIBAAwK/InisYKTbNV0IJG92YpWDELVKQ/
 L2SHucyDYQKk8CkGhSqLHykjuGmwO+YImkO3WCNdeZuRi0fjJzigiksGf37r4pFNK2PzYWnRec
 99CAX2vh75fPrPH+No/1mbAAAAA==
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775653534; l=922;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=7lyhpgnGBSqfqZNQtx3G6Wxhoa/+fX6ne9qvzK1K8xs=;
 b=n4M7YJ+lfvcnWg3WyGFhJfiH19Wfd0+XP9GcaLRuS57/FXINv4Z1IsGSqBD2HgtTPg6VmbyMo
 0PsJGH79BTxBCcfY1cOqQaqBmyyffIfVuOXTysMyuNDR3vN+0IA3gZg
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:05:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9199

Updates of staging and packaging variables' descriptions following
design and implementation changes of the last few years.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Adam Blank (6):
      ref-manual/variables.rst: update STAGING_DIR's description
      ref-manual/variables.rst: update COMPONENTS_DIR's description
      ref-manual/variables.rst: update PKGDATA_DIR's description
      ref-manual/variables.rst: update RECIPE_SYSROOT* descriptions
      ref-manual/variables.rst: update STAGING_DIR* descriptions
      ref-manual/variables.rst: correct a reference to STAGING_DIR*

 documentation/ref-manual/variables.rst | 74 ++++++++++++++++------------------
 1 file changed, 35 insertions(+), 39 deletions(-)
---
base-commit: dc1574b9f71532c469f355af2ff5ff5664083e48
change-id: 20260408-staging_and_packaging_vars-eb7f6d92a6cc

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>


