Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A52C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 11:19:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.28536.1737890334797624551
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 03:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h7YBKe3Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso22938905e9.3
        for <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737890332; x=1738495132; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4vEjbHjRD6lUJyFJ3UE8E1MqpBoQ+8OiBgAia6nlDws=;
        b=h7YBKe3Q/2KdFZhVuWxznCavEiPdq6p3fMPF1c7gBq185C4oq4CbvtcOPT4Lw/icP9
         /tJkmtfffJfYboTtyXhRAh6uhEN4TjAo9Pqw9DeKFvOrI371oB30Pc8DLvhCEDViFygZ
         t+QJUdZucBHkybaQdGKbDuL9eexbk1Rx78xhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737890332; x=1738495132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vEjbHjRD6lUJyFJ3UE8E1MqpBoQ+8OiBgAia6nlDws=;
        b=doI6KmIpW4cawzpviDyVsZsni963dB9j4hH7Q/kDsUJwZOb5tfYPgSLxjY5Dqwiodz
         +ej9T+0b1lvtID3DrucrQm/bAXD7sFAX1cEQV5Tuqyc8xjXALrpNSYzBy2Q1ZzqagOL6
         Xrg1esleiY2YboTZpGCG4fACDBkwItzU4OV0HxnIn/nFbDyjQMnX3/sr8xCJFOe4IYsl
         QAyKczhpG1+/X0WAqi0iAcEqg8Ou0GTuyMtf7e2/e8p4LUq9wleWfm3tkftEpn4W0iOV
         OzE1JGCjFC4e01W06L8tHS1RJ/naUZ2YSyz+oXVmr6sKY9Qd14PRYYZFHQbYjAJppi24
         MgLQ==
X-Gm-Message-State: AOJu0YzMoZPXsHJaJ6oOaBE+TJ8cwc1mFJcxqgmklFxwfDqUePoK5Xfn
	uSjBmKf4yZyS9utJA+4dAO8XmOTvDT7BEjhHSQnua2iTeNsqgcajcXrvVnxioA0UF5Q9uLZRrTn
	em0E=
X-Gm-Gg: ASbGncv/ktbuV8g4bMXFfuVneBAozg/980I6NHcx7Zv9JjHUF7KHmV1bhkzqUXYn4Wi
	6uxx1RXfK9GeHS9eCKELmauUoBEg2kJw3a65d+aqWlGLIyfSvPCXRuSHvjD80wt+7+k5fVQ2BkG
	7krzHvI5N/b4M5Xt5XB8pKnjuNs6gKcr4NBd+/Ye1YdzbPAZxiL+jjiKiWXt+dyeW7AG6LakSOq
	HxJwg+5HQaCyPG5+mu9sYQh7zWNs83EmLfq0GdR7OoML1/Ia7rcLjKwxwKpzjDFKwSno03jIyyL
	wmtIz7Z+WIdffZHw4oSm3e23QNE0o+1ZwGkYCRYtniY=
X-Google-Smtp-Source: AGHT+IEieNFl6Umz+Qo/dEViiKDrZpiuEewYW/Knxv30cqXNfQmZYTOvTSLCc3fMogRQ8GlNW447nw==
X-Received: by 2002:a05:600c:450e:b0:436:1ac2:1ad2 with SMTP id 5b1f17b1804b1-43891427485mr303773505e9.19.1737890332489;
        Sun, 26 Jan 2025 03:18:52 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6905:4568:b67b:291])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857cesm90181735e9.13.2025.01.26.03.18.51
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 03:18:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-5.2: Add entries for virtual provider and multiconfig changes
Date: Sun, 26 Jan 2025 11:18:50 +0000
Message-ID: <20250126111850.2609298-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 11:19:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6176

Add some information to the migration guide about two important potentially
breaking changes in 5.2.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../migration-guides/migration-5.2.rst        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

[Note, I didn't test the formatting of this, I just wanted to get some text shared
so we don't forget these. Hope that helps!]

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index e9de6910e..fdf44757a 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -94,6 +94,28 @@ systemd changes
    not for socket files).
    Now all service files must be explicitly added to :term:`FILES`.
 
+Multiconfig changes
+~~~~~~~~~~~~~~~~~~~
+
+-  The value of BB_CURRENT_MC was changed from 'default' to an empty string for the
+   default multiconfig configuration to avoid needing to map the values within bitbake.
+   This was already not happening insome cases so fixes some obscure bugs.
+
+Virtual toolchain provider changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Support was added for virtual providers on a per recipe basis for specific key toolchain
+   providers listed in BB_VIRTUAL_RECIPE_PROVIDERS. As part of that support, the 'cross'
+   providers were simplified to remove the triplet prefix and generalise the naming, so
+   for example::
+
+     virtual/${TARGET_PREFIX}-binutils - > virtual/cross-bintuils
+     virtual/${TARGET_PREFIX}-gcc - > virtual/cross-cc
+     virtual/${TARGET_PREFIX}-g++ - > virtual/cross-c++
+     virtual/${TARGET_PREFIX}-compilerlibs - > virtual/compilerlibs
+     virtual/${SDK_PREFIX}-binutils - > virtual/nativesdk-cross-binutils
+     virtual/${SDK_PREFIX}-gcc - > virtual/nativesdk-cross-cc
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

