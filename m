Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF1EC0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 21:57:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.54855.1738879049470623875
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 13:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SN/3Smk5;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so14042325e9.1
        for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738879047; x=1739483847; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTKhopSaVB3vrcGBZnza1DCHhdCiWhGIPMQGDNM9k8g=;
        b=SN/3Smk5Exx/54wQ6WXl3uX3FGCvZJmM68lm25sA/dYWWv3iDtj1H0qB/zG1MXN8qD
         Kqk/dGcaclwp0cJ56K+TFelpnImMHUn6yQxefZjyxZHEqkkHPxmfALeFLeAVkjru0yGG
         xc/bnjK3vzYYyQBwPrrK5GGV73qOmGrLvQJZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879047; x=1739483847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTKhopSaVB3vrcGBZnza1DCHhdCiWhGIPMQGDNM9k8g=;
        b=UsXa7Jwz80Gnh1i3KfZcqjyHzyN4tO9mQvHR7NtCkzyqJ7ch+jAOimhiWdCJAsiDTC
         cXXzuo8IfNUwAhrUxWI6LfWWwI2JLKOUjzSYin9fHhFkfs5PtHKqVIRFaZbv/ckM41ct
         I9cFVi5VI5v7VAAa916cU8F6lqEyOjvW2DaZDjK+3LpAQrFUxYk1xef6GAnmrk9fUjkn
         rlES0uyKsoMQY+oD/6EI5U0YEn8QZ+Ah5CfqV3CwiMQ4xsyoaZ01wlj0C7BOU9Fj/+4N
         /KbLcOvMO7vQqcYo/8+g3zjDvclbdLrqItJ0CLsE/KyKoU7y8QmjaOO1F8m1EIEoDjOT
         dMyQ==
X-Gm-Message-State: AOJu0YzgRI+QLZcanj05IR6WbAVS8YI8BxQcfguBx/AVhS03uON3dPk1
	TND2TzBGNrrgCJGrF8ZmdI0KihQMFYB+EbcoYRA3Hm6zry5tuINKYL/GiTXs6+ds1m9q7tnvl0T
	8
X-Gm-Gg: ASbGncvG+FJgOkxajlOFbLbmkKvutpem922FNolHlLKDKqOL7gWxD6JZMI8Efo7msyz
	SiN4sZimRK0nyi6G/jq53t+ZJljn0zcziZ/FjJJe0HYxIWKiYwqCDWFh7QTFwq5ANXFC1G1MdAH
	hDmkmYBh2/vzCqGx4l/1BqKyC5zNlbzZULQzuIoZoK5IEHeDYPerkPVbXwfFjPVbjlTSFe0fKdL
	IdqGnHfOZCx9GCrVPqZvSHzgPIU/3lbi7d4yUYXI2ON/ixk/PQdhWvyciABxZSLdnNBOzbCbAJy
	3jRYIDZyJKoMmJ6Muxk6U5CaXXtkUlMRrQS4cO+tyyTPlq+MVEoftyDBWOctFWa4G/awo4w299O
	LkkwCJg==
X-Google-Smtp-Source: AGHT+IGbBOSG3qmk0Tsf8t3QARBDScrpoma/al4wMwysQcJZhdSwEjVYzzsnPtcQplfsnfhJ/Lrg8Q==
X-Received: by 2002:a05:600c:1e02:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-43924992054mr9117785e9.13.1738879047289;
        Thu, 06 Feb 2025 13:57:27 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (lfbn-idf1-1-865-143.w86-245.abo.wanadoo.fr. [86.245.70.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11064sm67210855e9.37.2025.02.06.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:57:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v2 2/3] reproducible-builds: change/add titles in the "How" section
Date: Thu,  6 Feb 2025 22:57:10 +0100
Message-Id: <20250206215711.154194-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206215711.154194-1-yoann.congal@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 21:57:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6268

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

