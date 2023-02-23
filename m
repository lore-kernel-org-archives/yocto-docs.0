Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A719C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 10:37:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.7687.1677148625782628240
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 02:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=4CygfkV/;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id l25so9898371wrb.3
        for <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 02:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RsLX9aR3YO23r1YxIM3XtRjHmkWeV2kxQOF8GZvW4M=;
        b=4CygfkV/OGn238gsN8tab32X7HoK7iki/5rufltUslL46eqNYFuIsHHVvQst1Pm7/x
         z+aCm9oxeDVKRzez2u9JlWGlmhgZS5OaF7ofoh/TzM6myJkSQjDhbrp6PkjyedFEs9BT
         Ej1QgFBOo3gWr2W5lzm10gjeQLsDE4wZSuiwHV6NKAmKVspHdcweZkUP/9r/BT3o1DIu
         pYaERVybDqi8iyr7f1GZ1Xtwgouxh5dL2GwuuMPiyadeQ97hX14ghQgnT1c/6SbzsmrQ
         JqOO5siPAwh2A295l0xIlUKWVzIqFUS3DDwgefJ91uDdf6xS4LqSiMxGhne4EEw0oBNJ
         DvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RsLX9aR3YO23r1YxIM3XtRjHmkWeV2kxQOF8GZvW4M=;
        b=1oB0D9016y2a6a3HCmzSctHgfQk2FTHAkvR0fZ8g/niDb2ry/Ezrhdv2X7wnDF/G1Q
         mTGKX1vptAEHPDPWfWYwEw6INL0Ij+hbEL9GperVhuemSYEwKzBBQgzBK7/+v34Acin0
         mS0PGFz9yzVjzOaFv0WkTzN5ZPzVy68wZMASkq7SNXuuELYMVIBxoWRT8pKtpu0qgreD
         c3PcfYA2Xmxh36nviO3OteYgI1q78bt2iNicW30wggpd4f66OvM3ES/KbApwGwIOLGNI
         xeKoKkxCKvAcJH0S7/5bKlsQOl0htFU4E5J+zgiIF3HoNELl8VRkDM97AY85yoRKLIVG
         WjJA==
X-Gm-Message-State: AO0yUKU8+wd2pRB8DKRMz9Vy5xBrsq5+dvKNIkfWD0HLdOtAaWa5AZmI
	lkbA1ElX6JYjBPGBaAZZu2c8wYecKcn+Vff/gEs=
X-Google-Smtp-Source: AK7set9oAyLk4AK6nFBTFs0YCQryWEWScL8wzuoJT/HeYLfJ3YQT/vn8v8w136tMljQuBndHDAi71Q==
X-Received: by 2002:a05:6000:1f83:b0:2c5:642f:1550 with SMTP id bw3-20020a0560001f8300b002c5642f1550mr8558410wrb.15.1677148623941;
        Thu, 23 Feb 2023 02:37:03 -0800 (PST)
Received: from P-ASN-SCRUM.home (2a01cb000684ee00977c2269f5d74531.ipv6.abo.wanadoo.fr. [2a01:cb00:684:ee00:977c:2269:f5d7:4531])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d51cb000000b002c5804b6afasm6663038wrv.67.2023.02.23.02.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 02:37:03 -0800 (PST)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH] ref-manual: update DEV_PKG_DEPENDENCY in variables
Date: Thu, 23 Feb 2023 11:36:36 +0100
Message-Id: <20230223103636.10170-1-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 10:37:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3724

Since release 4.1, the variable DEV_PKG_DEPENDENCY sets RRECOMMENDS unstead
of RDEPENDS for the -dev package on the main package, this change fix the
documentation the match the actual state

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 documentation/ref-manual/variables.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 725f5c54c..1f777602e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2004,9 +2004,9 @@ system and gives an overview of their function and contents.
       variable.
 
    :term:`DEV_PKG_DEPENDENCY`
-      Provides an easy way for recipes to disable or adjust the runtime
-      dependency (:term:`RDEPENDS`) of the ``${PN}-dev`` package on the main
-      (``${PN}``) package, particularly where the main package may be empty.
+      Provides an easy way for recipes to disable or adjust the runtime recommendation
+      (:term:`RRECOMMENDS`) of the ``${PN}-dev`` package on the main
+      (``${PN}``) package.
 
    :term:`DISABLE_STATIC`
       Used in order to disable static linking by default (in order to save
-- 
2.39.2


