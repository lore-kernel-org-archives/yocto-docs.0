Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2317DC35FFC
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 00:35:16 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.2122.1742430912654693231
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 17:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IX0yXj8e;
 spf=pass (domain: linaro.org, ip: 209.85.221.172, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523de538206so112786e0c.2
        for <docs@lists.yoctoproject.org>; Wed, 19 Mar 2025 17:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742430912; x=1743035712; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y59giNKtwyBUQBtmmF9ISweqvTgmhAj61z+4ZJqKxaA=;
        b=IX0yXj8eWNIZC5GHRFX/OjKWURP1My6Ur+yXsgIpowwTHDvnUgJh94Sme/gJxluFmB
         agUIpQ0kZsHF3zV7GKzBMoaE0VePjM2TjvuPqyNjus4THA51EK6fh59A/Gpup2rf5siO
         8arq96Pg2qlLPRCVuGJix2KlFlPkHLcHdIPaGMd38sPSxJNDT4W8mVxZSiTCfcDenG+T
         tRx7BINIgmIzT2aFFafohYBjQT5XYpOKmElIDBC92RNblxdPmhOyRRHsctGi/neGPieb
         DSQe+Zu2T38jTbp55jB/LzmA+5O9398QkQwUWlRRCGnpQqtYL71vdpueTUm02QYvXhE9
         bZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742430912; x=1743035712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y59giNKtwyBUQBtmmF9ISweqvTgmhAj61z+4ZJqKxaA=;
        b=fIkMc7OjzLhFC0611Bv+7NtiRwKbudx0+8F3he6WzQB9itxlujB6LlxZy7c8FKdH8Y
         m0Y4YfD9ZfTos3Jlwy6QgTK8wlKyDTtzSrLAfFpvyNp0ZgIMReJVcbr4C2MLahYVKC+F
         66yfP3kUIVXuxLV95YBBbdaUvcz7CQXfY36N9Zl99yb1JxhhbgnygpJnptXmlYG9O6ic
         iTIjtYKdw3gnokY1Dj/o1K6jo/fdOeEnlgAnxuF2bwLCLRGCFWBmyDYwlfqhhjWwSoYt
         aUkPGzvxqsRHTzlt8SItua4/YcD7Q2JaNsaSUiI8Hr+QA9w3hPy2KNgGdXO+ctfWxjXV
         k9VA==
X-Gm-Message-State: AOJu0YzUyb0juq2CprTWlrj5t1wjXB30imABIqnxSWL+Oq1bBU8lrHC7
	8vp7ao/dyFQCup6mhZnIT6X2KNtCbmRiLU3St6jEwxYiDsR00c+mIkVr2KnAb3/h9tPtv2d6L/L
	GDeI=
X-Gm-Gg: ASbGncv8DO6tgr2QL8bSPF8VAGqv3TUNL1OX0f32+yBaqkoWLdDXCGWXEA02h3/ygXi
	L4u4MASRllI6DdJoK4ULDVfYDOvePQ2hvA3woVkaBHnyDjhW+QLkFCvgm/42Ji8d+HNp0vDvJke
	mM6krCZlTqVzt5H1lJQZdmfBsPJsh8u6eUxJLPXk0io1pUWJcoAlr4tvrvfnE43ATQ0aAEf3fz7
	ox1yHGWyfy9RCttd+mz1bChddY3M3Wa1vMfjV1V8taLYCzL85lrzU52i2Ku3F20rSprf5EYoZEO
	6ThKNfZtl3JvJ1mULONl9Hjv+l8r7dRz7uzJG+KYJyi5W0OGwJcjl3F7uzbsBA==
X-Google-Smtp-Source: AGHT+IFtYPS2v0+uUVNNLnu4S7K5jquw0ZhLLgu7XT1LkhbXofgJeRKsg4Nnpr8daz+jsZsNW5fNjw==
X-Received: by 2002:a05:6122:8c03:b0:520:5a87:6708 with SMTP id 71dfb90a1353d-52588febfb7mr4342364e0c.0.1742430911753;
        Wed, 19 Mar 2025 17:35:11 -0700 (PDT)
Received: from localhost.localdomain ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a581473sm2726908e0c.3.2025.03.19.17.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 17:35:11 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH] doc: Mention `if [[ somecondition ]]` is not supported
Date: Wed, 19 Mar 2025 18:35:01 -0600
Message-ID: <20250320003501.978567-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Mar 2025 00:35:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6596

I keep forgetting using `if [[ somecondition ]]` is not supported.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 415fbf6d6..5474e154f 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -1381,6 +1381,10 @@ To make use of this technique, you need the following things in place:
    To call your modified version of the function as defined in your recipe,
    call it as ``do_foo``.
 
+   .. note::
+
+      Conditional expression using ``[[ somecondition ]]`` is not supported.
+
 With these conditions met, your single recipe can freely choose between
 the original function as defined in the class file and the modified
 function in your recipe. If you do not set up these conditions, you are
-- 
2.49.0


