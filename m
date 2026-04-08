Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DFD1073CB8
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:05:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105899.1775653540181265406
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IBMT2eFQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so740358366b.2
        for <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653538; x=1776258338; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxWECf3yhcG+iLjquZWmsfX51m/NgtyObCXSyqv8fTc=;
        b=IBMT2eFQX2qXxZYjoqiDXfCpkXcmiA0qi65tsj0oN5HIn6yr+PTgu1RNG+H7OwQXsn
         T5Zxsix+wwvZEuk9smHGjueRrzAf4SA/yBP93NBeJippRCTKwVL4ppJes+TnelHp8fXr
         eWcWp0xusUXavaPOJ2I5UNiej0E9LHxdlylBQ4P8qAr8ZYVhEZpt/I/rzxmDa2iI5tnh
         tJIWIdSjWQlJc2PlZStaKlMmM0nDYOllWpCa8/eUsi78NMDUsmWvihvR5U6D/YmQt8H5
         TxsrijQYOh5e3hizVVYari/bDG+5lXNlHDNc6GlgcVHnUJbhCC6Ml0e4qYh4hQpudlnH
         iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653538; x=1776258338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxWECf3yhcG+iLjquZWmsfX51m/NgtyObCXSyqv8fTc=;
        b=T8IHvUAdL+EszwheRRxNWkRMGinqE6Wi5KBOR5oHJ0oy8lV2wrjMPMMwB4WAVflhDP
         Lp+mvhJ91xNjr+dPqnRsssTRElc2h4GwOibpSiY6cXxgglBcvwyOy1l9tscNuskb/2T4
         0UvSlvLqS1cb0l1nw9lgKf4ngoK6BrYHXSy1zyEzsVCNPI+kMWXcC30UbBp1vwu4/zHh
         KocwtL2oIqxeuuJ9Wii1uO1FFhJb4C6OX1ltwrCU2C8COdT8uK23Gkf/HMCUq3UsACW8
         6wjCVVs4K6X+v7zoL24ol7hAQnHC6nCFu8+ep07vy7QUgtOMpsUVKG96PVgNCqKE4Yjx
         PUsg==
X-Gm-Message-State: AOJu0YxF6Qf2eNQFRfsoOlMY181vD+ydHm+BXBBg37bP1Gywzhcun2Th
	mV26guUJjqcMePx/swRUsz79ywRXpdkpFdaeQphwB8QxeUjM7k4IgAwVHD0Y4g==
X-Gm-Gg: AeBDievAUtR2qZL2KfTJCHBGH7sdMDbQyYxDjNCUsm1+4ELeUgpURtFWQC9GA9svJGI
	Ttt16f44nnjnKnyygKLGmtFosQ8Daa7ccDqd2qpzqcep2tdH4vYCcNnFRYm8GARQfMxvtsv2o08
	sE7Ql3I4Rdd9cYmO6YVbZFRtBMrGzciPa+wLneTbwYROswDfoZHFUA/HsOEBvw5Ne1xH4PL61Zh
	ieSAqBjnd9MFT2byEbBKFEkKFX9EghHvgUFChuBpvukSf9AJKgVm/6MgF3QzD2c9/7Odjv9Exwz
	lhnGCCrTedTbocJMmBMIn5wTcXUtlEDSQLO0t8zxVbLbdoNcwTFYsNFLW1KoRpVxblyE/zeoIOx
	u94R+B3MDfq9Ew4KaYpED5Y5eoo2S4xqp+y3VeRRMqui/goLDaWSqF/6FDI3tghD2Ke6upz64oW
	VIMaMpLIto2FwLaGBXgJ33a/5L/bQ8ug==
X-Received: by 2002:a17:907:6ea1:b0:b98:40a3:aa0c with SMTP id a640c23a62f3a-b9c67950947mr967875366b.24.1775653537693;
        Wed, 08 Apr 2026 06:05:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:dab4:c153:72eb:4100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm656643166b.21.2026.04.08.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:05:37 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 08 Apr 2026 15:05:26 +0200
Subject: [PATCH 2/6] ref-manual/variables.rst: update COMPONENTS_DIR's
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-staging_and_packaging_vars-v1-2-387f482308e5@gmail.com>
References: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775653534; l=1005;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=otr4bLGR0fykE/z/uDupEVzgjTet0FChoU1tTgk5lNY=;
 b=y+KjSKD8vM2X6buGDy4wkqwGallz0L1882ttzU53PXfK7LU1POpzYB6KGlHjXYhtBJTvdOUua
 eqSFKaBQxzYBjrno5b43Ww0Fbm34RhL1vNk9sdREKhsO0joHjNIucr1
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9201

Make it more evident, that it is first populated by files from
some recipes, and later used as source of those files for the
others (staging and sharing files).

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7f19723ed..e11294c6b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1712,7 +1712,7 @@ system and gives an overview of their function and contents.
          (set via :term:`RRECOMMENDS`) are always ignored.
 
    :term:`COMPONENTS_DIR`
-      Stores sysroot components for each recipe. The OpenEmbedded build
+      Stores sysroot components provided by each recipe. The OpenEmbedded build
       system uses :term:`COMPONENTS_DIR` when constructing recipe-specific
       sysroots for other recipes.
 

-- 
2.43.0


