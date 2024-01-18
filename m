Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8777C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 15:06:05 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.13732.1705590362433681353
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jan 2024 07:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s9iwK9/r;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cd8667c59eso8634933a12.2
        for <docs@lists.yoctoproject.org>; Thu, 18 Jan 2024 07:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705590361; x=1706195161; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSsAF4aP8lz9pPN4bw7zViACd7ZNxJN/arrkX9YTsEA=;
        b=s9iwK9/r7K0VzB/OM6FkvLUf2x8BBCjLlgiCRV8Fav65hY5muhGi2Dzul9XxdXmZiX
         vRhQ3926ZhzNZMqVWCY4/L2UdKa8CWmAYAUSerRgyDtboaneqGb7He8em2nl7iQmvqsK
         7ZUq8cAdbLVExYUjabyauaGI9ouCmKEm0ExU8Tztmkv6XSaeGSFgMmjBiDZq/M67HAof
         33e3eUiOLM8GNXDSVXmyvN46U3AIPgfhohxCKUBg4dU1qC8CYUMG4yROYDcfQELcphTE
         JRAhr2m0fdCkd6IIALp8xVogUKs/LUyYNw/REcCCtQpHf6wg2QmgMD/SsUy4b6u+BcGT
         7Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705590361; x=1706195161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSsAF4aP8lz9pPN4bw7zViACd7ZNxJN/arrkX9YTsEA=;
        b=NwmwJl0f6X48wSu658w3Saq6FUQyKNJNABCkNlvrBpWFxYF4ZfrdUR5V9Q8jq3/31X
         EO+qEUBlKuDCkxQIBNJ2dbsThv0yQRwSp4bMeg18qFIiKX1To22d1TLlo7eY6Zi7uiCA
         Csn4j963/yWZVfUG2wAaJs0ctNUcQm2CntldQEcmpK8JaWK1SVH1RcvsYN59eFcxKP6C
         RN1ebmfGgHX0u8e5E1nb6yt2/RoV6EFCdHgRk1YKQMcx7OsD/HWD2buOiYll8ulAwKPa
         i6te1vVJiuXEnYrWEpSAjk4zstbrxyMibjT2wk3xgBUISU2boA3Icj6xYhFFo+HUSwxX
         tSVw==
X-Gm-Message-State: AOJu0Yxc6bS85QVB6kdstLZ1LV5AW0IXfePIu+RP+Q/2UqgmR0yoDtF3
	px8X95eRnPARPqdbUe5ucgzcURAkNmRRHBFRdHQ5b1VFkM+G2pott9DHBogOM7RmtwUzMPx2JZi
	CWnQ=
X-Google-Smtp-Source: AGHT+IENTOQpAGXWGeg2LUfwDh8m1BSuxM5I3x3ZiI4fSTJ/XwETNa+ATOYOHlghucOvpmhIEo/dgA==
X-Received: by 2002:a17:90a:ad89:b0:28e:2841:67fc with SMTP id s9-20020a17090aad8900b0028e284167fcmr863503pjq.86.1705590361206;
        Thu, 18 Jan 2024 07:06:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id si6-20020a17090b528600b0028df5c748e4sm1949820pjb.44.2024.01.18.07.06.00
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 07:06:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.31
Date: Thu, 18 Jan 2024 05:05:50 -1000
Message-Id: <b72faefe16e1ac1dfa95ad7ff9b9b63254e62196.1705590269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705590269.git.steve@sakoman.com>
References: <cover.1705590269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Jan 2024 15:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4786

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 54a1c3203..0e04203fa 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.30"
+DISTRO : "3.1.31"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.30"
+YOCTO_DOC_VERSION : "3.1.31"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.30"
-DOCCONF_VERSION : "3.1.30"
+DISTRO_REL_TAG : "yocto-3.1.31"
+DOCCONF_VERSION : "3.1.31"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.30"
+POKYVERSION : "23.0.31"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


