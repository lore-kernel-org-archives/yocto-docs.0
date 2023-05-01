Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54040C77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 14:34:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.95445.1682951682292105345
 for <docs@lists.yoctoproject.org>;
 Mon, 01 May 2023 07:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eVWDJz4w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b7588005fso1977853b3a.0
        for <docs@lists.yoctoproject.org>; Mon, 01 May 2023 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682951681; x=1685543681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+pWvocxcOKRpbY3TmnNwghB3vYy/HE8nKc39/FB73g=;
        b=eVWDJz4wsG6CVt1004Cyh6T5qHySxMZ118xfwWQRE7tkfvxyPOO8w5pQOC33eb5fZR
         E+XJT6JW1lkNIkGajAhOnky6PswFSqt/HdaU4KKp/bmTjsnQ6B8vtcnfJNy+Oby9N8pg
         1W3KmO5508wiqgpfiyTjjYUcwKPujXAmz5hJXc6fJk9H77t7UONk7oHxwE6ZDDuFAPoT
         5VlfR8D+tDL3tE87W2ZZgvo1qsbCAx2B74aeDiKocBNiYTTlOHK8Rio+oX6WCrHf9SCF
         cVV5ilNPxIQ1QkcC8wRCdvLEGiMmEhPhuWmd7IxfKA6v11dHNbxiXFNkb+lAqQGNByL8
         tkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682951681; x=1685543681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+pWvocxcOKRpbY3TmnNwghB3vYy/HE8nKc39/FB73g=;
        b=K+g80ZRprW1LufDAzTX/hoVv4DYJ+jLJVDYUY7O0k/+wleQMg3NpF2/u3rK/Z3DkpH
         0/FhBngCBeAcvighpowuwpXDzAkxCaCTuEB4lKRs/m6zl5QkAfWCBvn9e1y860O9FN3g
         4y71rV5ex2l63ffsavdIJPJ9k1Ip5F7cxd2HRCG4uV+Hc7V/vzWGvQoy4OnlQuaE9r1L
         N22aEaKmM7iKLjKDgoqqixtSc4cwvCpJUBaZl5pCVxjMW3zIoTSNL5/L1rv+KKknEEt5
         cz0oKr8BpRccHltD4KxH3QPn06ARgKC3K+F0HRNv6AiYti1IwbwqmLVMU1pRhRoFQQtE
         wVHg==
X-Gm-Message-State: AC+VfDznqZSJVv4jwvkG1qvGzugjcn5Td4f3jrXpMO+caKkBiwdChxlB
	9jmg8Lzv2OZpGQgWxd5TvdpmH1UllALKHGMIqUI=
X-Google-Smtp-Source: ACHHUZ6z3sF896bcf+2+LdkhwGo+Csm81CtENypIe0GjBLef9TZz6xwHOQJoa0MoKz9FlneBi3/yeg==
X-Received: by 2002:a05:6a21:2d8d:b0:de:247e:d1fe with SMTP id ty13-20020a056a212d8d00b000de247ed1femr14635698pzb.1.1682951680922;
        Mon, 01 May 2023 07:34:40 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id ds14-20020a17090b08ce00b00246ea338c96sm2407594pjb.53.2023.05.01.07.34.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 07:34:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.25
Date: Mon,  1 May 2023 04:34:34 -1000
Message-Id: <eb349a63a958f3a07a16f4b41f97750ca6027a48.1682951612.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682951612.git.steve@sakoman.com>
References: <cover.1682951612.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 May 2023 14:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3884

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 71749cc0a..62d69f9c8 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.24"
+DISTRO : "3.1.25"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.24"
+YOCTO_DOC_VERSION : "3.1.25"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.24"
-DOCCONF_VERSION : "3.1.24"
+DISTRO_REL_TAG : "yocto-3.1.25"
+DOCCONF_VERSION : "3.1.25"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.24"
+POKYVERSION : "23.0.25"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


