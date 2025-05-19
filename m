Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56F9C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:05:52 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.47822.1747649151397600748
 for <docs@lists.yoctoproject.org>;
 Mon, 19 May 2025 03:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nM6R24V1;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551f0072119so1114946e87.0
        for <docs@lists.yoctoproject.org>; Mon, 19 May 2025 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747649149; x=1748253949; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz/69KI47wZN03KD/++yc81x1YkZGawSTWOW11IOYcY=;
        b=nM6R24V1Szn+6zMpC7yAw3fenXHxSuvYV2lFxTwffvK7nlpfhWc+1W6tOkEm6Pj8ws
         J4uEsINYm63LEB68eQg8/n/1SPRQJpHfFqdMoF6NyEF39ibxMjOlhKyo5o3xge92ibEs
         xNM8dJrsdsW0MS/twtcxn0DF3K0Bf7Y929KxamGAxgGhmecy3E94IX8E2P2wjkm0W+Nc
         gH88WqYhlxq4D7us+mlZyopqr5ZytTb9EhKmzp/jRGWqGmj2tlo4IkbDC9YtE88Tis7v
         qn8i2BdOznzbDNVEAxXNX5cSDqjwF12a8vj1dBsp78DRGrnTB0tczDM+ZYRZKsSBqOZT
         /SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649149; x=1748253949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yz/69KI47wZN03KD/++yc81x1YkZGawSTWOW11IOYcY=;
        b=WPeOyzbPAytdvVCGnLBUQgBsBotdHXemeecW/0au+efx7erQzJBe0Y2uUGVbuKXDbu
         VzxCTCD1CWfV0ETDyhukgZTTohOT3F9DuoIAnLYWBVaaedVvsVjQiy9adV+THk2w+evZ
         eGAtkpcSQ/2tGaVREPzVicNa5gBwGzpqkWuOtvZJlVhDBaGdQh5LSCDKeOFVA3LaQ3jf
         z8Dppgmf0wig0W14T4JIpi0WadTeYuCeIDx8hlpfIj9JeBGk9153Ip4jEXzNC5gaFHFD
         Dj1PnhmF6LutkcGcdzKVLDX9LybfWvJte+ME4ILTw2nZu9WRCBxlAfQqVlHedAgye5qo
         yiFg==
X-Gm-Message-State: AOJu0Ywsc72aedZIQW68oolbfN+NiuMFQGRD7xtrtd3j/Qfw0p1aH86g
	nHVKXrUcDei8Rx4ubJ2k39s7Vx1FtqFoAwRkKilOEuAC9BrJOlRZBhvAIFjO1ll+
X-Gm-Gg: ASbGnctwYBqTu4Z9EdoZF8J2SavTGjOyRpLEWxxTLL2PPTeahAawU0hLD16exGAPtwv
	unday9bQnXj4B35jKVrUKp3WIk0TWsBbkBtNel4n0sheQvwdkynURBEFfiMhBw6Dn5+VxBqnTs+
	aWPCRcrugC9D2LWYQ9+X1PHIhUlqfExRHWZv+Mq+N+OFoLdSAN44wrDGEkVbVd+ktudbonnJa8L
	jwLcMUzOQsTuR9a26fMFLSTlVG7PSQEgwsubyHD09iCiXzm8Tp2Xr3Tk7+kXr79AdvH2aES2Vl/
	QKtNgQ5nnz8JVKDtREN7VV0dQ/pQiZpEl9WL9Ndg0DSGjsn3AUXPFPRFg2HsLWFW1QU3
X-Google-Smtp-Source: AGHT+IHJKpKh3n6CfjDovQrKi5xbd84DEYKUEIa7VJBtC2zC3brSJ5Rm9k5agccx95xDXFFTyuWRwA==
X-Received: by 2002:a05:6512:660e:b0:54a:c4af:15 with SMTP id 2adb3069b0e04-550e7506c32mr2977352e87.19.1747649148865;
        Mon, 19 May 2025 03:05:48 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.152])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1640esm1784204e87.40.2025.05.19.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:05:46 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH v2] ref-manual/variables.rst: document INHIBIT_AUTOTOOLS_DEPS
Date: Mon, 19 May 2025 13:05:34 +0300
Message-ID: <20250519100534.44168-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 May 2025 10:05:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6838

Fix [YOCTO #15756]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..1a3c52045 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4487,6 +4487,20 @@ system and gives an overview of their function and contents.
 
          INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
 
+   :term:`INHIBIT_AUTOTOOLS_DEPS`
+      Prevents the :ref:`ref-classes-autotools` class from automatically adding its default build-time dependencies.
+
+      When a recipe inherits the :ref:`ref-classes-autotools` class, several native cross tools such as
+      ``autoconf-native``, ``automake-native``, ``libtool-native``, ``libtool-cross``
+      are added to :term:`DEPENDS` to support the autotools build process.
+
+      To prevent the build system from adding these dependencies automatically, set the
+      :term:`INHIBIT_AUTOTOOLS_DEPS` variable as follows::
+
+         INHIBIT_AUTOTOOLS_DEPS = "1"
+
+      By default, the value of :term:`INHIBIT_AUTOTOOLS_DEPS` is empty.
+
    :term:`INHIBIT_DEFAULT_DEPS`
       Prevents the default dependencies, namely the C compiler and standard
       C library (libc), from being added to :term:`DEPENDS`.
-- 
2.43.0


