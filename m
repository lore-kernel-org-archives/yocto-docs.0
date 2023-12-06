Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CB1C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:26:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.32580.1701872801653014897
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vybbn1f0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ce32821a53so2458438b3a.0
        for <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701872800; x=1702477600; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3puKyfeUjKpY6sf9oCQUJgzCqrXomlR+KHiz1O7AJ8=;
        b=Vybbn1f0bHgXEI51TGBIucmhIMsQ0Oo1NS/iiQ8f+pVHnMzspqRjbc18brvrZDvWeg
         0XCIWsekqBth7gLd7Bp92dgkmcSLV9hzLqy0+Pj35wXdjaU/DAVPTDMCLDBZOes5d+EK
         GUGHY1G6ofzQIHv26bmZnENj8mlyRhvZ2sMn3rpIhgaKppW2bf0zaoiPkp5+spiScCsJ
         507S7GQ0PNHib3+0QNqGD5w4E2/oL9ClPW70VffD0WjIGtqwq5kaBZmirp5093CrqwGJ
         VHokjv9jtQjVW+OTuqWX+EbUk++HxXZ8bogK0/n5/UGZx/z4GFXBwv0FOKEHxhRqSZoN
         6hBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872800; x=1702477600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3puKyfeUjKpY6sf9oCQUJgzCqrXomlR+KHiz1O7AJ8=;
        b=FbR00v2EWfTGhOYy3JGjqaGA3YK8+D0ng0C7uf1bRB2NXU6W8NtKE5A5G5qeX7CpfT
         kMPDIj80AMnBnPBeslPd+Z/Vhbks30Qbc/qeQjifghLHmi6We7ZSIgTFfNrxlfxB2O4z
         JDquayI0eaVI6zvn0kI15GWhZBG9L1OCDEWe+AT3lI+JcT/ty0/II6oNSPjs9xZH/Nuc
         HYObtq9y6hEiBxfXfcK72RsHPDrkuN9d+tXh6kz3uOEWnNgdsTV9lNTcifOTTKsCvOe4
         7QsD3FhXwt/nDhdLw1bUdYq7oAqvo9SnLhIwUeya6xyrCBqv5Dz2PY5EiIt2OIzixBPK
         Dy1w==
X-Gm-Message-State: AOJu0YyQfmjFT8Dy7kKRprAVi1JDG93Y56U9ARxFqgPGbsqrLKKVgT/l
	jF8/MFFcquiJnic9FNPTX2RRYg6xemqpHE6jD2o=
X-Google-Smtp-Source: AGHT+IEM2qL7lJlpa/1ydy6tvJGPWZXiIv3818Ne/uRed01/zAEoDPHeqdqGnqdhivo26PVZp4CLDg==
X-Received: by 2002:a05:6a20:72a6:b0:187:2c9a:c9ad with SMTP id o38-20020a056a2072a600b001872c9ac9admr741447pzk.55.1701872800223;
        Wed, 06 Dec 2023 06:26:40 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s25-20020a639259000000b00578afd8e012sm6666228pgn.92.2023.12.06.06.26.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:26:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.30
Date: Wed,  6 Dec 2023 04:26:32 -1000
Message-Id: <097511f227abbef31409fe36734795b879471868.1701872735.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701872735.git.steve@sakoman.com>
References: <cover.1701872735.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4655

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 132b772c1..54a1c3203 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.29"
+DISTRO : "3.1.30"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.29"
+YOCTO_DOC_VERSION : "3.1.30"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.29"
-DOCCONF_VERSION : "3.1.29"
+DISTRO_REL_TAG : "yocto-3.1.30"
+DOCCONF_VERSION : "3.1.30"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.29"
+POKYVERSION : "23.0.30"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


