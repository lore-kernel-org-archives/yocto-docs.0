Return-Path: <rahimi.mhmmd@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C86E6E800
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:46:05 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13814.1770115556824468997
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 02:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VObqcgb7;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: rahimi.mhmmd@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c626bd75628so2030819a12.3
        for <docs@lists.yoctoproject.org>; Tue, 03 Feb 2026 02:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770115556; x=1770720356; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KY+qh8bnsY27S9rF3hM7a9/GGL3mO9thnfnY32VFp5s=;
        b=VObqcgb75YZu6PB98H+0cV9gJ9XJi7mqbadyp/Vl9Sot7pJlR17CCDSZSs7PhXp6Ek
         CeYDn08w4HDHfs1vl7p9XY6vmnloIeTzpU0jUGxjGYit5Uw7ROvaAq1fglmc0YK63iAE
         2yK7e9IXehKa/9lYTDxxYJGXEV5/xgIxgSFIjUHwn3yJs2ULBHC3TT3AK93fuwrXVnJh
         vJN7UQ0vW1oSOosPJWipLaKmg5QQXAWCWCmoXcFyvvahQZVDpmbwPBc/p0oYEsefHEJr
         0T8C6c2wPFTVVdyFBcrLyYKQRpYJ0EdcTa0Ks2nhKMNic6y43kG8OzxjN5cqhzDyce5k
         6//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770115556; x=1770720356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY+qh8bnsY27S9rF3hM7a9/GGL3mO9thnfnY32VFp5s=;
        b=HaXMjL/hIDoD2cFyRKbTSO9TlyrIqP+ug9HZUk6Nr9yZ4OzaknwzwwDzwyg3VmdMsA
         zD7qGNyOqSD2k1EySOt51b+nte6i+Hmp24p0XSLHRPoteNZ8j7cq+J2jn13C2/9zfj63
         euQakAAlC/V+R1DCyEqA/MusqQ5a+Sbb01GdttJYj+EFO/XgbBM/EsLtvVQUNz4P+nD9
         yI/3t2ByKm9lgxRUwu6xrDPDwJFFNPRYiATj+phVVRsiP8bpZSFm9KbLsLLkrdg+olEY
         80ckry3pZdKiJuC25oFeHidgWdfwVMkaI3G7nUaJQNQULwO0Ltga48YWwxMhQNIWRTH4
         1ipw==
X-Gm-Message-State: AOJu0YyqXjT7FufpAf4FDKtb/hI1bK42lFJMryXjdyVH4gl7mUAHaiGi
	m4iXYBUcV/vml2GaBwUXRNbjf4SKlaDJu9z6mhpmTX92Ce/SBA7+yB7R0/DvGDUx
X-Gm-Gg: AZuq6aL1bSnQMrycpUAwlV4Sk1PBvru6yScTPx+pABv80950m8FFvoTTcviZ2r+AMnl
	VqMHjqQbIPsFWoGDfNbad4kZgOqWzNF1c/ipwpz2GSzudy9bwTa+laO26b1A7RLvdNAR09nReG9
	j6i7eiwiZIE1Vu5WF8Vu76qfZym4spDumL7R30X7cDDDACq2RNyg8crQA0HypfbFKg4Szm2C6aC
	xmkDsLIYOHuLQ/zzozejv+vE8dvL3Lvh36TaXwhwj266FGwq1ocXEEMFiQjwEGZvkTgZA+VQRFm
	wkhsP3OJomf8k1BM/3qszAUavqKnu0ioyZ4D47wb4Lb9sJa5GrKJb2ocgLVDnWiMPe45LPOZLiX
	yXwnD1owbKiIoHOl3htbRS3vu8i0LyYVcdwokMUBl2s1mGYkDO25Lm/O1u28U95j48GiwYkXi2t
	i5DWGN1boHhKk+odVcbPZagzbgAVzYpMYPojQGYjAW
X-Received: by 2002:a05:6a21:2d4a:b0:38b:e70c:63f5 with SMTP id adf61e73a8af0-392e0163a0cmr13978029637.70.1770115555719;
        Tue, 03 Feb 2026 02:45:55 -0800 (PST)
Received: from ubuntu ([175.145.217.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm16233010a12.26.2026.02.03.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:45:55 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH] brief-yoctoprojectqs/index.rst: remove extra word from text
Date: Tue,  3 Feb 2026 10:45:46 +0000
Message-ID: <20260203104546.4046-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Feb 2026 10:46:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8858

The sentence in brief-yoctoprojectqs/index.rst contained a duplicated
word ("dependencies it"). This change removes the extra word to improve
clarity for new users following the quick start guide.

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 84eb63c93..5c6e62c54 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -372,7 +372,7 @@ layer>`:
       git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/meta-raspberrypi ../layers/meta-raspberrypi
 
 #.  **Add Your Layer to the Layer Configuration File:** Before you can use
-    it, you must add the layer and its dependencies it to your ``bblayers.conf``
+    it, you must add the layer and its dependencies to your ``bblayers.conf``
     file, which is found in the :term:`Build Directory` (``conf/``) directory.
 
     For this, the ``bitbake-layers add-layer`` can be used:
-- 
2.51.0


