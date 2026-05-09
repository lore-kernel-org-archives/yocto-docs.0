Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6C0CD37B2
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 10:44:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9734.1778323437337071308
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 03:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JEQ+Zhag;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso16989535e9.3
        for <docs@lists.yoctoproject.org>; Sat, 09 May 2026 03:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778323436; x=1778928236; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/gfo6xS2VGl9I6jZAN9maWCY/TzpDh7+NefMkw5nc4=;
        b=JEQ+ZhagXURYVakFi0ieWR9kKydwX5e7Bc6W8rgYqKFgwLcPae4WYCzjum6p2qC3qF
         eIoUqtENvhqMKDI6Fn/y21eBWg9arCf04WQKDAOTIWPv7gPNQL2zmX6Bw4J9APiRM6o4
         f0gvvLnqASVKStZCZtoiMAjTvVhlHGgbfhpCAlUJX6JvggUFLXbi0nDs/ErVKMq+WKPn
         PGNncXj9ZT9CCiQjebuyA1LIRPwr7E+tiJ21NK882PHHaxRR0nyoEOwI5cbKjmTTRWE4
         pwvIlJihAA4zOwVL/7WvYX3Nw2A3wcI9AIoEu4wq8iNZUg/X6hz+rYSdF5MLEF3jpmc/
         PiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778323436; x=1778928236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E/gfo6xS2VGl9I6jZAN9maWCY/TzpDh7+NefMkw5nc4=;
        b=XcF7l2cmvMCK8/JBqmC46yZXC/7+qX6t+BbcnVbeRs3eD+g+uaifRegNBfKznMLKvk
         lDNNW5Wy38oNuScEJhEd+8u8ECOu1sEAnm4VxE3G79+MC5gdf/bMKX7n4R9VmdskIv00
         mOa+J8nTGp6Akmq2R7jsEbmYiWnEIMTdaBQDePv1akZHEPFKdaTNj8e+uqCZuWNBVgdI
         qjWaOUzncsG0aauaIi8YG8aENcRqG9MCs8VmjvKc7CoG2tSaRW3G+wWAx5GeSnFknnrd
         n/WKFpME3+H5gzKYQz5hyIhZWeqZapMf/0vSfKKQ3MbqzAAxXNh5b7po0sPRfMs3o3vl
         LAXA==
X-Gm-Message-State: AOJu0YzN9924D8/hTrxDmqiveBwNc0Dz8WyUABlZdDQigQoAS9pt8m6x
	NuFfMkxzPb9x7jf3LvBQAUrnqz3MSaP7Q/QR9Rkg7eibtz8J61ouMQN3
X-Gm-Gg: Acq92OGril9FGmtPKyuVy2tPdezEk/IXuOQg/7ntB3Te3d500YL/qRyZImluBDeZW2V
	k89UJf4OCySjgQYoF5/aLC/luctVwjxN85l/bpJgTbSnVRz8A1AwFH4JskFnnvRFJR++7w7SVQj
	5hHRp2jLBvSPeh88NaCS1sWrSsMQiBlvqABP0K6vnlFLFfOiNTBi3gxEIB7mDcBbpUuEi5i0A5B
	tx8XmYKU+Ch/OXVi+1qUPGM5CHTrThZP+E/GtA8VYyNTu7FPqXcRm5VtS/ow/6l9gMtXpv+Gn34
	jaxTjq/AkPNbWyR4R+AnmHdaEVAEk8HyajsPbzWdZVkoDVmX51y/ah7Ven+VCL2KmJxV/HIcG0k
	NfNOVpyKHuTe1NrcuMp1MOvK6bjJpTYqZndKrSxEHmM+DLNSS3wG4bKdAiJFBzQX8kw5JSbO/LY
	gwAEY0E92+GRtnrVSrRKiau2KJ1mAYwXdZi/M18PKGqJJmnumLwtNryaaBB55rA1KSsyzwCxIYC
	xrekyUZ0VD1NubNmW2w9hTzqpkp8Q8aR/De9tdm38Jk674cQIunVKE=
X-Received: by 2002:a05:600c:8486:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e706be062mr31199445e9.20.1778323435643;
        Sat, 09 May 2026 03:43:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:d188:380:b100:f430:86bd:b50])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm38837255e9.0.2026.05.09.03.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 03:43:55 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v3 1/3] doc: bitbake-user-manual-metadata: remove incorrect claim
Date: Sat,  9 May 2026 12:43:05 +0200
Message-ID: <20260509104307.26698-2-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260509104307.26698-1-bijak.dawid@gmail.com>
References: <20260509104307.26698-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 10:44:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9423

The documentation for inherit_defer contained the claim
"If VARNAME is going to be set, it needs to be set before the
inherit_defer statement is parsed"
which is incorrect and contradicts the purpose of inherit_defer.

Drop the incorrect statement.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 40cae6b05..ee6919dc4 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -829,9 +829,7 @@ Here is an example::
 
    inherit_defer ${VARNAME}
 
-If ``VARNAME`` is
-going to be set, it needs to be set before the ``inherit_defer`` statement is
-parsed. One way to achieve a conditional inherit in this case is to use
+One way to achieve a conditional inherit in this case is to use
 overrides::
 
    VARIABLE = ""
-- 
2.48.1


