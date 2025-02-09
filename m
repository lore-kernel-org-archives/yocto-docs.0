Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13503C0219D
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:32:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.39925.1739143972031897848
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 15:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2ljX5nnW;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso25206805e9.0
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 15:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739143970; x=1739748770; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ndTeMSAIyhoRYS/WkHhp5zUjCk9FO7UZlGvMYmohqw=;
        b=2ljX5nnWgbm+ctEpOahPqtMV49sgtndrmxWDtc6vewJjSp8cnfFlgggKcJVOR2i6YZ
         c6ctjxh2eoVBFZFTHF17dgeEV3Caac8+7R59qKI9zbzy/BiIlGCdOCMqSOtxPh9GrFbj
         EcvEBZcOubCWJwlNu3ojD/HHPKTd6jqaiZgbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143970; x=1739748770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ndTeMSAIyhoRYS/WkHhp5zUjCk9FO7UZlGvMYmohqw=;
        b=FO4INGV7UXmqkzpIFDtY33EEuKb9jWLyEYFHssoAVMHmYw5I5hGwRDFD+oDSNNaJYH
         Lv9ff1FnSL2D2t1i0BieBTJA1AlOaMNoaLKGgiHvLnPpvUjEzJNZin2Qb4akxqlCj5na
         lms9iSAW1swBUOwCPBhpXJdBJye2sckzK5L1MvhPLlsK/cflctQ4IckqC0QGATDnoWkd
         GB9hTRXEAPEcOcZr9qPqdUaQMYiVDbYYa0ko/HJJX7O94UNLcvOCZFHMvnQrgVK7kihv
         laiYs3iIFggU8cq54zwzI7EQz+tBM4JAHsQyyr9Sk15YDgdcA3FDmN94UINWVNijShrk
         +XfQ==
X-Gm-Message-State: AOJu0YyYNmNBnAuqmtNos9Q1Xh5tEK5xr20zo5MFaZSAyU9y9RJIAeeJ
	qoKH88iJ8Zsp7gp9oPBamk9G2TirfCdvJkVu8YRsxL9CeaGlXon6G77X06Ezl6huiLFSIwb52z8
	v
X-Gm-Gg: ASbGncuVmL1R5AomaozB3nXez5XMNTdB2JXx/8sOvaD9W3UZnYssNdW88CG8Cjm0Aia
	0vi37YW1pdUPyBO4In2ApsjQFxJqcbqBJBXFblYRB2IAIdbRmQUUEQxPPWitkseG1ZoknkWdGzk
	UcFF/Q1HBK5hTd6nNLfcRfOhy5FyNQ5pUE7mGZDXgqy0TweD9qcTqk/EXWBKheRNqM1QqUC+/lL
	jKeZRmB8THkTDUR/buZ5XOkWrRDczU3SV4lSHcU3pTuZuKAWGmhc8IUJAcOIY/aRi8d8W75PVZF
	cad6nhQsrJYzaJpBkCegVe8AkDylaL3JROMwBozbhPVkQnL8A9rYv3L4UZeivpLioXQVK5UcGyq
	x0jtAoNolSJNADGgp7B9mGg==
X-Google-Smtp-Source: AGHT+IHrqIwibSX0O6mXQdUZgtbXxNKx/t3Km3a1C3EaWq3sAun85zz4P3Uwt2CvCqe55PhIkhMopg==
X-Received: by 2002:a05:6000:1ac5:b0:38d:b57e:71e0 with SMTP id ffacd0b85a97d-38dc8da7a56mr6217359f8f.4.1739143969764;
        Sun, 09 Feb 2025 15:32:49 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm17027895e9.40.2025.02.09.15.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:32:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 2/4] reproducible-builds: change/add titles in the "How" section
Date: Mon, 10 Feb 2025 00:32:43 +0100
Message-Id: <20250209233245.1397155-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250209233245.1397155-1-yoann.congal@smile.fr>
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:32:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6314

From: Yoann Congal <yoann.congal@smile.fr>

This is preparation work for the following commit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
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

