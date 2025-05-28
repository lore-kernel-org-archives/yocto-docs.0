Return-Path: <csanchezdll@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DC9C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 18:15:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.2492.1748456130913327719
 for <docs@lists.yoctoproject.org>;
 Wed, 28 May 2025 11:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mIkvWrcZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: csanchezdll@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a36748920cso83813f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 28 May 2025 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748456129; x=1749060929; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zihHULEvYuUnJQNsM6G65I9OLYV+I6r8vqfHnBql/SQ=;
        b=mIkvWrcZFjl4teqISw91UKp7jaMjQSQ9kewMH0BZa+WY1TfRj00es8AWvWiCqf1FBy
         m+CmtgVkvfHj/nr0q7ni7i66GqAl8CNN9h/YNDYabdlGqc523MDmrTkWc6TOvYoPM2a8
         EAgy69gdXWhjrCfG5M9zQ8tI/ireWxXt24Mzpepkq9aOt4b3v5mmsJu04kyQYvjTzRmP
         8zi/Yrjwf25KNoysv8R0dMPdkuVYUMmN3W1V0jvrohTs/nwOCokZEbLbzEZJKZknKAxA
         voAPRNLaqwlqNzs2dYHMyBgDI5Mv0S5a6+3Exl56+d93y8HNse8rTiLtFtVEIbaL+FQK
         ZWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456129; x=1749060929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zihHULEvYuUnJQNsM6G65I9OLYV+I6r8vqfHnBql/SQ=;
        b=hqmOU5YLIwHLu3gPWPKoxa6yX1L8ghNjFs9cceZrA2kKgJi8xhanjm+gBPWSkHbcf7
         gQnX4YORtGYrtCS+s0GNh1XLXBDTBEQoZPhWYJ7dTTqIhJKWmVPfM1t4Z2zocQnpgJXB
         3RUgNKq5BcEeygMBWbs9GBL4GeZL4Y19QxxwX/1+zUnX1lCJ1wLixwv4aLoTn02XTrOt
         CWFLiaJ2F/QeoME0bCcgghJbWkfsRbLXHfA28yEiggworYzCYN/GVHnVymVtEkFtK9tm
         UFEATO33IAlt6FJJEyIKTTIfQ83+vheaeuqliuJ9cgayCxHNyAgy5c3/luWIZFxauKZX
         0p+g==
X-Gm-Message-State: AOJu0YwNoqUCvOn/7nblF7c34wHsQadAJW2JrXyk5RmcAcDpgRZXf0Fk
	B60LsI7nawwOXa1zTkCpb519DldvUh8omCrzyk8giemdo8WthSkeRuwiuyhY+g==
X-Gm-Gg: ASbGncu8lT9trKOnkKWZ8dxrSmaV1Xnb2JwIQ8OFvxiwRt6FxDfOuHLgc1PIohG5YXd
	J1UcSB+ZYg3GQyGMoatQw8Jp5wpNwNR8sgaBVZT8rM/C7PpwCXW6ANeE2SAAZxpkZnpsWspopwn
	KDr117aCkep3iOZi3JvCTDQZgtdVpcBYm30A74k7wsupGb3WS2V409YirzIgAwHT0Ze1eFfP0KC
	1IyX+70Dqs06ZcdsOxJHP8cslmtFxHsjx2R74SgrCnf7nhWCVBfff+ihQAX8Sc7t3L4TfnxbIlm
	iY8c1KsrP2jsR0iGlMf2AlrGC/F/caIkzs23XDujFz7peNgWe/i1mB24MsmOj+FFnBzyFMfyqSe
	7Sy75asmUip77SkDyWA8+JQMwI9+iOQ==
X-Google-Smtp-Source: AGHT+IFSUrmRK9pt95bM3MH08cPqN1ArEVxb8i7ZblerAgs/5y8fbG6h8jeXYGd2vQ0OBAsIr0sTuA==
X-Received: by 2002:a05:6000:2c11:b0:3a4:e706:5326 with SMTP id ffacd0b85a97d-3a4e70656efmr4324815f8f.3.1748456128768;
        Wed, 28 May 2025 11:15:28 -0700 (PDT)
Received: from localhost.localdomain (11.red-83-33-67.dynamicip.rima-tde.net. [83.33.67.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac7eb27sm2114438f8f.40.2025.05.28.11.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:15:28 -0700 (PDT)
From: =?UTF-8?q?Carlos=20S=C3=A1nchez=20de=20La=20Lama?= <csanchezdll@gmail.com>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Carlos=20S=C3=A1nchez=20de=20La=20Lama?= <csanchezdll@gmail.com>
Subject: [PATCH] ref-manual: clarify KCONFIG_MODE default behaviour
Date: Wed, 28 May 2025 20:15:24 +0200
Message-ID: <20250528181524.2797025-1-csanchezdll@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 May 2025 18:15:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6946

KCONFIG_MODE defaults to 'allnoconfig' when not set, regardless of whether
KBUILD_DEFCONFIG points to an in-tree or a meta-layer defconfig.

Signed-off-by: Carlos Sánchez de La Lama <csanchezdll@gmail.com>

---

Previous discussion:
https://lore.kernel.org/yocto/CA+KcR8ARBUj8PTcvA=rx-yob=WHYcS2gUnGX2aROOjy6bZGqWw@mail.gmail.com/

 documentation/ref-manual/variables.rst | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c697bdbbb..da274f3fe 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5036,15 +5036,8 @@ system and gives an overview of their function and contents.
       options not explicitly specified will be disabled in the kernel
       config.
 
-      In case :term:`KCONFIG_MODE` is not set the behaviour will depend on where
-      the ``defconfig`` file is coming from. An "in-tree" ``defconfig`` file
-      will be handled in ``alldefconfig`` mode, a ``defconfig`` file placed
-      in ``${WORKDIR}`` through a meta-layer will be handled in
-      ``allnoconfig`` mode.
-
-      An "in-tree" ``defconfig`` file can be selected via the
-      :term:`KBUILD_DEFCONFIG` variable. :term:`KCONFIG_MODE` does not need to
-      be explicitly set.
+      In case :term:`KCONFIG_MODE` is not set the ``defconfig`` file
+      will be handled in ``allnoconfig`` mode.
 
       A ``defconfig`` file compatible with ``allnoconfig`` mode can be
       generated by copying the ``.config`` file from a working Linux kernel

