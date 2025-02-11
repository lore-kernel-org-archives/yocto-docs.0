Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D088C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:48:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.3038.1739317678466927903
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=4D8ZPCBK;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4395817a7f2so2197605e9.1
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739317675; x=1739922475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzlJgCDjuUfhPH1t7T6GGqN7eVLSPlzC6y3JvwH3TfU=;
        b=4D8ZPCBK26mE4RuiJzrdJn9KATDUeRTdluq+6wI0WdTbpAHyO9xwPZBT/NvrRNplfG
         SJTrIA+6hytWhK02rCOXel/VSlAlpAWkKzocZv6fcCrorJM8m3nQ1FpqQfmNUzg0XmpW
         RvGNy3IPvAEKJS3IvC/xCRYhXlXpRNptD2L/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317675; x=1739922475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzlJgCDjuUfhPH1t7T6GGqN7eVLSPlzC6y3JvwH3TfU=;
        b=aaw5lFNff/iLgrnv7K0IfqnSBW9UDoX3iDIH4fU8K7lHfpUM1EKP90v/jgSedcQImY
         BuORHv7lj+LciS4HQn+9z+l6scI5f4D2ASe8vdhXIqg/o4gWBLn/pUEyaSbfCPirpxze
         cLgX51c7BbU7LcmKFPtQcinG6aYD/BhHboghuiYFGMpjxMcAywqCWVPfdDbOI4KN4ZLu
         ltASJCc31HPEO7RSGZMx/WHz8ck2L9vgP+zIw7KJtBCegFUJwXPHwwqLwZrKqLGFfXO2
         m5e1iikZy5HmjpESgOi8atwAjKlRbNn1LNXk0bvy8O4o5LjYBHVIaXzPxxG1Mtbwd7Tn
         KlDA==
X-Gm-Message-State: AOJu0YykcmTUKRCmQfgpQWto3bCMTAuENoYi9A5NE37hcnqRoWNvYp9A
	pO5xUJ4JvCGY3UB6dGlYO8xsVsCYVOTbGn+FJpSFQiU2Tur0QdYjcqxjwhpaJqZREDPJcwj0oLx
	I
X-Gm-Gg: ASbGncugg9aom6w1HnfeqWDr0r3HwCrRdnZEr+1vE6zTGJh50GgxUrhTowBf9vMIVMk
	rSAt0/EyV/P1/GZhNZBLWCgepgHg5NgAiN0GTepTjBc4YZrGTf3dU1OamLYqxU9wiahh0c66wYC
	DuF/PisCdLP4MlFJkOUPo76RMwINYBUU3K+PNX/uQdCGfaFeHsFC3/OGTUDU3DMjB1KKI5oyA53
	CLhie64Rb4ERnxSBJWheXiOQ6NJUhruDVeZX6Hs7hd89Ct87Y4azoJxPHwePwMbjnmOhruukRbM
	hcVNW8EomYoAzx5D95UuPN/cIXiTGuLN+zmO
X-Google-Smtp-Source: AGHT+IF93JeEEt8lJTQx34iTkaZTJiHMsDO9l7JbpUsKREP5FeiZFgosFs2s5QSCT7wH4vrGFOdi1A==
X-Received: by 2002:a05:600c:5487:b0:439:3dc0:29b6 with SMTP id 5b1f17b1804b1-4395815fcc5mr9089505e9.2.1739317672486;
        Tue, 11 Feb 2025 15:47:52 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm2413455e9.36.2025.02.11.15.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:47:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v5 2/4] reproducible-builds: change/add titles in the "How" section
Date: Wed, 12 Feb 2025 00:47:36 +0100
Message-Id: <20250211234738.2633971-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211234738.2633971-1-yoann.congal@smile.fr>
References: <20250211234738.2633971-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6346

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

