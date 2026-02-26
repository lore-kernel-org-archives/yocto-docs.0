Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B134DFD8FEE
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 18:09:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76535.1772129335138313298
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 10:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GbDx74s6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so13523835e9.1
        for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 10:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772129333; x=1772734133; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JfwcdASXvnzo3WNFB6nS3ikxKmuL5DNKaLCFPsw+s30=;
        b=GbDx74s6O3IyZJvEcMA8NYufL64US7IDfB/GJICqmTOMkxibaDLu9+GmkDI5WFOYFE
         DquLJ1NyhhXiPzSV+32X548tAX5LwD+njyM9IJl6wEHEvj2DttPWGRPnFxBzi6UxCUL4
         0PsXnT3xWXllmx+e/j0KB3i6c4KT9bu20wzOq3RYjRv8UHHSYWiTpc/Ngy/QEAUWh1YI
         IvZSN9sRooBbbZnmvseoYVzpcVeFBI0B4slQp+35XqzCya7NNnlzibW4njIGwD0kpiLG
         T8JlIsaXtpRKepkkAzxWXnrZOzp3BsJdKZeiEFIoIDXxWfP16z6jAAzY+qUKfcI1IUl3
         qBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129333; x=1772734133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfwcdASXvnzo3WNFB6nS3ikxKmuL5DNKaLCFPsw+s30=;
        b=Hz1egRqPUIBdMzmZk+oXi4RB/0RlqznG6/6Q+Bz7ce2eWumTC91A2ezzWslHJepISL
         m27V7WSrcFQrHuw59UqqerJY89G/L9e6cXQOoFawejg+rAKLHKn/mvDF1xkWJEvvnpj5
         RkeJVR4grxsrVok22fEJ029Ko1mIK3BgJnxAE5HT79QSlaBDFqbM7VvFnR5zCs+wtG1R
         SdadAVRALSQFoSFGYT5oaWVYxhwIamQ3m/S+52S/R5hyhagQcvAADssb+Dm35RfwkZUT
         7nP5GxglkQtkenA4TZN4vqVNa2aoaQIyLcs8eTSLuAeiufO/xaLrhSOjYPdk0boJNXzz
         5AdQ==
X-Gm-Message-State: AOJu0YxSru1LUVe/giwMhbboBU3O8f5CXE9PMa5nbKNro/UkE+o14NB+
	Ku05bsGX9U320AaFNGDfbTuA3FhEV/ajtwJxmvLJZT+Agvpb4ZBFEBAk7Xp2pKeZ
X-Gm-Gg: ATEYQzx4VV5C9WmKEUT8cJ3pJQ89Ttyz5gugfQ3FKwKagd/mpU44LPqVyZDFElpceGe
	cgmdwOhhMVbjqI8Axbb3sfkborRlP2c99qRgyzVXUbWj06gzFi/iQo05hnLs5X30HxE1nloe+KD
	tDI/eZmKstPp7iuYXPxwcibH29GGaiCD8n8CJOureisaX/JFYlkH3EGSnhN8f0LjQpGG6DSm3OU
	xfUTrX/eqTufAZiToSS5wHbxN7K+cMSAWWS7q+/1BgfTXP1HGXTUM9rnaDTgpQksql0uOLteHpz
	G7Tt+EGwrUYkuiQocDm80gi10W5LyyM/5G5zvrc9Y0wAonzcmXzaq6MFaxcPvEstyj7sA1pxVIi
	XU8ZRPkp3aerwCYVSZm6qC9pcYSVLkS/F4QJ6VfA8b74dAC1cka/pK9c5szejB1ppFwqH/4cnQF
	kXlqnhWBlgIDcagqWAW5X+4CEBEzZsZF7qv0aoEUp/PUVO87bbleMlmG9LUlqsBl9xwr7tA1WWm
	XlM2IRPhmRh7EhfeVB9oyB3G9RQri3FMZ0ENTzosbLfwD94gD8hpW1aNtEQ4eQkjN/EgZ9nIw==
X-Received: by 2002:a05:600c:1991:b0:483:54cc:cd89 with SMTP id 5b1f17b1804b1-483c3dbaeeemr45932835e9.9.1772129332882;
        Thu, 26 Feb 2026 10:08:52 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e404sm1425529f8f.8.2026.02.26.10.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:08:52 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] qemu.rst: parsing of the code-block was not done
Date: Thu, 26 Feb 2026 19:08:45 +0100
Message-ID: <20260226180845.6135-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 18:09:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9000

Because the '::' at the previous line starts a literal block.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 documentation/dev-manual/qemu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index e40660a96..514a72fc5 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -54,7 +54,7 @@ available. Follow these general steps to run QEMU:
    depends on how you installed QEMU:
 
    -  If you followed :doc:`/dev-manual/start`, either use ``bitbake-setup`` or source
-      the environment setup script manually::
+      the environment setup script manually:
 
       .. code-block:: console
 
-- 
2.47.3


