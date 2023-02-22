Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B49C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 14:57:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.10890.1677077866179870100
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 06:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JwwzvD5I;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id bh1so9022532plb.11
        for <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 06:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=No+q4tUnP0lQcA4HJRVhWgH3zcLzc3ZXG9b/0jcVKKA=;
        b=JwwzvD5ImMh01snvLsQKS6rF/j6Ne47rkwVzEF9vrmlCZHXSyDFRp0r9Hqj0/vad8+
         3dqem7QzaUYqnbrHYmr/i09gBX7JJpiCIzBJqOKM06ffV5p8rCmJdsRtcVEvYsNyYpkF
         qJj0lj+Jb9xsACBOEL1kluSiSwWTsVxKStIJ+fk2VXhjTZlVMP8AKmjqZqwVwKbXgB5b
         SoE5xdq4LDRrNVg7rhtXCtBlcBEAMdCI6ut2tezruy7sI2WC8ZP2yRCwsnoXIeb9moid
         HyV5KsLR8d8w4KlhYkQbKDBPkEtj865XvvFYRVpXogGrHHaa8dY2mShMKxNUf/kz5qUA
         HcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No+q4tUnP0lQcA4HJRVhWgH3zcLzc3ZXG9b/0jcVKKA=;
        b=46GTNfLwFM72EwrvtzQW/p+eWpx1vLwZN/HTqR/GNPOV6PgALLIS4ZJqhTsHrHUEY8
         PU28COZbZbse0RxV83Wi0C7JvFc3xFnJ83GE9r/mmVuTx36+7WdipBYtillfeX1iF1fo
         r8XtYhYEpCmUk3OuQpgUp05TNva2YJpjybDeaDsTnWOs5pH3jJ0Qwy+m6an9117Fxu4P
         nJnCpmIvTkc9aucIVLTI7D+PmMbkpadmFfFU9p2zl/RMV18K9WjF5FxSP1X36qrBT+O8
         QzzG7XRBbjQf/VstSLdBVTgBN4UZpt/SelqaBkXCAAST/yB+wl9SCYh7TTEim9MjpCDw
         xr0w==
X-Gm-Message-State: AO0yUKU2PoV649ayZW/t/zBzC8lkYhdGAIWVWpNouf8Gh6ZTe6j3CItE
	N6h/X+4agTm7P5Kc7CU98jo4I3f7TXcjuIxGD24=
X-Google-Smtp-Source: AK7set9Li1FuTbW+knwIlB9wpDCJf1tIUoBvnD42p1uHqiLZ0t7YYpZi5nmTFfnBUCoJ6Qr1dNdByQ==
X-Received: by 2002:a17:902:d4c9:b0:198:adc4:22a2 with SMTP id o9-20020a170902d4c900b00198adc422a2mr8184176plg.29.1677077864950;
        Wed, 22 Feb 2023 06:57:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902a3c700b00196047fc25dsm11955133plb.42.2023.02.22.06.57.43
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:57:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][langdale] system-requirements.rst: Add Fedora 36, AlmaLinux 8.7 & 9.1, and OpenSUSE 15.4 to list of supported distros
Date: Wed, 22 Feb 2023 04:57:39 -1000
Message-Id: <814d35c757f61dc4c5a64c2315940c9b7f28d0f5.1677077787.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677077787.git.steve@sakoman.com>
References: <cover.1677077787.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 14:57:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3716

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/system-requirements.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 2a6d44404..775628486 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -47,14 +47,22 @@ distributions:
 
 -  Fedora 35
 
+-  Fedora 36
+
 -  AlmaLinux 8.5
 
+-  AlmaLinux 8.7
+
+-  AlmaLinux 9.1
+
 -  Debian GNU/Linux 10.x (Buster)
 
 -  Debian GNU/Linux 11.x (Bullseye)
 
 -  OpenSUSE Leap 15.3
 
+-  OpenSUSE Leap 15.4
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.34.1


