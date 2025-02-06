Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A88C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 13:18:35 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.40483.1738847908278449468
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 05:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K5Wz/OZx;
 spf=pass (domain: smile.fr, ip: 209.85.218.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab737e5674bso173381566b.1
        for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 05:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738847906; x=1739452706; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTKhopSaVB3vrcGBZnza1DCHhdCiWhGIPMQGDNM9k8g=;
        b=K5Wz/OZx44iBytLQ552KX/r5RyJXEc9Vwtip+CRLqVhYWNUiGZ6gq4I1SrO7j7IGBR
         83Otc9NtiYI8AhnYp7Wa4n3Y9ED4qUrGI3b8Qgvc1HuYqib82wL0QkHybWeqDuXzKv4O
         7A/TFya1/elygz38yeYpEKYKLLCpmydEaCkCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847906; x=1739452706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTKhopSaVB3vrcGBZnza1DCHhdCiWhGIPMQGDNM9k8g=;
        b=SSpGTlSUKIxzuuBYLoctRWHsfnHNvkrTKLhtgLdP6QEmdpvwOxRGbPwnHadU81eID5
         rNuO3Y4pSWH6mlDxWqWXTJYrBHMSxJHXf32DES3eDCnCGS3EySxFOv+tXHB9z7Sy4C4e
         gVDCOA5OqQa3gNnEVEvrCylnQavHYcVhzINg/n8eaUZ/Rb9tJ1Ct95PJujQ73DIvxMka
         29/sxz+F/mdY6J/Or3/c1yPmm/xlE/vq268tjiOIaNzALzbCwi7mmR+9scuNsJTtZLJX
         KeVGOjw2fL7jzmLpM3lxqyRwXFOO/jDIG0oMt+f585BDPBbICCBPqPTt215pCTeaouo2
         xgVA==
X-Gm-Message-State: AOJu0YyNDA9dafMFNtHIRcViz/Aq5q2vvOf+BjWq8k2l+OUl+Omh44LY
	vV8Ndm4XkKpqbYnHj4lAMnLj+8K4XejVJ3OoH1t7EyZ3wmF5tdrqK8JYMjZGDZDZlpqubQGgjOg
	F
X-Gm-Gg: ASbGnctgC3dvUUn4SITX5n8rRVivaToKonuT4LWZ443I5Hq8tg8i+EBDARnOXnD1FBo
	AY7F4M/WZLYQ3Vw5cu6fgWPU2Kzqoofm+cr0jQlEs0hdMKiaXiwU+O0MNYEyYL8Zg+MDVT55otb
	1AKkP2oWipURjLIDHfCIePzGcwlTlqadu4PC5x9Q5CZpVHhVerN/a4paQwMpvdc7h69DWLLAJGl
	jVqCiIrOyXjPMbFlUYX9q5wmxbEf6jw/R2VUmPwRPn7ML40KQHp4oP6JW0ni2qbIxV8WYlDXdce
	0IludOyfIw1eXKy6SygwWqeLhWdo9e29MPJFLxzDDJpIigDrrKuorv+WoplPAPgUywlAG7VK5JD
	u8sX9ukKrzkgKNCxA2zxGBncmA1oJ
X-Google-Smtp-Source: AGHT+IGVW/c6QKcpNdT0LqWfO3uj650wU7jqpT27UYPvMAXLPm6ag4jHFcqTXkz9nbv4fIYidEED7A==
X-Received: by 2002:a17:907:9688:b0:aa6:7a81:3077 with SMTP id a640c23a62f3a-ab75e322c85mr780382266b.54.1738847906481;
        Thu, 06 Feb 2025 05:18:26 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b815c8sm898568a12.42.2025.02.06.05.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:18:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH 2/3] reproducible-builds: change/add titles in the "How" section
Date: Thu,  6 Feb 2025 14:18:10 +0100
Message-Id: <20250206131811.86935-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206131811.86935-1-yoann.congal@smile.fr>
References: <20250206131811.86935-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6259

From: Yoann Congal <yoann.congal@smile.fr>

This is preparation work for the following commit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
 documentation/test-manual/reproducible-builds.rst | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index aaf2e4541..b9f671d68 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -122,9 +122,12 @@ The project's current reproducibility status can be seen at
 You can also check the reproducibility status on the Autobuilder:
 :yocto_ab:`/valkyrie/#/builders/reproducible`.
 
-===============================
-Can I test my layer or recipes?
-===============================
+===================================
+How can I test my layer or recipes?
+===================================
+
+With world build
+~~~~~~~~~~~~~~~~
 
 Once again, you can run a ``world`` test using the
 :ref:`oe-selftest <ref-manual/release-process:Testing and Quality Assurance>`
@@ -132,6 +135,9 @@ command provided above. This functionality is implemented
 in :oe_git:`meta/lib/oeqa/selftest/cases/reproducible.py
 </openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`.
 
+Subclassing the test
+~~~~~~~~~~~~~~~~~~~~
+
 You could subclass the test and change ``targets`` to a different target.
 
 You may also change ``sstate_targets`` which would allow you to "pre-cache" some

