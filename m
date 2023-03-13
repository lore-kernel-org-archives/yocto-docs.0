Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3830C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 17:25:21 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.130.1678728319411311698
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Mar 2023 10:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tJiBhopu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so4977072pjb.0
        for <docs@lists.yoctoproject.org>; Mon, 13 Mar 2023 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678728318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJay371SIS84hidvnXMa/TSWyF6hCjS8pR+cO97OZ7c=;
        b=tJiBhopuZKC+45C5NsVyrxCHTeYKxuv+h6Px6aInN8G8kuxE8J2K/2N05DaTMVQjSd
         q5ousIXo4i6QWlYbvMErQvAIVznIFCXgMjZEZT4oZSW3VQrVtSjc5K8+Sc6atwxG6Kpv
         +p2L5ePis62ud3mmro5FCFS0o9P8q529d2Gtjukl9NCZJPLc/zvc+2frZK2b5GWHDkHp
         6vRIjdMAP1o7XaOSPpaR+WtTeUirZf0DzkVamo3KGYyTKRJHbHby03U0gg4Yqdz6AwUw
         gHGEryd/ABAifb+pSlvC7R70zQLf3N5vQjDd7yh8HyvFbEDZQxgN+qAPywRrc0GKdemP
         KASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678728318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJay371SIS84hidvnXMa/TSWyF6hCjS8pR+cO97OZ7c=;
        b=YYXYqxfW90VBDY+9gJcmpbN4a+2spZYmchZhnzp9YZbIYrkGEbsCgzATHRnx3+TjtG
         u4YHVXVUunCGYA+9rlIZ1YEiUvz0y2gDrDaTaoSKlF+Fp0mSUYz6DLHxAZaWtN4f2Lda
         JmDoB2Z/qKVkfXxFBZMerBkq9zuh8ioGAd8WuX6ME9hEvtVCS7omSkr07Xc5PQzAeeAf
         E99yXr1pfXQhMm9wqjs0x4LdinNaMCFR1MASVB0CgHukt8daFqpwOne6MEhNShiAZcC7
         DUKnYL4GoSH40tdIpkln9WbHVi577h47V5M6uZo5Ikdeze+ypWEUwA3HqwybCQTlgDkf
         2CrQ==
X-Gm-Message-State: AO0yUKXRC9k7/7mK3DjPjs4vsfgARxWuR+XG2rhhNyxMrpoX71A8bqnk
	kZrnMaOEltJAmNvzXOQBL5+/Le8KPQhwAZ6hWvc=
X-Google-Smtp-Source: AK7set/5wZJ7CHN7EXpOVwz0BA6npg2LOU8bKDPo9vzKpVygR3O/NUPPznzt1bjzqrPR0qC+mQEgIg==
X-Received: by 2002:a17:90b:1bc4:b0:237:b5d4:c0e3 with SMTP id oa4-20020a17090b1bc400b00237b5d4c0e3mr35818262pjb.33.1678728318323;
        Mon, 13 Mar 2023 10:25:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t10-20020a17090ae50a00b00233d6547000sm112681pjy.54.2023.03.13.10.25.17
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 10:25:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.24
Date: Mon, 13 Mar 2023 07:25:10 -1000
Message-Id: <ce11be44babdf2ab5f4a662634673e2da3299f13.1678728258.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678728258.git.steve@sakoman.com>
References: <cover.1678728258.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Mar 2023 17:25:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3787

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index d33ea2712..71749cc0a 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.23"
+DISTRO : "3.1.24"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.23"
+YOCTO_DOC_VERSION : "3.1.24"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.23"
-DOCCONF_VERSION : "3.1.23"
+DISTRO_REL_TAG : "yocto-3.1.24"
+DOCCONF_VERSION : "3.1.24"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.23"
+POKYVERSION : "23.0.24"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


