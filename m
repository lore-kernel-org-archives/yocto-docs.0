Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF08C64EC4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 14:20:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.10009.1677075656300893857
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 06:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=utPP66ru;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id e5so9953235plg.8
        for <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9A4kHR/nbDAIwkNJwNz8Gw2qyMJ0fBeII2wVSWb5uw=;
        b=utPP66ruhpXNyZJ1maYyO7FSgmSZXYwz0C1zeAyCODkwRW9yEFbp8MM67mpPBpulTw
         xTsj0bKAjjJIxVEFR7vDBH43BFyhBQnukmZhq0wWzEHNXfpNucZoin7IBlIHXu1nxrsZ
         74eudoarx52iqjDzbESTyXZQ3XhMLseZWvgFPDJjfZ2458S+NHIykh2+lAaI25+L4wuE
         uCr1hY3CFEMsMVaLnisE+FSbDRyBekR+8J5NXcrRnaT4WJTpXtkOtuvdGxjkH1AlK5Gi
         NeEgANPdQVzTidBCeJkcq8BmhE2wfIO/vEEEMGsgw7fap1uaKTjAXY3G3Dqhf1SlS0fq
         r5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9A4kHR/nbDAIwkNJwNz8Gw2qyMJ0fBeII2wVSWb5uw=;
        b=uvLkyYPI8hjfU70SdhC8xGg0kPnKPnBbaqWTG48V+DlqlPvMrKAEEapSrsZzKIPYgc
         LVGbnGeqtpPJ1kkVmD19d0yAJ6IyhOOSdq46uURO69EJgNfsF8YhRDYkgDEx6A6ojjwt
         9p6Lp3/41YX0rOLBrfi7DqSyPebf4/LG3k3XaBdzPPTMrrm2iMgjT8DWyxPh6m/DTzh7
         HlM7GlYb3jcuJ0EjEPFThMxLmFPDERlP33gkcn9hzcd/pqz8wrwQz+OvSQ9R43cpHI2P
         ktuYwC7zgX791vnTg794kGZ12Bv1sFHifZdK3SsdZhPq7JxpVOxlmAoaLQV1gJ90p/JG
         zV8g==
X-Gm-Message-State: AO0yUKW83IIVfVA6hLNcEewZGbDxzm2+z2Pyu63DUw5hgFqDndTxVQis
	v+V+czr+K9w4MTCpr0GyNbQqz3rdbP4f+8vVCbQ=
X-Google-Smtp-Source: AK7set8KXkxyLPQ3GTigHxp7Mtv42LK8yh2DFGXC+HTsHD0lFytGDtIF7YsGO/nRhh/UoyXKTEZlbw==
X-Received: by 2002:a17:90b:350f:b0:234:e5c2:b92c with SMTP id ls15-20020a17090b350f00b00234e5c2b92cmr10262129pjb.15.1677075655402;
        Wed, 22 Feb 2023 06:20:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id cx24-20020a17090afd9800b00233acae2ce6sm3609083pjb.23.2023.02.22.06.20.54
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:20:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 2/2] ref-system-requirements.rst: add AlmaLinux 8.7 to list of supported distros
Date: Wed, 22 Feb 2023 04:20:46 -1000
Message-Id: <1528a79b0297d8573d2e580334d093af6aa22dd8.1677075570.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677075570.git.steve@sakoman.com>
References: <cover.1677075570.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 14:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3714

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index dda6c3084..ac963dcdb 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -83,6 +83,8 @@ distributions:
 
 -  AlmaLinux 8.5
 
+-  AlmaLinux 8.7
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.34.1


