Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D42F44848
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:02 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154734.1775823475330423076
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IkhHeuwe;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9c1da7ac63so312916266b.0
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823474; x=1776428274; darn=lists.yoctoproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5X77cO/rin2FREhQvbyvlejCCQJT4t5KTgjWgEVslfQ=;
        b=IkhHeuweR3poanUZaV+u0g21pnJ+YCP4vJEwZr8QVb96sMUBhiGbQN4ui5RoyiFlHX
         8ka5KrEp2gQDMG6UodEB4AFR6c0PFtwoXNlV/9/UrP7T0gQpbCWwmv0PnJGmwAiNNuk8
         5/0M1871UnxJK9c6J/z3CbIlL3DtXZr241kqZ2UvqMijSvD1D6DVBd+YRgYtTmp/fiYR
         Ve3AvNLBr3DK+okWREKouHSfQxWZTjIF1Jj9EEfmqMCLQeiTeofG1QRMTo8m4jZsL7Qr
         u5DiQFp+oIhr8iRAC6QrK4Cy/Le5UiSwwZf/F1e3L4nd6VcymVVFXAGYCtzz0z7a01yW
         NstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823474; x=1776428274;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X77cO/rin2FREhQvbyvlejCCQJT4t5KTgjWgEVslfQ=;
        b=sNUt+7QzhVtQ9mUxdmwjBx9ZgK7yiTKFLM1lZwV2L4RLKNzLMKtbf7TT0VIt+Zti9a
         HGSSvmUaxBQe0rG2J5Cs+vw8etkArUo0T1WR1Vk44EbAD7mNOqwU0Ja/z652JHEsZQOS
         5LFYZubyHFcdgyBeda+SdcVqRHLb4vazJAU514TTmAU+f/yGk8OKAf2OfkWvVp0eIknU
         tKXBJ804E0IkLEG7GKoVt/XYJhTzI+Q7YlNRbMtZ1+WOWaaVBPF/wSkpQM+4KHeFi+Dj
         pHIh1gkgxplpJkxaSxJ35IJ7Tcz5DY/VAJKzlmED8+GwvwO8XnoUyaRihDPQss8Gy+2m
         EMHw==
X-Gm-Message-State: AOJu0YyMJG2uc5ctGwDyG169jbDuEPNX5BNM3qzDuGa/YfM8F0WnRkJI
	NWZyJwTQXla4dHRQoMWSxG+Dd2Ky7js7ZD4mGE2aYwpK1r2V/ltOhCs5
X-Gm-Gg: AeBDiesbRokfySw5lLaQpeDsEaXfxpm8mdJEWpQtvJjAc1WBRItNIhEsgXL+49oWjmt
	aRaHScq/wQl24KyUC64EmuZlIhT5C2V29s4iU7ktjVB0eyjS9zYo2nuGjhtxStE2zW/RM7Jxmzw
	H4ojPzXV5p2qWzHOxOxZTqTm0xaFtLl0NlaXs/ga02L6mu7rl82+6sPeLJJaPjqZ7Xt7h1oPeUB
	Zdq51H1g+oV+IU6MlodhKkHn9FBmgYubKDSMc8Fhr8PEp49n6IpZ0lN33uiMdi7JpmjkILCfbVt
	26Rb+iILY8Lb1/l5CYYfb8+A53c4f6IROi5YmfoMmMSMnlHofOJUGOOayFSXTCtty0XqlvBwC2/
	ZkNIgJtcwmMg2m1efaWCyhr7mRhP03z3OPME112Lv2PwMSgmd6f+DXtBsEvGIFfnIdkjmbRJerD
	n9vZNPIa077bMaaXwDDw0xddj9tKMS2w==
X-Received: by 2002:a17:907:e113:b0:b9c:6ef1:ed18 with SMTP id a640c23a62f3a-b9d727aa4fdmr124244766b.25.1775823473504;
        Fri, 10 Apr 2026 05:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5694:dea1:688f:6eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d69fsm74881666b.4.2026.04.10.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:17:52 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH v2 0/6] (no cover subject)
Date: Fri, 10 Apr 2026 14:17:43 +0200
Message-Id: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGfq2GkC/43NQQ6CMBCF4auQWVtTCkJ15T0MIWMZykQppCWNh
 nB3K17A5fcW/1shkGcKcMlW8BQ58OQS1CEDM6CzJLhLBiVVJUupRVjQsrMtuq6d0Tx+iuiDoHv
 dV91ZYWUMpMDsqefXHr81yQOHZfLv/Svm3/WvbMyFFIWu+1KrQmo6Xe2I/DyaaYRm27YPCzxJe
 cQAAAA=
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775823472; l=1088;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=Ax50SHYxxJLyFF3EUgRh9+Hs+ReX/oPu0Hk0Z96etRs=;
 b=KPH6YJ0WhiKzJ0m7iWuQZRoHy7CYZaYMqlH1J6kT8C6k0BsnkzYTYfLD13TBKgpo+Oa09+cYB
 eV7/Rh06NphAUYxZdv1JlzBrMb87muUQcfwVyE6aXcR1WZz46nwUw3r
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9223

Updates of staging and packaging variables' descriptions following
design and implementation changes of the last few years.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Changes in v2:
- Reworded following review comments
- Link to v1: https://lore.kernel.org/r/20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com

---
Adam Blank (6):
      ref-manual/variables.rst: update STAGING_DIR's description
      ref-manual/variables.rst: update COMPONENTS_DIR's description
      ref-manual/variables.rst: update PKGDATA_DIR's description
      ref-manual/variables.rst: update RECIPE_SYSROOT* descriptions
      ref-manual/variables.rst: update STAGING_DIR* descriptions
      ref-manual/variables.rst: correct a reference to STAGING_DIR*

 documentation/ref-manual/variables.rst | 78 ++++++++++++++++------------------
 1 file changed, 37 insertions(+), 41 deletions(-)
---
base-commit: dc1574b9f71532c469f355af2ff5ff5664083e48
change-id: 20260408-staging_and_packaging_vars-eb7f6d92a6cc

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>


