Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12E8C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 21:16:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.54360.1717794964683737691
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 14:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dsKvr7Dh;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a69607c6ccaso301244766b.2
        for <docs@lists.yoctoproject.org>; Fri, 07 Jun 2024 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717794963; x=1718399763; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lTQOP9wm0HBYxnS2OWnLRIHBLjV2aoHJ2rmdp2R924=;
        b=dsKvr7Dhn/M5IN5kzb5dD5jnp4T8rbjYLYpyDfdAdbtJYDabBgYTJ3RGX5Zgkt4VBa
         VkTfEKcYeR9X/tKR2CBZMVDGecP8+LDu345xD4b2Hw6fzqlSYb1lk7R5lyckQxyTXTWt
         QBELHwjwbNUBWGGqZ+NW8vg8oCP6KEuHSSkxsJOdKMXVuYNCzDtRgpBlXpTTGOQUcc2d
         pNPSKty5JpSFVZZIbRB3jKPkeypP8EKHHSN3KHfZFfVS3XB9Kiilyz/Iy4WY55hzZXMv
         QN+PqNoe2d8OkI2Cg+HuE9f/UZ9O0vrk4vC55Yhxx6/Xq5dTNq12hH1dh0UErKpApgEk
         5mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717794963; x=1718399763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lTQOP9wm0HBYxnS2OWnLRIHBLjV2aoHJ2rmdp2R924=;
        b=OfJ0ORo0bJHOXGYjwWRwnyhiy3lqtJCUbPAHal4+ZoJRL77zF3wCWzz3XTbdPVfyIJ
         ZT+dXr/OYF3ZRLyhirCv6rCtFAy6zHl7BI6l48mJgiOkMTw9XOCCpI6VNcUVGA3maE9q
         6A8iVZMXyrKGjTYzDXTERFMxH00Bos42kC52hg5PKZ4ffv/CTeOocfqSTauTJVmjqhIF
         VAvljDs13pIq5HDiaWsrfRVejN0PCfDIcRY6pF4khAL3OrWoorXmcVcSexl3i+nIhRHx
         LKe7qKzh1cIOH/Ru4qXGSDuDUU/0zTWF4nVGTfqC3j75XeNGfkbAvZU12w87JKKihvhI
         qztQ==
X-Gm-Message-State: AOJu0YyoKe0gFmOSuQGuVQWMnaAOI1D3OHF2WmuOVWqk3YTuBavBhyxl
	Sxy8jCIbVWujO3iePpoe+hxKZ4JCOqJm0008ZrZAL1mE4vMa2nItanHZvCJz
X-Google-Smtp-Source: AGHT+IHncxO9jXXsHTJSoMiGOif5vOwPxxFdqwz0+sIZjZ0U/0KST5ov0Ntw+BEeDSaKlpeNZQg60g==
X-Received: by 2002:a17:907:10c9:b0:a6d:fd81:8f7d with SMTP id a640c23a62f3a-a6dfd90d34dmr152021466b.35.1717794962794;
        Fri, 07 Jun 2024 14:16:02 -0700 (PDT)
Received: from an.. ([2a02:810d:640:170:a8c9:3f58:fc20:bbf7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805c969asm298981166b.55.2024.06.07.14.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 14:16:02 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Aleksandar Nikolic <an010@live.com>
Subject: [PATCH] ref-manual: introduce CVE_CHECK_REPORT_PATCHED variable
Date: Fri,  7 Jun 2024 23:15:59 +0200
Message-Id: <20240607211559.455144-1-aleksandar.nikolic010@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jun 2024 21:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5287

From: Aleksandar Nikolic <an010@live.com>

Signed-off-by: Aleksandar Nikolic <an010@live.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07b5b6f95..88c3602e6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1681,6 +1681,12 @@ system and gives an overview of their function and contents.
    :term:`CVE_CHECK_IGNORE`
       This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
 
+   :term:`CVE_CHECK_REPORT_PATCHED`
+      Specifies whether or not the :ref:`ref-classes-cve-check`
+      class should report patched or ignored CVEs. The default is "1", but you
+      may wish to set it to "0" if you do not need patched or ignored CVEs in
+      the logs.
+
    :term:`CVE_CHECK_SHOW_WARNINGS`
       Specifies whether or not the :ref:`ref-classes-cve-check`
       class should generate warning messages on the console when unpatched
-- 
2.34.1


