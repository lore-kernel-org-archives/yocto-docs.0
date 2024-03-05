Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC93C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 22:08:07 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.1611.1709676477540853244
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 14:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QioAJXKa;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7882b02ed2dso110381485a.3
        for <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 14:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709676476; x=1710281276; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bvnp9Z+5fRAb2tGRnKwP30A0fmlJnFmbb5xFCJLmFnE=;
        b=QioAJXKaZHfHYHPE3oN+pnG0igeDFuNrDpv+kYAcGqH+LchJ72eaNTqeYJIDtwciuO
         QzttUxQr7+MwFXSu8rDPxG95pdZzUKaRZfVnfAnHM3F8j5DHnQy6IXoiHXOYQyNc0pE2
         SJfsTVcJIGMqzpVMifqP3DAJO+GWjSBivBTrH9U5JPvWQW9a6PdOeviXnbK/ZD9EW37n
         nAOHRS16W3fhCNdRYwnFyd0/yinYbtNHeWD/qLxCZmoq1GUD+crzVJDCvC0DKP9BaiG/
         mn0fkeziW0NMw3P4XK5wAp6GXbqGfVepn2ZgOaCU2vUQMFDNCjF3FwjsJL9VR+ORGmvq
         rc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709676476; x=1710281276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bvnp9Z+5fRAb2tGRnKwP30A0fmlJnFmbb5xFCJLmFnE=;
        b=V7R1Jq9RA7fjzg6rBEkv1o9aYh9laItcoJxOZgVBepDcf+zw7f2vf6ROX5u7Z7hpu2
         Noc3nsXlkTqu+7nJamAThO7R5TlDD6Q0nWRCDDg7oSPaY50SUOYdO1x42PohD8o9Gbdc
         dKwZU4LywEH0zXZHp3JYhvvzyDTucDaqSnskiZLQC5cImDCoAEIF8+Ukai37FMjK/2X0
         RLZppP3YFdiMckdh3x5U8f6F1tHNY+mLtZ29zGLS6mq9GqX3MwyraDvdza/lWliL0xHj
         f14BbskAO5U/INJyOHQRNl60KyGkrjKOBtfPDcauESfuapOfnGoC1CzSR6bxQJIwOp/n
         TyKg==
X-Gm-Message-State: AOJu0YyAIp5UV6F2QPZhObKlTYEF4qqxWppfQStXgI7ulN7vh7fMN0iE
	b3Y+YvsLiyQB6ygFG4ZAA8bI4gDPZrx957eIKAuNTnE2bTsdTHqwsOB1ysqrqmU=
X-Google-Smtp-Source: AGHT+IEOmN0N7ENC2YiLFmRiNtDG7CiLHFfbEiW0NYsmvoGYql4cVd45cwuHYazAi66XGUGNxYIvUg==
X-Received: by 2002:ad4:4e32:0:b0:690:7bf5:e742 with SMTP id dm18-20020ad44e32000000b006907bf5e742mr3148628qvb.58.1709676475609;
        Tue, 05 Mar 2024 14:07:55 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ma19-20020a0562145b1300b006904513b379sm6670331qvb.113.2024.03.05.14.07.54
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 14:07:54 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] bmaptool: rename
Date: Tue,  5 Mar 2024 17:07:49 -0500
Message-ID: <20240305220749.4742-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.43.0.76.g1a87c842ece3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 22:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4938

What was previously known variously as Bmaptool, bmaptools, bmap-tool,
and/or bmap-tools has been updated to the singular name: bmaptool. Update
all references to suit.

Since we are not in charge of debian's package naming policy, any
references that relate to debian package(s) will stay as "bmap-tools".

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/dev-manual/bmaptool.rst | 20 ++++++++++----------
 documentation/dev-manual/wic.rst      |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 9add72cf3b80..f6f0e6afaf8f 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -4,10 +4,10 @@ Flashing Images Using ``bmaptool``
 **********************************
 
 A fast and easy way to flash an image to a bootable device is to use
-Bmaptool, which is integrated into the OpenEmbedded build system.
-Bmaptool is a generic tool that creates a file's block map (bmap) and
+bmaptool, which is integrated into the OpenEmbedded build system.
+bmaptool is a generic tool that creates a file's block map (bmap) and
 then uses that map to copy the file. As compared to traditional tools
-such as dd or cp, Bmaptool can copy (or flash) large files like raw
+such as dd or cp, bmaptool can copy (or flash) large files like raw
 system image files much faster.
 
 .. note::
@@ -20,13 +20,13 @@ system image files much faster.
          $ sudo apt install bmap-tools
 
    -  If you are unable to install the ``bmap-tools`` package, you will
-      need to build Bmaptool before using it. Use the following command::
+      need to build bmaptool before using it. Use the following command::
 
-         $ bitbake bmap-tools-native
+         $ bitbake bmaptool-native
 
 Following, is an example that shows how to flash a Wic image. Realize
-that while this example uses a Wic image, you can use Bmaptool to flash
-any type of image. Use these steps to flash an image using Bmaptool:
+that while this example uses a Wic image, you can use bmaptool to flash
+any type of image. Use these steps to flash an image using bmaptool:
 
 #. *Update your local.conf File:* You need to have the following set
    in your ``local.conf`` file before building your image::
@@ -39,19 +39,19 @@ any type of image. Use these steps to flash an image using Bmaptool:
 
       $ bitbake image
 
-#. *Flash the Device:* Flash the device with the image by using Bmaptool
+#. *Flash the Device:* Flash the device with the image by using bmaptool
    depending on your particular setup. The following commands assume the
    image resides in the :term:`Build Directory`'s ``deploy/images/`` area:
 
    -  If you have write access to the media, use this command form::
 
-         $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
+         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
    -  If you do not have write access to the media, set your permissions
       first and then use the same command form::
 
          $ sudo chmod 666 /dev/sdX
-         $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
+         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
 For help on the ``bmaptool`` command, use the following command::
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 312f78c403a2..05e9cb381b31 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -503,7 +503,7 @@ Continuing with the example, you can now write the image from the
 built your image, and boot from the media. You can write the image by using
 ``bmaptool`` or ``dd``::
 
-   $ oe-run-native bmap-tools-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
+   $ oe-run-native bmaptool-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
 
 or ::
 
-- 
2.43.0.76.g1a87c842ece3


