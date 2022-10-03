Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3DDC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 15:29:49 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.1356.1664810981385155263
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 08:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7hRm+a75;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 78so9937219pgb.13
        for <docs@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ewlw6Sdl4pDkiNVFa3yD0tjIMLCqHlDEcynuBTFGIio=;
        b=7hRm+a75aqXCJCiy38/BvM3Ax0MuAiJIU2VPhPCguGJ9Vz0AUz8B4Jaxe+x+nNmtLN
         zH8qq1WjjVWb0uoXbhFMx6VbCPq5MTyzIx7WiGtxwz4BEoO0fY0ZklFYKIR+bks0Nakz
         uPEpM/V7l4RWDX0k0tlanigdw6k4ecZdpz1DU5tEv9NC2lHLWJt2GwPeFxSMhdp1Jv3t
         L73NWVM1Nk/np2AK75umyyUoZJiR6xEkVQ0+Zm/Q+4CLzFt4VQ3Ba/sD6aTTTIznWciB
         QCar6GdF2usQa5G89ssoHg0bYc3fBaCx5Hb7Wt0GkarfepJAIVchrPpsKzUUPCQZP3pz
         nmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ewlw6Sdl4pDkiNVFa3yD0tjIMLCqHlDEcynuBTFGIio=;
        b=PkjodcZq0j3Zhl65kNW+jLovyik2NX+2V5nGA7lWaHJvjfFfQE7lweeIfz3lOguqLs
         O6VhED8+HmuVjJ3bk0SjIBZNgqFHBeCLpdTam8a3S/Ewkz34jdDbH6WLZ0arPXaP4x0u
         KE5l2MyT6fyP6eaMTzgLXcVpvaqV8qRMomqFKUnH1IzR6A0J7BwUipz+7qap+hrNFKGX
         462nxWB8y9pEe8Hxsjhh88AX0X5ipUuFGjPIxNxwZphUs3zR/HDaWbkbRIQIrQoax/JY
         1N1n20UhyUIkLAQxkIa6igoVAZwsrpVwtyhEypnuAFeO/PtM9XM+kiB2iYUM8a3VSp4S
         ZARg==
X-Gm-Message-State: ACrzQf0HMGh95wcGPia7j2rm1QT5AZcGaZ1A1wqnkWdJaEe8X08j31tx
	sDWt/G+AQ2WS0hpTYklA1BXj89wOpKLV/O4m
X-Google-Smtp-Source: 
 AMsMyM7OY3f+xsvGzE8BTwcgdPa0Yd29WXXyUMoox9UlzukqPA2667jaJvoYszi7sVKRxvmRvRUP8g==
X-Received: by 2002:a05:6a00:138b:b0:561:966a:74a8 with SMTP id
 t11-20020a056a00138b00b00561966a74a8mr2617471pfg.5.1664810980314;
        Mon, 03 Oct 2022 08:29:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m3-20020a170902f64300b001781a7c28b9sm7300261plg.240.2022.10.03.08.29.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 08:29:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/1] documentation: update for 3.1.20
Date: Mon,  3 Oct 2022 05:29:29 -1000
Message-Id: 
 <41444bbb1816a20f2518faf9c6a9e4c02505a53b.1664810900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664810900.git.steve@sakoman.com>
References: <cover.1664810900.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Oct 2022 15:29:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3261

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index dae9abb63..b6baac7d0 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.19"
+DISTRO : "3.1.20"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.19"
+YOCTO_DOC_VERSION : "3.1.20"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.19"
-DOCCONF_VERSION : "3.1.19"
+DISTRO_REL_TAG : "yocto-3.1.20"
+DOCCONF_VERSION : "3.1.20"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.19"
+POKYVERSION : "23.0.20"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


