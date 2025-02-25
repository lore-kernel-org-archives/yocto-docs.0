Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB71C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 21:37:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.20856.1740519469126449651
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 13:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CKmi55HB;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so59351105e9.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 13:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740519467; x=1741124267; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vthYIdRXKhmoktkyfv32oXP4zw28pMkri5P9KCF3yy4=;
        b=CKmi55HBRRaRY+LoxcWR/mEt/HcB9PqbqUGOtIBS4pof4x5VjYG8JP+k7GfdiqWCS7
         JeklN2e0NgFzq4IBVqSBNoMjlUk71a6gy3dGDqCTWV0d+vkj4j22IvpgzAdRjILvdfRG
         oJyiiXVWs0h3FpMrU8r0tPIubzyD7h/7Nyh9rjP2o4s/C0e6knLl+YxUrXMkRdBgAxeO
         AikM4FL3i2Tzb/NyhJvswomKxHdaq27xXxa+xGSpaHKX3Lsx/1oQwab65M5X4byFjBMN
         QjeFtelbjs0+xnEG9r/SUnUqao90Yx8z8pkZpvPKqpHPUX3nCFL9VzviAO14bX0A4K69
         R8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740519467; x=1741124267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vthYIdRXKhmoktkyfv32oXP4zw28pMkri5P9KCF3yy4=;
        b=HBA08Bdlgk4zLiG9+5OqqDNnzzkDFGdk6foUyFFMsQyFk9Vgv7CCBdkb5cUoRQY6mP
         FjjkihOdhYrnIL5JUowqeDLvvz66z0dwg9vxqUP4xIvRNOCJfHp94z1C2fupxf5l/i5D
         ephTrkkguwhoZTqPZr8JbDTGiZhcNVh7YJLebOqVgAvUUFHzGH0I/+TkK05ip2boMZB9
         svSvi0sr8egAmoLIPVDv3La/p5s44UIq/35dGgIrVZRE7aGn6n1G5KJfT5y7BlUpGcUf
         kmK3xNq/0fN0+dJK/JpUbUdKz57TOdbeDKMT9JgVZSu1zbmUbOd+RVbGvzDtG5NSVt0Q
         Ss2g==
X-Gm-Message-State: AOJu0Yx8SadBOxm+LkfJlBSTDj7AT4XrZkOe4PUnxwA2lRmIhICFqRn1
	cPIBmrR7/jL1wkLjd2/v5SoWV7OM2p28QFrig5nYtEPkm0QzAfOcv+ZjlbIz
X-Gm-Gg: ASbGncucf/dF8hYYFZOZ9aGdNt7TKW+x7ApalEyl+tW/eE2T8MkP8WgEXmMSg58UnkP
	vKhVPBsLmk/IEwTYEy/h43dztpzvTBA0KjXSTtanUBnXw2oXZZfVQjVCadzz0AbzNHD57m7Ibvk
	vwOquIVAqVj1Ck1eh1BfMz87ognlhBhCkSOh7XV3DAyKATDDSi9AD3X0P5iHEMctzUSMv3ReSZF
	YdKfQqR/tKaS/frxZRB3YHhUyT1hjEzmR1OpqjhE44K1CdlV6eXEMlCYpBPkuzoTXAiHoZW49hJ
	cKfXR4tUfeSWEtC3aXotDLxhn4keO2bwsY0W11SA3XcrCEMG
X-Google-Smtp-Source: AGHT+IE2WL7q+o0lsf64adjCgmnIsvb3wJVe2oDMDM5vaoTAYhE6k3aq7WfYkeHGBMdKbMny/zfpQg==
X-Received: by 2002:a05:600c:4446:b0:439:9274:81cd with SMTP id 5b1f17b1804b1-43ab0f2566emr51050045e9.4.1740519466874;
        Tue, 25 Feb 2025 13:37:46 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba539450sm589205e9.21.2025.02.25.13.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:37:46 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
Date: Tue, 25 Feb 2025 22:37:35 +0100
Message-ID: <20250225213737.3343894-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 21:37:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6454

Incorporate the lessons learned from a regression introduced with commit
29d32063ac0abb1017756f62f94aec22ce305b60 and fixed with commit
d63dba2f98edf89558647e336b19d805b00f4d98 into the documentation.

The use of the variable FIT_SIGN_INDIVIDUAL is explicitly discouraged.
It is also noted that this variable may be removed. It is important that
we try to simplify the implementation of the FIT screen as much as
possible. Adding appropriate notes to the documentation is a first step
towards this direction.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b432488a012..645bb1453d1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3173,7 +3173,18 @@ system and gives an overview of their function and contents.
       intending to verify signatures in another context than booting via
       U-Boot.
 
-      This variable is set to "0" by default.
+      If :term:`UBOOT_SIGN_ENABLE` is set to “1” and :term:`FIT_SIGN_INDIVIDUAL`
+      is left at its default value of “0”, only the configurations are signed.
+      However, the configuration signatures include the hashes of the referenced
+      image nodes. This means that the entire FIT image is appropriately signed.
+
+      If :term:`UBOOT_SIGN_ENABLE` is set to “1” and :term:`FIT_SIGN_INDIVIDUAL`
+      is set to “1”, then the FIT image is signed twice, which is redundant.
+      As this leads to additional complexity without providing any obvious
+      advantage, this feature will likely be removed in a future version.
+
+      Signing only the image nodes is intentionally not implemented by OE-core,
+      as it is vulnerable to mix-and-match attacks.
 
    :term:`FIT_SIGN_NUMBITS`
       Size of the private key used in the FIT image, in number of bits.
-- 
2.47.1


