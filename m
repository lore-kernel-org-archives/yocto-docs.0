Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0876EC54E41
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 15:44:04 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.28142.1709221436679679567
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 07:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C5+I6KRY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e5896846f2so740176b3a.2
        for <docs@lists.yoctoproject.org>; Thu, 29 Feb 2024 07:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709221436; x=1709826236; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wodx4+BTFHWi0g17BAZmDGZt/0MwVXiC6p12LjoNgQQ=;
        b=C5+I6KRYglHelJXi1Q43EWlCVZ+BOEcZi6ciWLjW4bgMDZbthsgn80Oke16CaMM8YQ
         ir8uGeKFrdCDQ8LLHD3mzofH+hPmkYgJcuPm11LqF5Ob+CBlpLUK4dHh051vTucMpUR1
         WQkOnQky4hdEWQbXgl23sO2KJ5lLW9X3qXfeYHTdcJ9EDeJtVUDX/0gGBd6JPZOcNxxF
         7fwZvZNhvNn5ts0jzy5Vx0km7hhlkICxhZ/xABaxj8ZHkwTZsssIA4H1qLR0mKjZijJ5
         8tNhdskdVrBGuI0ZnRU8TZMU/xT1hk4ww4pR+eAtJfMBtd5YlCUfWK10C7WGx+MYtF9m
         GAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709221436; x=1709826236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wodx4+BTFHWi0g17BAZmDGZt/0MwVXiC6p12LjoNgQQ=;
        b=Ex9SM88jDaiYdL5F7JnfFpP368p5qrJTbyyNxvqB4Pw6a9hNYbch9PsPgbByyEVVss
         PVYMcfJBlEr2v+hSstGFaC5HOqBfIvqK2OAcnk+4y2891+zM8h5/P3pthdyQHe/5A929
         +Pq6/v0n0R7XavfL1BwLJIa78sL0oy63yL6xuy3wdIFzxfpMlBIos9MtcpVayoLn2kZw
         z1+Ix9XqSbCbJeHpAvHT8wurKDAUW2TO+K01C2Q6qiSuVNM2s2eMHq7SKMwA8KcYOU8y
         bmq+ti6OWsTtJlx/R6UWU4lqXriwZSeixoE/xNEx0JsP7eeRqnazcVenS565fjajQGpK
         PWmA==
X-Gm-Message-State: AOJu0YyH2REb4p0VNdkVBFHLRsbV7z3xi3V0cMOHwogEkZPnTxEyd1in
	6OnJFXbt9vQViBoaefQHzs4PGqid9LYrY6GOaZxUZkvEwJhQauFc4KdPH54t5iiDQjhom1gpeym
	2X0A=
X-Google-Smtp-Source: AGHT+IH6JbnJrX9dq4lL4U/oRnXg495UDBBtPPAgSWsVcy2r8fhYM5M6e19lFD2EIMC4qnpb1KOsjw==
X-Received: by 2002:aa7:9835:0:b0:6e5:65f6:58b with SMTP id q21-20020aa79835000000b006e565f6058bmr2438412pfl.7.1709221435738;
        Thu, 29 Feb 2024 07:43:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id c4-20020aa78804000000b006e05c801748sm1410784pfo.199.2024.02.29.07.43.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 07:43:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.32
Date: Thu, 29 Feb 2024 05:43:48 -1000
Message-Id: <4a14c4e826dfb7019c41b359919569c8640cfc5e.1709221377.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709221377.git.steve@sakoman.com>
References: <cover.1709221377.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Feb 2024 15:44:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4920

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 0e04203fa..e41e355fa 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.31"
+DISTRO : "3.1.32"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.31"
+YOCTO_DOC_VERSION : "3.1.32"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.31"
-DOCCONF_VERSION : "3.1.31"
+DISTRO_REL_TAG : "yocto-3.1.32"
+DOCCONF_VERSION : "3.1.32"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.31"
+POKYVERSION : "23.0.32"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


