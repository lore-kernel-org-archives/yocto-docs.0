Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B611C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 14:16:51 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web08.9039.1634912210646167873
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 07:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=LpRUvjNT;
 spf=pass (domain: foundries.io, ip: 209.85.222.46,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-ua1-f46.google.com with SMTP id r17so7906233uaf.8
        for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 07:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLDGS0PXPL6tU31S9CFiDVzF+7O4Gq4q5GE2KdQOhjI=;
        b=LpRUvjNTHD4KIHCkn0PArGPTrUJNVZ9KaNBNdzpZYdhJ8Hd5bBOCn4oHyvibNtYesr
         gmPvmjJDCDy/7oJnTLUzWU37USYFkQ1IZNd/KPRxc1dPKytcgMqtCBIrq//S6Mr2ND9d
         5gAh7uyLDNCjsGq5Im2z4pUrY8pw4TBGMiCVgucvT2HED3jOAT97jphJVzBWlo+NyZX1
         Q0r2MzAoLy8eveluN+D3uH+0Gvdh5vO/OV7GH2+ITZWTbzzRyPuSbv5ULI81McHBuQeS
         zOjDwoG5bkZ1IYCWxOGDcu0zMU7Y/ywdwau0YsmXLR+2qkdCjoMVfuxxJKFTsYkhseCs
         i3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLDGS0PXPL6tU31S9CFiDVzF+7O4Gq4q5GE2KdQOhjI=;
        b=vxF13WobeSSK7Tzzty7DOzHLOZA/+rT16g3tDwRxV0fDfEvlZfgz45dyE109+lkI1+
         SlOW0vaNQqnmxjl+Iqi0YN4vwkaPBPIUyLmQNjRME1nDHBeqIwMhLIJX+pYuO/SIbeeC
         TcWwseEzd89xFidDUHDhyHLNgBRXKjBoawFam2qOdI8MUr2IDQy92ZgYbQsUMJXkE+Wc
         PVBwGcYjvz/YNn2DXL8vsACucORCTw95J+6VTNN8+Za1g6CS3eAN5LVWczEmzCCqfzFp
         vgC/ABVGhZKXSeuRW7S5UhA59iK1RgeHmJWko5FVNKVmba+3PH/CKr/inbdRRWb8+rDv
         69yg==
X-Gm-Message-State: AOAM531NBQkgiRDCRwiszWJvKykfITwatzcae4zrHFCJ5KDgj3/Xm21+
	5SdbVtw5lf2bBqXZrqL+NYzcODWLFKY2lg==
X-Google-Smtp-Source: 
 ABdhPJzdAJ7q5/HP6OTKqCPfEcUg8nL7y++WXz0sFXwijKw9zeHTmO/a8RMXwoAvEfxZ8Tir8Dm+Kg==
X-Received: by 2002:a05:6102:5114:: with SMTP id
 bm20mr15749362vsb.15.1634912209238;
        Fri, 22 Oct 2021 07:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:3bac:19c0:cdde:f14a:aefa:50a])
        by smtp.gmail.com with ESMTPSA id 33sm5089661vkn.2.2021.10.22.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 07:16:48 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: docs@lists.yoctoproject.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs v3] ref-manual: Update how to set a useradd password
Date: Fri, 22 Oct 2021 11:16:32 -0300
Message-Id: <20211022141632.4118736-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 14:16:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2041

Partial fix for [YOCTO 14605]

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
changes since v2:
- replace the content of PASSWD variable in the example

 documentation/ref-manual/classes.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 79af45ada..9b1ead66b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -590,19 +590,25 @@ Here is an example that uses this class in an image recipe::
        "
 
 Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
-passwords::
+passwords. First on host, create the password hash::
+
+   mkpasswd -m sha256crypt tester01
+
+The resulting hash is set to a variable and used in ``useradd`` command parameters.
+Remember to escape the character ``$``::
 
    inherit extrausers
+   PASSWD = "\$X\$ABC123\$A-Long-Hash"
    EXTRA_USERS_PARAMS = "\
-       useradd -P tester01 tester-jim; \
-       useradd -P tester01 tester-sue; \
+       useradd -p '${PASSWD}' tester-jim; \
+       useradd -p '${PASSWD}' tester-sue; \
        "
 
-Finally, here is an example that sets the root password to "1876*18"::
+Finally, here is an example that sets the root password::
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
-       usermod -P 1876*18 root; \
+       usermod -p '${PASSWD}' root; \
        "
 
 .. _ref-classes-features_check:
-- 
2.30.2


