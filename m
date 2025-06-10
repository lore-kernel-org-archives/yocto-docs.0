Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6352EC61CE8
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 01:51:40 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.76799.1749520292335843960
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 18:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=OupqmUdq;
 spf=pass (domain: limonsoftware.com, ip: 209.85.210.54, mailfrom: anibal@limonsoftware.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7387f21daadso2489048a34.0
        for <docs@lists.yoctoproject.org>; Mon, 09 Jun 2025 18:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749520291; x=1750125091; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wRJmoapZdK5iFvKLILWUW+yiuaocYT8kB4qdxhVQcF0=;
        b=OupqmUdq184K7IQdimQP1mqnebsmeuLWxgp0yXmMbgtBjwcyegFOoAkoYm63ZKlmz4
         QDAjhLinaNr0ta0c2AyHHhemVEnxfaOKSScna2FXNoIXNOvLt1WSrGEsbORuNylehbzh
         +pWqI1nl25xieMMD98LlKAP+YKM9a5QlipSy4Vo/VatL+Eoa+yyxJqSRWkD66VXMKHSv
         5TenzTOa4xovlOZo9FHgWudaavCGC6uVE5NeYnK+6fpmw2YUZkrxZiGPG8jKxwtY5LgC
         04eiyOF74BySnWBygc4pW8a5BjZpum1HeUpcPILuHwqfaGp0gE+URhM6S5hdHzOK67Vy
         PEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520291; x=1750125091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRJmoapZdK5iFvKLILWUW+yiuaocYT8kB4qdxhVQcF0=;
        b=uGNthY/Ia/Tx+Q68fcijtiB7DZPZZLu9A8JSW8ltg2cSPQg0mDwLqktZaf1FNIJd5f
         gq5uChviVO2D2s2sqG9DC078K0gm3/Zsvc0Mv9HJbkyNA7k2bHX4mdtYhJClH4rJVyVc
         McX+K9UC296MVftWqrfmiGBZxZoBwwlQ+lTjocMQ9VnkOR9RxY03OWPUB6IFc5m95Izu
         85+lytBXaB0U0oQmg+ZUL30qHAlHcDEnv+7kcohrhAmyTDfhvw0O2AoervotR82lIys1
         HPvW8SXWw5judE3Bk+ntK7kLXhuN1g9ZrZ+Jj6cilEelxXlQbR27GdQBlQ58ai3qiYun
         N1OA==
X-Gm-Message-State: AOJu0YwXdVcoSTCfWgSA8PAsB8qqu4AtsEZuqsrUozok69jEnZOB82mz
	swTQxo5V0mMvROjbRuZhI0XrbldIXPb9VYG+DE9PCQmuy+/yviyGIRD0MCogIjPBMiara5lMKIM
	YeGbFueU=
X-Gm-Gg: ASbGncsXuM/Al1Ppcwrk2yyLuLVsc/HeNVFVhdpaG1RixVGPYwb2fzBfVjcLZWIMHyS
	udvBGMyFxfrcfOFAfUdZxfYcDRJHbG5xrt3vTkI2S7/S43CSwcovlb6IL318h5BYErn/i0qxYmB
	u5+Bo+B3K54b2/mBWhLNi6pP0BJul9T2GEmW2PMAn1FzWMRtLvvO1tDs/6n8a98hYlcd1wZKfme
	WMNCmT8Wr9vpcs86/Z7sR1VKhMWhW7Eyi2pDtmvkQ3QfotdCvfbopiU8qKM58t84XuxnufOW9XL
	RBWL38lH6H/U0UU+Shpn5BGWWmYRb99tT5+MZhHzgwvlzTribUXFEg8PBurUxPLG1jLk/sgmOzA
	9W7Bl3Y8DMF0RlDEEGe1JyLwnqN4=
X-Google-Smtp-Source: AGHT+IFwMXG42Me5XwjajXeFyUmxMfX7gKBKU7ED7v8gG9yA/Rg+tNzWZprIb7RV48W/8w36LxIqFg==
X-Received: by 2002:a05:6830:18ce:b0:738:5294:785a with SMTP id 46e09a7af769-739f6a16e4bmr890072a34.6.1749520291329;
        Mon, 09 Jun 2025 18:51:31 -0700 (PDT)
Received: from ls.ts.net (fixed-189-203-87-169.totalplay.net. [189.203.87.169])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7388a070a44sm1804812a34.56.2025.06.09.18.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:51:31 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	erik.schumacher@iris-sensing.com,
	yoann.congal@smile.fr,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCHv2] test-manual/ptest: Add info about fail state of ptest-runner/ptests
Date: Tue, 10 Jun 2025 01:51:25 +0000
Message-Id: <20250610015125.4276-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 01:51:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7036

On the ML was pointed about no specific information about
ptest-runner/ptests so improve docs around.

https://lists.yoctoproject.org/g/yocto-patches/message/1622

[YOCTO #15832]

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 documentation/test-manual/ptest.rst | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 2c021af51..d01735c08 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -46,13 +46,19 @@ Running ptest
 =============
 
 The ``ptest-runner`` package installs a shell script that loops through
-all installed ptest test suites and runs them in sequence. Consequently,
-you might want to add this package to your image.
+all installed ptest test suites and runs them in sequence.
+
+During the execution ``ptest-runner`` keeps counter of failed ``ptests``
+and use it as exit value, failing the execution if any of the ``run-ptest``
+scripts fails.
+
+Consequently, you might want to add this package to your image.
+
 
 Getting Your Package Ready
 ==========================
 
-In order to enable a recipe to run installed ptests on target hardware,
+In order to enable a recipe to run installed ``ptests`` on target hardware,
 you need to prepare the recipes that build the packages you want to
 test. Here is what you have to do for each recipe:
 
@@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:
 
 -  *Create run-ptest:* This script starts your test. Locate the
    script where you will refer to it using
-   :term:`SRC_URI`. Here is an
-   example that starts a test for ``dbus``::
+   :term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 to mark it
+   as succesfully executed.
+   Here is an example that starts a test for ``dbus``::
 
       #!/bin/sh
       cd test
-- 
2.39.5


