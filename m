Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA95C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:43:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9299.1647607391641458479
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BAz9iGHT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id r64so4772164wmr.4
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NHI6g/BinjIBVq4Ya2VLuRr8K6TAsziRN9uN3JBO6LQ=;
        b=BAz9iGHTWRvU29DDD1aqGNHJBYfaeKRNrv+2339CbnLH8zIVWDo6TlaG/4GWgrvaza
         Ybk1WDKaIv4JImA/4BJIRk17MS/J9nwHDMLEc/dLzha78PkGZktJ8toG8plhmZ8GdyoI
         TL/3ybzhleX0OrB43xVw/0DqQUj+P+aNErPeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NHI6g/BinjIBVq4Ya2VLuRr8K6TAsziRN9uN3JBO6LQ=;
        b=iGbt9/izdLdBbjVrI7nHBUAjh8ktfe9OuwMDkMhdy3H6nfUdcr/WdFMjNhtLU5JuMQ
         vc9n9s35lKDwEs79s+dPSVxUSsMrgMxUZhNTlSgqajMoy/PMy61MdgxaMQVPBnsDG54T
         aGvvNZ/6NQBJiU+jj3crb3/jiXxbhZAJoads7xwmF56AO2KMQeJ780L4CZKWZjROPpFt
         9Ro7WKinnZFBlIpkuAmrQbKOvWbqftakgNIi8z0NTkBJUVgaYXvak2arcXFDivhpeOZR
         6fEn9yAJRfXa+ZFqXlxNcGwKbXlYFQGDVecfLU8jYtXSq0uj70vB7a/C/BjQwxq+gOt7
         IZ+A==
X-Gm-Message-State: AOAM5336GEm9MvyJAzCABdyEcF1xrD7NXIJhJcgJrlugNt+hw4FWRYI8
	xjQ7xb0oijbM2BFEFCNWOTfn2vL8DEKtrFRZ
X-Google-Smtp-Source: 
 ABdhPJzg+5HuJFtf+0ycNH8PMlcxzbFS2fnH/+V9kYO1g+hnZ16OYEx7ARrT847umlRFQ1uIPfZYpA==
X-Received: by 2002:a7b:c1cf:0:b0:38c:75c7:b0db with SMTP id
 a15-20020a7bc1cf000000b0038c75c7b0dbmr7907237wmj.134.1647607389649;
        Fri, 18 Mar 2022 05:43:09 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 u25-20020a05600c211900b00389d4bdb3d2sm13383239wml.36.2022.03.18.05.43.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 05:43:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] poky.yaml: Drop unused YOCTO_DOC_VERSION_MINUS_ONE
Date: Fri, 18 Mar 2022 12:43:06 +0000
Message-Id: <20220318124306.1062149-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:43:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2627

This doesn't seem to be used anymore and doesn't make much sense,
remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/poky.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index c8a890c40..89a059ef1 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -4,7 +4,6 @@ DISTRO_NAME : "Honister"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.4.2"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.3.5"
 DISTRO_REL_TAG : "yocto-3.4.2"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.32.0


