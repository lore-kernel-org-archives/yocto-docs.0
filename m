Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59AEEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 19:19:35 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.4621.1689707973152979832
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 12:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=u/HPgRXB;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.179, mailfrom: steve@sakoman.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3476c902f2aso30151465ab.3
        for <docs@lists.yoctoproject.org>; Tue, 18 Jul 2023 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689707972; x=1692299972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zS792UgnzLCthzExYH7sS+bowtn80OClRGJdxGL9jek=;
        b=u/HPgRXBDJJU37QAZT+7CxM5I1RkBOCsxtFCs46Ws2me0xboxtscQkRp/kXzrA6Gl6
         26Px8g9PtRA5zWydNCqgHqXQr1VLTVOJw8rTD82Xi1eG6ToULG9qHWmr4H7li1q3qB27
         L1NHqssPOb09ZS25iliLqSl+PjBnkxiyYhTEkILyrfiDLPaEkVNlzSIntCtUyWjtqXOL
         wTXTlQi3vqe1nVyDraRbrwlrhrLxA/SDXXyxJf4a1QiIPnGuOXrumI+7cdRjALJdBgGq
         +VeVXlSdU0BpJykGJIhcvhJGKrZZiTD6Kn5nqVwGtRv3dT6lUJxs0eICoglv1CXTHqWr
         oB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689707972; x=1692299972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS792UgnzLCthzExYH7sS+bowtn80OClRGJdxGL9jek=;
        b=P/+onzys+KtraIqG2Jbiiy0OKEZPuoAZ1OaNBCrrIwCSgrS1SjH09NIwtyQsYM3qU+
         /PhfW0VorB4vmm4OiKuEu9fkxH6zzEcq8UDP3AJpi3/iYUO2sTtRjOC2Q9M//BUawlqG
         SPBqAJaNFlk87jE6bVSP2SyfRxdTxLEI/rdv/JmjCVn6F1TDZLcTrXKu+oLin5vA/CRT
         knaeP3ge+0k6dvBOzuoGICoBJwwo6gDuIHzzs2bAWuMADCdHBt0OIJBec+ggsM9PANlz
         kuGzaqZSSzLJhbS/+1Hfh2tGVE/qOXr+HGUpeus9FB7mtpgiIWRcZPnHaEAtRfoyHUQv
         0AqQ==
X-Gm-Message-State: ABy/qLbYl2egLCEeqKSB+3zd/vmIIXcrGEY5VcCxw5L37ka5hZLIZFPx
	c6T3NtTwOXX433Aau/2HfBSdj1rc6hWw/E24tQo=
X-Google-Smtp-Source: APBJJlG/dpYWkFDKxmi7xlonbRQKLU9DJr042ZvoyViLSIIJr90X/narOA4mRpw+Gqt0sEeBLFfWAQ==
X-Received: by 2002:a92:cb51:0:b0:348:849e:f149 with SMTP id f17-20020a92cb51000000b00348849ef149mr3250305ilq.6.1689707971940;
        Tue, 18 Jul 2023 12:19:31 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w20-20020a639354000000b0055ff89c5453sm2070446pgm.6.2023.07.18.12.19.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 12:19:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.27
Date: Tue, 18 Jul 2023 09:19:24 -1000
Message-Id: <cbb8e7fbc366a55c0eaf9dbf19dfdf0825383e93.1689707871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689707871.git.steve@sakoman.com>
References: <cover.1689707871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jul 2023 19:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4059

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index ead58a970..15b08723d 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.26"
+DISTRO : "3.1.27"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.26"
+YOCTO_DOC_VERSION : "3.1.27"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.26"
-DOCCONF_VERSION : "3.1.26"
+DISTRO_REL_TAG : "yocto-3.1.27"
+DOCCONF_VERSION : "3.1.27"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.26"
+POKYVERSION : "23.0.27"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


