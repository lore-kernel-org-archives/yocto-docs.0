Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C11C67791
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.14000.1650491895792223909
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 14:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qb1GuKnc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id x80so3214959pfc.1
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nVhsksn0Mcf86pWen4yM406RE9Eyn8GMsBuXOrmbOZs=;
        b=qb1GuKncPJ2bYMGCfz7TputvfojJEyvKrizwxyR+0K3TvFdcRavJi4Gjck4tDNFe2g
         61nLpZy9fRNKxuaociyyF/kN9U5vPfh9vqdHbXn2zr4/63xsvNDU9bLr3slDjmmFulHF
         gzkDlNpyi61bZd83ruIEb0oPU1bKjNh2wY9aq3RwDWhc5lEP2KmRhiXXZ+qwt5rjbYkx
         0giDGPmLEN3QS83jbnPIUsAbeqHUe9ZIV4QJDmoCSmVfvfMTwoetlNG8XODQLepYjguW
         sqIfN+uKKAqFWi8KaiwFduczU3Fma+GHGqDy8vLqJf98Rjk19AWs5gFIKw+rHta1WCVu
         aiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nVhsksn0Mcf86pWen4yM406RE9Eyn8GMsBuXOrmbOZs=;
        b=lJ/7nD3yRMX6lkgxsGXwq5v5mvDjzdEBoRYELZryxrIIxeUJvWg1UzvjnqCEdHSi5Z
         DyAy5ec9D1B+5obOV4vZThZyJlxKWrWzzNoZ8gZeacJr0TpC0towpK4oj0sd3lone6s2
         uz34oKw2MPE3evh+zgn3s1aYAgp3WxGNZPbSzhXJMJMQh5hiLZ1pGQ0IAjDoDb9vel33
         mF5+t15FyuNDbo9uBk/9u+TlhEzhWYuo5ZsjAvSHse4tPceorl8hbZL3oFoxTc/fXmVO
         +29eWdP6m/sKAFZekt/E4f6Phr8Hnn9DO+yKr9eYMIZEdde7gO62dOmeQZ53Pud9jYtY
         K6gA==
X-Gm-Message-State: AOAM5315zLhKEzcZAqRCdjdRQ6G1i7GeNMbpOTJQtSyS/PZgceNwFs/H
	o4N5YC975q6RSvgh2iQ81uUIVcrekasXoDoH7Nk=
X-Google-Smtp-Source: 
 ABdhPJxgFBASMa+PQ9EoIqQ/ODJsMxp4g785l6gcz/f+Z7UfhvnY/Nig15WE3sUuNnx3aoog0ast7A==
X-Received: by 2002:a63:d44c:0:b0:380:8c48:e040 with SMTP id
 i12-20020a63d44c000000b003808c48e040mr21664803pgj.14.1650491894835;
        Wed, 20 Apr 2022 14:58:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z70-20020a633349000000b003aa663f95ffsm3502352pgz.25.2022.04.20.14.58.13
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:58:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.16 release
Date: Wed, 20 Apr 2022 11:58:05 -1000
Message-Id: 
 <a7d7a208882fc402187458a6ba5b09cef582b37c.1650491830.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650491830.git.steve@sakoman.com>
References: <cover.1650491830.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2818

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index edc23f8aa..2538822c1 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.15"
+DISTRO : "3.1.16"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.15"
+YOCTO_DOC_VERSION : "3.1.16"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.15"
-DOCCONF_VERSION : "3.1.15"
+DISTRO_REL_TAG : "yocto-3.1.16"
+DOCCONF_VERSION : "3.1.16"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.15"
+POKYVERSION : "23.0.16"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


