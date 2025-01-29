Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8788C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 14:18:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.13354.1738160334708705268
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 06:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=izUrYuVs;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3496578f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738160333; x=1738765133; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwKUMquFKcShHer9rv6F0hFbMTfL0wwg+puiaYa1gyk=;
        b=izUrYuVseCKjGezqsQnxeps4sHKxlG+QU5XNchoc7ztnjEJ8a2GVXCBdXP2XbOVpr+
         ZptKBybWwZdM7MC/Q4pHGNH6x9NVjpZ9NFgvaHXMq2Hm0cdFMW93mRdjF2Bwk8Fsms5U
         FrrZBwSwnwAWlHcEhS2qkhFyjxQ7q9sofPF0T4YNEg/AdpFzzc9TXA46+iEcbwOVJ87S
         TwGLcwCV+f9hA1qrv9N1MesMLjAFor4+L7lVoPmO/W9ZqpPEUcL8CJMo5z2f8xBegO6T
         CdIgog5mZ2leV7WyKCThv+bY+fWAROqnLtEpoxpabUtqvPcPgakGYChEzPrniRBnXP2z
         tCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160333; x=1738765133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwKUMquFKcShHer9rv6F0hFbMTfL0wwg+puiaYa1gyk=;
        b=ZbpoVhfRAPyy7Alik2faIImD/1yLQyx0nFgOLcclxvJUDxy1Y3vST4j2ODcT69T8mx
         iaB/G689pFZgyfN8tQbffH8pf16ltNfucOqSMaBrCYdBtl9Ii0pdTdKAp6eDAvQH2wGE
         VcSS7EMYtdyZplC49hFLezCZSUdGiykaHX9cCUfQArwjVqSiL9Stx5Ej9fjzSYsod6z8
         ONFAaypYPPpCUDhZBvnHCaUJGMt/vQOuZhxJ5gJ7xuywFSJX/x2WG4YD7pQMXKk8AzON
         9zN6U1ZkrVHzQl2sv55tCmYqHQGiEAn7Slg/KHddXM2CoNhWvyqqzxbKkk1lGu0wL/JZ
         4fUA==
X-Gm-Message-State: AOJu0YxFzxn7n0VF/cnMGDsTlRhx6DcvP9WO3FadAwZ2CE0R5l9VUHZS
	IXRa2vCzK4c9iHpOhueJzZU28EHMgrmu1zMwFm4LzDreMQmMRxNVArdX7g==
X-Gm-Gg: ASbGncuBwpWfiFgvC28CKbPRT44qobeY4yZvb3SI48uFVfm6RNaP59csCU86KfMffzf
	Cu4yGlpASq9BuFS3hanqIjq8k0VIyNiy11ABuTDyWNQlgTLSTEaw94UDFmWzwr70qKtk+Hq5SGu
	5O0wff1hoh0LR3s0U2QXUZOdaEmqHjo4JAhr+PWOwqamu7KrVJ3qeXcb2pNojG7FszYSUpOv+ub
	tKN3zYx/eXGqEHGE/3di6nSV3IhsgVY2HB/OE4gWwfsdWANuW033oo7EMYw6Tgc4MWjdTzHScqh
	OPng+kVoaQhizOjTIyG92nNLFDYiweJIX+FqB5Uic/noRg==
X-Google-Smtp-Source: AGHT+IE8SJRYjP/WIMorjxR5R9s78jdsLFu0K7iUfDZjoqxWy0VBV3a/HcJ+/1Es0dSnrY2uFJQ2Ng==
X-Received: by 2002:a5d:5847:0:b0:385:d7f9:f166 with SMTP id ffacd0b85a97d-38c5194b0f3mr2569821f8f.17.1738160332549;
        Wed, 29 Jan 2025 06:18:52 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188976sm16967662f8f.47.2025.01.29.06.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:18:52 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/2] dev-manual/packages: add information about signing changes
Date: Wed, 29 Jan 2025 15:18:48 +0100
Message-ID: <20250129141849.838672-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 14:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6210

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 documentation/dev-manual/packages.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 4ba2dcae3..dba07a2c6 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -819,9 +819,19 @@ to use signed package feeds (repositories) when doing a build.
 Signing RPM Packages
 --------------------
 
-To enable signing RPM packages, you must set up the following
-configurations in either your ``local.config`` or ``distro.config``
-file::
+To enable signing RPM packages, you must modify the RPM package
+configuration to include support for OpenPGP signing. That may
+be done either in a recipe addendum called ``rpm_%.bbappend``:
+
+   PACKAGECONFIG:append = " sequoia"
+
+or in either your ``local.config`` or ``distro.config`` file:
+
+   PACKAGECONFIG:append:pn-rpm-native = " sequoia"
+   PACKAGECONFIG:append:pn-rpm = " sequoia"
+
+You must also set up the following configurations in either your
+``local.config`` or ``distro.config`` file::
 
    # Inherit sign_rpm.bbclass to enable signing functionality
    INHERIT += " sign_rpm"
-- 
2.48.1


