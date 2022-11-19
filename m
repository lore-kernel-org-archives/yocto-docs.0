Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D193C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:55:58 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.26512.1668880552838286930
 for <docs@lists.yoctoproject.org>;
 Sat, 19 Nov 2022 09:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5MxV9/+d;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso10963984pjg.5
        for <docs@lists.yoctoproject.org>; Sat, 19 Nov 2022 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mna+UMGdKjobeFsVWI7cP7hTx5dM09awiwuZFTM+ss=;
        b=5MxV9/+d1xYOY8OTeUSKSywT8IrGDXUbTmG1v0YeIHpC8s+EAu5dUlbRFKbfOPNHiI
         1rZOg+Nh7+IuISQUqCvVrA9KkdcssJk4GQGSiCwLsCoOWoidCOIJby+vn6cK5CcYQB12
         0Z+WLV7HULb/pItoKUXJcU1jYuh+4ZMNANu5cetfgs+AC0tHmbRWbCKNqu1dgBZOIa3N
         Isp0f1izPlV8jcEvKTAT+TVmBjuBOfZ0mCwjgYwEz6So+4iCvNK/SMWwdcWf9ZHUWRpb
         WUIqcT/KCQI4TZNplj/g8yALaKRVbl0AjujIx6+ELv0XLFUrWgR1qx+AIy6D0xS32BDe
         F9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mna+UMGdKjobeFsVWI7cP7hTx5dM09awiwuZFTM+ss=;
        b=5MWO4rd5orW/Dk0B9zSzngrm9knrl2wg/QrDt2WIoAZ+1epQ+hai8UlSxdIUr3jCBv
         tl3lZo7QAidgvHqLZwAfTT2E621fkf6Jp2x2a1biAPvOiFDTeNA8rwKOGvN05wDMNLSy
         AgRql3pXZQcgCNerHDAWl/wiYBevgXVCsMGBV981VCmwebShWyPCEU1FUrd/1G631iwH
         nV6rKhScbi6BQ40Xur8ucwuEnmjJ+V1jvUs5M/mmjNJtrYXLDrZ8rob11dLDx6cT3BTr
         Q9nkV14CRbm3PU8UOWH1Bmz96KVzWNMCJxilQjTo0I8uzUd/4fJmrMwPYR9mdzySzCuN
         BImQ==
X-Gm-Message-State: ANoB5pm8bXS8E7PkInebzthgXMxNhQ8fog4FfGw0sgmnVnLCuv35yscG
	xZVsJPU9iW5IQDokJdVu5//FvRgKIMA9xixH9TE=
X-Google-Smtp-Source: AA0mqf7xG9/XldJ7oMzEDavZYiVG5wZI6LnLjtdaji34OJFwhM/b9euk83/EojOSQ8RC+0XMbOhOyQ==
X-Received: by 2002:a17:903:204b:b0:179:fe95:f6d9 with SMTP id q11-20020a170903204b00b00179fe95f6d9mr4739419pla.51.1668880551794;
        Sat, 19 Nov 2022 09:55:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id i6-20020a626d06000000b00572275e68f8sm5340830pfc.166.2022.11.19.09.55.50
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:55:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.21
Date: Sat, 19 Nov 2022 07:55:44 -1000
Message-Id: <6496de481a9cb0a9ee9bb58ff44a9761a0b57fea.1668880480.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668880480.git.steve@sakoman.com>
References: <cover.1668880480.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 19 Nov 2022 17:55:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3493

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index b6baac7d0..2cadb6989 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.20"
+DISTRO : "3.1.21"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.20"
+YOCTO_DOC_VERSION : "3.1.21"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.20"
-DOCCONF_VERSION : "3.1.20"
+DISTRO_REL_TAG : "yocto-3.1.21"
+DOCCONF_VERSION : "3.1.21"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.20"
+POKYVERSION : "23.0.21"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


