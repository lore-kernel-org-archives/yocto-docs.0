Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21AEC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 17:23:16 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.82133.1746552186288592598
 for <docs@lists.yoctoproject.org>;
 Tue, 06 May 2025 10:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aLXLOYa7;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7cadd46eb07so417363185a.3
        for <docs@lists.yoctoproject.org>; Tue, 06 May 2025 10:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746552185; x=1747156985; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/pClpnfL8rh71f+OU+XF1Ldw5KZPVcGW5mtkFThg8U=;
        b=aLXLOYa7VQHTBaDwLeYdrvuiWyaEUE3ruFiOGo5oE+5GjxiPgwtzEbeOLlpfDj9CPO
         WoUlXSdW+qsUdY5O6AAdfyd09QNPL5DgOwkSUH2159LevRFwDhiH2A/bES94df0FXMK/
         pyvZkbMqv53yur8a6wkQl8hG1aREqnf59YTo1PLQqvBWCm9uMSl3FvmU+LvxqrE9dCrS
         a/yAXrllLQv4+Zpv5HQHxapWABjAD0Ytl7elIwXfSq8keBVgY2O6LLK/wIw4dsVLy9nG
         wAQQRoXxKTQZrS5kfiHvgFpW/Hv4Ua0Aah+LO23x8OapeVO1bK9Py37vURwbgzjVqtQM
         VqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552185; x=1747156985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/pClpnfL8rh71f+OU+XF1Ldw5KZPVcGW5mtkFThg8U=;
        b=Ua4a4oikVAliECPmxhjF7XoaSrlWQIwGxhgRNVWEwrTV5CS2s6zs4fmEPWL+Xdqloz
         cOvibsZkcZnZbS9kf9STXh26lsLxiuimcdgJXIsJ0BZ99Z9IXlDxbzcizCxnnOW9cQRR
         73+4pUnyfL38kUwuZkdTucRSllNWiaSmFT0ZpoX3YRC22+W/oeVH5yUugb1qRcuQy3Fv
         tIrQobvSBPGj1TVAIQ8Yw3YwcE1BknDoYhpA0gAPrkWOhBs+mDNaylAVjI+q3gpHozry
         d0KxIQGLOTeB10y//MroO8+5enNk4VWqhUohfsSyMd5l2GvFcJ1jGIxsyHe+3L4Xjv1p
         hbyg==
X-Gm-Message-State: AOJu0Yzg16xA5QfwUjkiWWaCHHGh3nRcf6N48j06iWj6qzsc1ZxDWn9j
	5M6x0BIekHMyviCsfIyqFGcdx0vkZ4I6ssXxIxbn64h363nkevOUhAQpDN95
X-Gm-Gg: ASbGncvuxqdYKqYoz8u+G6RUW7bwQGkUYt4myEFiJ1XnZmlW+ExS2i0WiWXeOasg56G
	PPZCmGwI7F78m4Zq39hBwDeAaK8DtG2mxpoL7wVj/J066nMvKep7S/9epxjtErd9Fs/1YkOidHw
	UK+HUvM4TLysP5N9DPUvq3Fs7opGopSAFmh59Bd3nBcuhGeMb9mZYAKTtzaWhVw1VKtM2xJAstN
	D7PsjToHPh/u48xqXup486HYNY+EFX7WPSl7BfkE9V4QUhhhU8vVYTYaKjRpzOcR063E4cpsVjV
	SRAFb2iyjuc0I3O+Md3fxhbCrPq0zybfBV0brvuKRetLHCLlQPT0XaWjTrqKTa4F/t8+Ynhka/S
	Bmkva5KVZ
X-Google-Smtp-Source: AGHT+IGw4Y9IDLm6U4X4s04rHMneIGaXI3dFkTAoMRO88q8HzaqpIhQfuQY9rgWKroqYlQ47aBPIsQ==
X-Received: by 2002:a05:620a:254b:b0:7c7:6543:2018 with SMTP id af79cd13be357-7caf736d36cmr24919085a.7.1746552184548;
        Tue, 06 May 2025 10:23:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf753926dsm3445085a.65.2025.05.06.10.23.03
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:23:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS
Date: Tue,  6 May 2025 13:23:00 -0400
Message-ID: <20250506172300.19220-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 May 2025 17:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6799

Fixes [YOCTO #15509]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036b7d..29f34f5b029d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10942,6 +10942,24 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog-config`` recipe
       and also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WIC_CREATE_EXTRA_ARGS`
+      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
+      will generate a Wic image automatically when BitBake builds an
+      image recipe. As part of this process the Wic bbclass will call the
+      "`wic create`" command. The `WIC_CREATE_EXTRA_ARGS` variable is
+      appended to the internal "`wic create`" command to provide a
+      mechanism for the user to supply extra arguments to the
+      "`wic create`" command that is automatically run by BitBake.
+
+      One such useful purpose for this mechanism is to add the "-D|--debug"
+      argument to the "`wic create`" command. This increases the amount of
+      debugging information written out to the Wic log during the Wic creation
+      process.
+
+      For more information about creating Wic images, see the
+      ":ref:`dev-manual/wic:creating partitioned images using wic`" section in
+      the Yocto Project Development Tasks Manual.
+
    :term:`WIC_SECTOR_SIZE`
       The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic
       images. In the background, this controls the value of the
-- 
2.44.0.501.g19981daefd7c


