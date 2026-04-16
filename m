Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AEDF8A14D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 09:25:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9673.1776331519990667120
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 02:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C3DTqc+5;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso72121425e9.3
        for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 02:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776331518; x=1776936318; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT1iFazPB6LfjWobU6dETzS1t1HEKb0l+aX9CXf47vs=;
        b=C3DTqc+5pC4kgGQb6fWhOGZpgh7ZkQKjgRSeA9soRSd3abX60b6SIaS/Vb9OuIZ9RY
         ynxNzPgBvHfPOt90UgA2C207XzYTNQl+PoqgGCESqkzWjt/3q58+lRCOBKhyz11swbwQ
         9RoLiDknW0Edj3E46hwIUjHIQclRmR6sGcL8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331518; x=1776936318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HT1iFazPB6LfjWobU6dETzS1t1HEKb0l+aX9CXf47vs=;
        b=O9iTfRp3qlrCDaeq3GNU1lrGliaWAZrBB/raAJTORj0IUo+wHv4eTOqoXyiq47s9wv
         fjeaqRGQzJ1Dkq6EZw1Fs1tRALvKJdnFqW7QqeW1ghPy1ZLSzsWZheBj/dru5djbum7j
         FUtLp1ZPd2ZFOotOFHK4rlY75XjLNINnt9BQCvPLNhZXit3Oh1u74jAvi59lH2mK5jnI
         EUjumn+SAMBAz5MwhtLIKgMAs2YyHRHfCSsckmVFLZY0YDvEePlAW/B0uEDGdbqKYgOE
         MQsvvPQUJ1BEpzBAJolQabE4VLxvtfCYJ0KXNF/BtY5+Q4SGr2Ju7xLPIJaqtiW96svB
         j78g==
X-Gm-Message-State: AOJu0Yzz9zUFprzAywJDoT3Np+OMAYM3+gmXl+aaGxmBxPVWo0+Jqen4
	MovbCvp84y3JuBX/bzd0FIOYHbYwN2T/l4MbXTtRFL1QR2cHESwDE4oG8yHH7pkyJNY4RoDEkCd
	0l2f6zxY=
X-Gm-Gg: AeBDieuvE/MkOsmYYx6ySQL7/0OQJtDSA90LnCEFf6vwE8bda2ijZBaaucVvsNujiCT
	WnLWhgN6tCkFDWDFgcwV8BcB0pgPSSc/HLsmaay1wUbAYtWru9uLUKUlztzbsDLlqo9lxFRcyZZ
	A3xNCmlnX6wz5Q3WpN6qFxXBNrggVp42JxBPT1qxRodewJeAoQJkfaaoCwI9OlD60w0LcykonUj
	CrOe0dXJwS/bFLhgWxbztn32IpBURB0nM/sXwI7QrMKVh7OBjJt8B7XQY8uKjTShJ+ZlZUrNZaM
	VuCIoJw0jCTBfLQRhXsV0SNwAl5V8ibRBEC1oMlVn+xZz+8DKx+UuApFnOq57A9iifNMvmS32OP
	Q/Ze7iAD+F8Tj9V1qvHi8uchzRXKRoFVKGPQPC7iDDOofeWtcQ3AvZwBmF8a76Zv2NIgIkwGVQy
	pIOj7L35agezM90Vj8EvcFvXhLTBqd2MSR0WPHIZJRHuN7deoO3E5/g2F2zB/FXXiEpEPMJFZqp
	SBlEnJKwajbC6OCg5OjaUd/gNckFSBW
X-Received: by 2002:a05:600c:4504:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488d6868606mr335976045e9.25.1776331518219;
        Thu, 16 Apr 2026 02:25:18 -0700 (PDT)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0a62cbesm43631165e9.12.2026.04.16.02.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:25:17 -0700 (PDT)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: docs@lists.yoctoproject.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [PATCH 2/2] brief-yoctoprojectqs: fix runqemu command
Date: Thu, 16 Apr 2026 11:25:12 +0200
Message-ID: <20260416092512.99054-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092512.99054-1-elmehdi.younes@smile.fr>
References: <20260416092512.99054-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 09:25:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9256

'runqemu qemux86-64' throws a MACHINE assignment conflict because the
machine is already set via the enabled fragment. Additionally, the
default compressed '.zst' image requires the 'snapshot' mode to boot.
Changed the command to 'runqemu snapshot'.

ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has already got an assignment.
ERROR: .zst images are only supported with snapshot mode. You can either use the "snapshot" option or use an uncompressed image

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 63ed583dc..7fbf92098 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -333,7 +333,7 @@ an entire Linux distribution, including the toolchain, from source.
 
    .. code-block:: console
 
-      $ runqemu qemux86-64
+      $ runqemu snapshot
 
    If you want to learn more about running QEMU, see the
    :ref:`dev-manual/qemu:using the quick emulator (qemu)` chapter in

