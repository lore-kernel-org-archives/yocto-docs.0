Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41155C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 10:40:10 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.5094.1648550400205377478
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 03:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20210112.gappssmtp.com header.s=20210112
 header.b=0W0xSF03;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.208.46,
 mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ed1-f46.google.com with SMTP id h4so12404990edr.3
        for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5kkRabbJsCr3ckB+pgChNJgp2orOiYl+lYoH0wbNh6Q=;
        b=0W0xSF03knylSi/n664jH4dTp/aBfu77Ybb9ABXdJ3swXIArtdlgk5vG4s/54JhPRC
         z1hqrcfFusnI6Fpw64iRlNIz4qPd7FgdrtytP6WUFXb6KontHXXXTfyNSqAxtV8a7dWC
         eJOycf9+kuoc2XPb8rn9XwP1yhI33UcwsehcYYLMjlmuLA3hqlFqfp8wGyGR4ghjiX3z
         O8PO4Dw0mKGC7FPrqeSv/vu60g73kVDvbsahyvO+XQRHfEI3TlBDjmOlFmf1wzFu17Hf
         jfPsbDHZA7CJyikHUE4spr4xoi+cMJ2lGjIuJIFkTc6ck2diG16E/v2NymNySPjGgLYE
         zX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5kkRabbJsCr3ckB+pgChNJgp2orOiYl+lYoH0wbNh6Q=;
        b=xp8IziAWkfRzijAo4kjOoGOCnt9Z1PvTLe1MzMGH2DJY8Z4gcSFZHUUFoeX5sHKR3K
         9vN1WEcRB3re7P2LKoFSg0SBEGN/pnL38e8eNlMAVK4Q3cYWRQzhWyXs++LsuCS0fKYB
         cvL1oQUdYO10mayCRfNFqYB5lGGR9sxqczq/uvYSKvVObMJIYOy23Z8h+VKLosYxym+e
         ojTiTXr/RPP0Kf3IGIZHyo/jk3syvTcMHeBbda6UfwPmdnvTR/9C+Z+AaFymJOjqm0Tu
         2tWIWqF7hpUJ/97CCEk7FuLyLfLvjlezACCARkotpgXIeTwMNHtD/Tf/i8aYquHbEhDE
         FdZw==
X-Gm-Message-State: AOAM5302ziBbJmQ0hCP9P6SA4qOlIkQ0JHQbWSvmog6qQrXlc6L4qSeQ
	WAd6edQ8+VLyZC4YRSJtrXilH13veL5Dvg==
X-Google-Smtp-Source: 
 ABdhPJydIu62/9UqjjZjEumFVji2LG7rOloOZiddhCTQLVoS21eQVM8AzE6TwUXuQKwrSKkQCeuB7g==
X-Received: by 2002:a05:6402:50c7:b0:419:534f:bbd7 with SMTP id
 h7-20020a05640250c700b00419534fbbd7mr3557321edb.209.1648550398095;
        Tue, 29 Mar 2022 03:39:58 -0700 (PDT)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net.
 [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id
 m17-20020a17090672d100b006df98bb199dsm6909817ejl.129.2022.03.29.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:39:57 -0700 (PDT)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: Add vfat in list of filesystems supported by
 kickstart
Date: Tue, 29 Mar 2022 12:39:41 +0200
Message-Id: <20220329103941.52651-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 10:40:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2726

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 documentation/ref-manual/kickstart.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 885c72129..d82da0ee7 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -125,6 +125,8 @@ the ``part`` and ``partition`` commands:
 
    -  ``swap``
 
+   -  ``vfat``
+
 -  ``--fsoptions``: Specifies a free-form string of options to be used
    when mounting the filesystem. This string is copied into the
    ``/etc/fstab`` file of the installed system and should be enclosed in
-- 
2.30.2


