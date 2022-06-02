Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51F2CCA478
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 17:05:18 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.138.1654189511751523635
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 10:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oCbfyDz+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id y189so5226088pfy.10
        for <docs@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YL8i64YfkCr/y87IwtZjGBfrRKJXjsu/ASVTsPiP6+U=;
        b=oCbfyDz+WyjOFJXZn4bT6LE1x+UDS0hjji9r/MWuWYGYa4rxQFUemaQVqu3J24bwEb
         9qtb4G1X6DukAvw9yPauMgDV++um6I32adwj2e7JVB5q3AVouuJRFhlIYKLii9thcVsX
         qC4EtSX88INqziJOzSLiYoKPfSmofZy5l4F2724w5kpIbuk5M6R2jbU91f2Bcviy8PPR
         WDDeCe8UrcuTUeTx+080mUS3d7qVvIwbep5GDWNEKtMkIzHbZeyzRYNjllaeebIxGaXI
         6ffdL0o+Dn2w8Ecc8ojeh/g5y3efhwT0Yed93dwmirYOplKnuhG9uJWBgktm/fUPr/pA
         6LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YL8i64YfkCr/y87IwtZjGBfrRKJXjsu/ASVTsPiP6+U=;
        b=NWPH0rvCRsECJoEZBcTe3AQ+rqa4iK5kJ0XoSNoN/ghLmMaIexCkijndW1NDewZJqS
         6d5AQj5r8FK4T7AfpurcXBs4yMuulIbQCof82N6clG0SFn5QM/t/qjI5UYsp94dEjXBj
         cDCyPPZlhOZAPjHTgd6iPt4HHl0TW/iowBMfoA3HeITl1YORQ5Z5dZl3zmNQ86GEIuT2
         XPng14LlU7CJEMQa7bVGTqUo8beK0avQqXoCHr0eN0+tdpSCX2h+QOQUX7E+Jko0JMbA
         v/tW/k67S5jj/OB8t/nt/7C8EtD0hQuwRZTB4dui8r+LTkk2VibXZU6c+6FAbTu21LfO
         Ed5Q==
X-Gm-Message-State: AOAM5325/3APihXPKro0qGfUrf9E1UyWiQbd5+GBT5284/vk8UNhAXFo
	bdh5Ldd2zfWB8wJ6Ncm6zJnU1AQOUr7kDpbP
X-Google-Smtp-Source: 
 ABdhPJzONZh69NguskTnmmnFG+GOBt/xZjEO5AdwubaGPDqvbl2JyRwuUHGNl5+qvArPvU/CUe8e+A==
X-Received: by 2002:a63:8749:0:b0:3fc:9fd7:1e20 with SMTP id
 i70-20020a638749000000b003fc9fd71e20mr5115511pge.619.1654189510352;
        Thu, 02 Jun 2022 10:05:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 v3-20020a62a503000000b0050dc7628184sm3858342pfm.94.2022.06.02.10.05.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 10:05:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.17 release
Date: Thu,  2 Jun 2022 07:05:01 -1000
Message-Id: 
 <53bea200a58b6d1b7efbe4699a7d3aecd495423c.1654189451.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654189451.git.steve@sakoman.com>
References: <cover.1654189451.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jun 2022 17:05:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2958

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 2538822c1..abbd4332f 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.16"
+DISTRO : "3.1.17"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.16"
+YOCTO_DOC_VERSION : "3.1.17"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.16"
-DOCCONF_VERSION : "3.1.16"
+DISTRO_REL_TAG : "yocto-3.1.17"
+DOCCONF_VERSION : "3.1.17"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.16"
+POKYVERSION : "23.0.17"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


