Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656DEC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:45:02 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.380.1647884701622465917
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NRoc8jHC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u16so20743690wru.4
        for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NIK7pVJbx7EHs5AvMOrkrTVWarZwUoZx7XL53qkcauQ=;
        b=NRoc8jHCm7AdEdX4xzftRx/lnwfRJZ3GmBMK1Hv8U1dbGa16D8a/w0Xq1dwVEYpSU1
         VqtzxdYFHqu5PGvcc4qnVwAzSWmSmZkxbu6DtFMGJtpCt1idx2kfFi6sKZXe3fyaAsia
         3cJ634eYRV7d63xCSyv3J3BXf0+x8f0cvZwTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NIK7pVJbx7EHs5AvMOrkrTVWarZwUoZx7XL53qkcauQ=;
        b=Cop4sXj+XF72+zMpi8w2fWHdWJobIGcQ2jhalLmmbpPLDf0ZzPfLlW6VGWMepguvnI
         iuHhT1gDMtBHsgfkGsOA3VbZ0bpT0zSzMYWM4Uv1nh9dl8OV3jS5KNN3Ppv6/mHNHd2n
         3i+L3pBX9/GM7bBLCXF01ZefLifdbOKArDGfKPz676pak6dnu4OaOcfuuXv7mavE+pOf
         G8CMpANJUjh9WkImngZBmc1PzHIXY7RvjCB+mpk2A4gE2zfkOH+zswlLxjg/U+T9R7Cm
         zy+VJzZZ9elFL3yVm2De2LhcNGY5kZMEOKT4hptBCcI4Q8LvvRTPzsZVQpHTNwFTtHqz
         2hCA==
X-Gm-Message-State: AOAM530xL+qB9cdRVrUF/PgE1LB9Qzw/8A5aSfi01g42ETioJijof7rP
	zBYELLR2211IpnD5883fxq2J3hsVPhHcOpHd
X-Google-Smtp-Source: 
 ABdhPJy4q8aUxA19r6EPZIVvGLby8wKJOu4l/UbCh7Hcae6GhcUfkSS1fwCrviwCkFGe4MTzbPFT/w==
X-Received: by 2002:adf:eb86:0:b0:1e6:8c92:af6b with SMTP id
 t6-20020adfeb86000000b001e68c92af6bmr18790908wrn.116.1647884699757;
        Mon, 21 Mar 2022 10:44:59 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b0038c6ec42c38sm151849wmq.6.2022.03.21.10.44.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 10:44:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/5] set_versions: Add support for setting POKYVERSION found
 in older releases
Date: Mon, 21 Mar 2022 17:44:53 +0000
Message-Id: <20220321174455.1189669-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
References: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:45:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2666

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index a4bfaf1bf..a121125ac 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -34,6 +34,13 @@ bitbake_mapping = {
     "dunfell" : "1.46",
 }
 
+# 3.4 onwards doesn't have poky version
+poky_mapping = {
+    "3.3" : "25.0",
+    "3.2" : "24.0",
+    "3.1" : "23.0",
+}
+
 ourversion = None
 ourseries = None
 ourbranch = None
@@ -121,6 +128,10 @@ replacements = {
     "BITBAKE_SERIES" : bitbakeversion,
 }
 
+if release_series[ourseries] in poky_mapping:
+    pokyversion = poky_mapping[release_series[ourseries]] + "." + ourversion.rsplit(".", 1)[1]
+    replacements["POKYVERSION"] = pokyversion
+
 with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
     lines = r.readlines()
     for line in lines:
-- 
2.32.0


