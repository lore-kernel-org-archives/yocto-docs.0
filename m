Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DD4C021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:31:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2828.1739316708832173512
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=In98Dj6A;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so20769395e9.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739316707; x=1739921507; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzlJgCDjuUfhPH1t7T6GGqN7eVLSPlzC6y3JvwH3TfU=;
        b=In98Dj6AIqSUBx0vIaBYN5LGtgwRWXTxZhQ+yzKthYc5Ayvc1xLuQFUj1WVN0KOT1v
         ChiMIPTWnB+a0U88HQWvmc+xcWn22DMLhCxduQPYr2NKtW1tJHOPJqY48nRsHf72YOO4
         P0YG8Q4VkSj8HOVxOv2BSOXXPl5NJ0p2g/010=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316707; x=1739921507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzlJgCDjuUfhPH1t7T6GGqN7eVLSPlzC6y3JvwH3TfU=;
        b=vjk+VKk0JcEsmQppPnxuMf1KV9HqOLLKTgaKlG2bWlUAlzY95aSnLXv7s4wm5wJyeZ
         RdN/Sp4kYt8nk8g5FPIDJ9+tujbRRtvrMomN/7CGTh3rLffCQR5FJxQFbRsLE2aEQMB8
         5rdOBLUQ/xzA2GNnPd3R7LsaqK8dscJV3YiabQ8HgHdNFoXlRFBpXudWmGMMeXlM3rFc
         CoRd+ky1k/6HJugDcNVm7BiDbAtynSCS8jUKHLj1OoyHfAfJ57WzSiI30rstZOqIsQeW
         23M7G9yw8wLlWriU33gr3zWMPCI9uLLAEwPswGnBl8S3KYlX2M2Cs3m9MrKBHOVCnHeL
         Ya8w==
X-Gm-Message-State: AOJu0YzadyEFV/yvGIMAewT4SeAksE+SaddINcHtY1Xltw0V/OzWKkSY
	YV4FA3Q37nFtn+iPQ45hOor1acdEhF0ozI5hIIZE/IgPDEef1c66aHbL5QiFnAISGBX4B2BWJQ5
	B
X-Gm-Gg: ASbGnctvARYlOqJrhtLdlWfMhtTAXcy3tL7tzq44z2il+Tb9/t3CmxhBByTfd2XHI7Z
	1UjtUmF0mLmnN27VSTAdZx/yHaJIW0Xu9p6DLAMNOaVdVv+rHnBXTNiOarDPbsqqIfcrc7D6iI+
	4+xkGpYnXKI3IB3WETnwOdVAYxokuklHMU3jyv6VBNS3Lk6WwNYJbSWylwOZFJFSMLquNqGuMGm
	TpXaGh4iWUHr2qFn1wC19vdSFY9HOw2Nz3dAreAMzqW1lvttqyJwHUPht5AwlmbYbA8SrCwg+c0
	7IRsHp9FBeGcBVaQWnqqlD2xksscnvYtbdGa
X-Google-Smtp-Source: AGHT+IFBMfRaMD5pASsyodPkzG2zc0H4Aq/P3YQ7N++sL5h5AunKSno2CxouZ/eAISehIcR7TWvtrA==
X-Received: by 2002:a05:600c:1988:b0:439:48d9:d8aa with SMTP id 5b1f17b1804b1-43958165dfbmr9047835e9.3.1739316707035;
        Tue, 11 Feb 2025 15:31:47 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04cd94sm2367475e9.7.2025.02.11.15.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:31:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v4 2/4] reproducible-builds: change/add titles in the "How" section
Date: Wed, 12 Feb 2025 00:31:09 +0100
Message-Id: <20250211233111.2632384-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211233111.2632384-1-yoann.congal@smile.fr>
References: <20250211233111.2632384-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6339

From: Yoann Congal <yoann.congal@smile.fr>

This is preparation work for the following commit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
v3->v4: Reviewed-by: Guillaume
v2->v3: Quentin's review:
* Removed Guillaume Reviewed-by (given privately)
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

