Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859CAD29FBF
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 09:02:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.41688.1730883774650315571
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 01:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pRvx6xDh;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431481433bdso57210295e9.3
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 01:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730883773; x=1731488573; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=pRvx6xDhdKBjxNUcABTggrURX0/p7D5+vr6GOnRWRx0huxau5+KPJ9iolvEMDGFTlQ
         QqfWo8AgNatraDSthLGlHdOvGx2Uhp9BYo3shkNeBAmxyIIMwgLI60VUbxnL0hy3syFE
         rBqJy6v88Qglc6jfiNy0gq1Fm43ND+cWf4Mf6PA+Jck3BvZUikr0ztkjjZTBiRgBsGtI
         SHRIuMZH7Y7khESCrXEhSMuR5fCjyJk3EaV9oidhGdRSEYaASDHhQiQq8uBWY4bDzsPC
         5Yrari29UR5zUcUNLx5uekOxSX2APJIgohjjKKyX4fD2ASjfQXsD8lNB2krAvSfFV5pd
         UOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883773; x=1731488573;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=QXADQkMynb7T0NugY2fHQ3WfWCO54bNUZR+R/rVFggFa1EjoDTbR40OlPsG9xC4+jO
         Ok/J28kF2HKfXaF1xqpJEY6nV7mQiFQ53Vqnck6N9j+1Uqk5S26HWsw4nH9pFP5Lmoiu
         k3YpBhWcRN2hP6UeSfdEYNAjBZur0u0zkChwYaH6sFdOSIUMbmnC1bf3qSRwSUyKbW7d
         PoKxUHl3E9/IG5Yya5M/3yy0XABJx/BgrW1BwIg8V9rb+WX/EA0QnLT7JLj5PfoHEaxF
         +QSulI6hsaccxqe2AFaM0byyuB2gT4TNkrxM/y62BhXaLPKsVCaG675OX0vb3HdSAnNR
         zqqg==
X-Gm-Message-State: AOJu0YwFRweg5QfMjVkBCBuEBvBKUMGkSAaArtwOnfUeinUaODQF8G/L
	AM1kyjnXFD5p70ROWQcLGzoyVEzpxtun4f1dCeRYtmF9YYWfLs0SL6s/iZ9ZWLolPVMc6VgXfdz
	b3Yg=
X-Google-Smtp-Source: AGHT+IERf6vTPGJjjk3Y25LctWVN9rSwSFV7estg4NLQ6NXq+VaOZmnasEGKoI4c7jIfz4bs4odnGQ==
X-Received: by 2002:a5d:5a86:0:b0:381:e744:90c2 with SMTP id ffacd0b85a97d-381e744910fmr2600265f8f.36.1730883772436;
        Wed, 06 Nov 2024 01:02:52 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e694sm18671637f8f.86.2024.11.06.01.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:02:52 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 06 Nov 2024 10:02:40 +0100
Subject: [PATCH v4 1/3] styles: vocabularies: Yocto: add sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-add-bblock-documentation-v4-1-9f24dfe69243@baylibre.com>
References: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com>
In-Reply-To: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 09:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5692

Add sstate as an accepted word to avoid errors when runnign make
stylecheck.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/styles/config/vocabularies/Yocto/accept.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/styles/config/vocabularies/Yocto/accept.txt b/documentation/styles/config/vocabularies/Yocto/accept.txt
index ca622ba41274c892f1fc1e16d8332a02f07a3531..7fedda8ae23c22f3660292faa0a1c3df23da353e 100644
--- a/documentation/styles/config/vocabularies/Yocto/accept.txt
+++ b/documentation/styles/config/vocabularies/Yocto/accept.txt
@@ -2,4 +2,5 @@ BitBake
 BSP
 crosstap
 OpenEmbedded
+sstate
 Yocto

-- 
2.47.0


