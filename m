Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701A2C021B3
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 08:28:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.85053.1740385676661048054
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 00:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J3I36axU;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so37856785e9.0
        for <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 00:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740385675; x=1740990475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3NvoprV6sR/BiQsY2F5ztwB5uJp4vxC0V2Jz9A+JBE=;
        b=J3I36axUjELB0YJJ7XpzCWLcDxc6Yei0f9A1X/UKjTQxEK92f6qC2MJdqMPx3Xnq8+
         n/73VJSjUDb+zHnbBWRIucGHtX2Vl+LoCDp7cSxDqkAieanjy7dTP/LLfg/yaDEA55x5
         ObgI7knLkUymd+f9kmxP61Xcv3BdVs8KzYHTeiL883E4xvRL7Aa7ORnGBsZ/w2VS9q90
         E+n/cz+MKOr0ni/3tNA44bzzgJdy4GMgDt2pMBmkpBTImWrk6j1ay3JFU3qm5ae/i0Jy
         eoXxbrAIgfczP2OM/ZF9eD7425iXRgYk4ohGZeH9NkwulNvmhmpicFfPcxKiuhu3OKZu
         itmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740385675; x=1740990475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3NvoprV6sR/BiQsY2F5ztwB5uJp4vxC0V2Jz9A+JBE=;
        b=kjzNCYdkBZgabkb9JZ56kmMWAOECXpelhI8e56Oz9/9g+52q04Ylu2nMsxmedeHcPE
         jLlj8vza9ikS39O5M7FCeaYWy8emt7okY9jIM06OfEjNZUabeT6pFEzhA+zyU3NZdyVv
         AkkyxF/P8En2g2iQst9byDVF9vkkeZHw8FkNZwdjXo8633TyyWAYPHmebEscGEdSczFh
         +XPdBMY1/CDt8Cg3reipVQ0JXeOh56fNw1lwTx5xxKgNX6sU2SEjrc8R6mO0zbgUgy6M
         ST9uXTPKTLso16/RAeLeKvmiZnGXM+n3KhPCSAd1U13mHko+nvXBzlQ7m3Osxa0nWU39
         Unnw==
X-Gm-Message-State: AOJu0YwT7HZPew0G1Kx5UjfzUZ8ai4oFlL/ky9OKqZgKQlePsTR4huOQ
	BNmbs1QJE+XdDj1CUgYdT4Sb6vc1GR9LYxlhif4YYCZNQC0atRrB+n5IPYbg
X-Gm-Gg: ASbGncsJ7/BrgzqcXignzLaD7clvBL/LrJ07xxO1ujJLjg3dpwfUJfkSoqFxOrV9f0y
	6yEkSj4TAtfoTJEyblYIWRksgi+hLvX53pBCbn9JRX44Yl52gNwIKrdlOn31E8PcvPzW85VuSMR
	6dT2jcDJkJpKw7POKBBDUtJGG3uSkl5wzaQODjAABvChugDJjcWsc9HZa/wsFi+y8QSkO2tfUDq
	k6Y+LivLf9ZwvHFMXfA1KtX1HTZuiUhw8NwTvn2ANYU2wjKseIzZnNsOx2MohWJtPq6mCsft5E9
	S+yrEZddDSnXVt7GXUGZtpNHqB0Z+Ig4MoA0FXVNyi+vXTZL
X-Google-Smtp-Source: AGHT+IHJh9RnI14N7PW6y5rULnBNRkKj7psMMxdtaQaqwBqDfmDuIZw4tr8FW+30N3Htkza+u/wVLw==
X-Received: by 2002:a05:600c:1c25:b0:439:86fb:7325 with SMTP id 5b1f17b1804b1-439ae223e66mr114876455e9.31.1740385674650;
        Mon, 24 Feb 2025 00:27:54 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915719sm31279407f8f.60.2025.02.24.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:27:54 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/2] migration-guides: cover FIT_UBOOT_ENV
Date: Mon, 24 Feb 2025 09:27:29 +0100
Message-ID: <20250224082729.3325776-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
References: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 08:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6432

Add a hint for users using the UBOOT_ENV variable and the
kernel-fitimage.bbclass.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/migration-guides/migration-5.2.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index de2ea773e55..4513186b7de 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -182,3 +182,11 @@ Miscellaneous changes
 
 -  :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead of a dash-prefixed
    command-line option (e.g. it should be set to ``3`` rather than ``-3``).
+
+-  Until now, the variable :term:`UBOOT_ENV` was processed both by the U-Boot
+   recipe and by the ``kernel-fitimage.bbclass``. However, adding a U-Boot
+   script to the kernel FIT image is a different and independent thing, which
+   also requires an independent variable.
+   Therefore, the :term:`UBOOT_ENV` is no longer handled by the
+   ``kernel-fitimage.bbclass``. There is a new variable :term:`FIT_UBOOT_ENV`
+   which should be used for adding a U-Boot script to a FIT image.
-- 
2.47.1


