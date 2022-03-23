Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C084C43217
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 10:20:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.7440.1648030802112944040
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eystV7Jp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id t11so1394658wrm.5
        for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZPu5axCwTeH5uyflli+8O22q9jGct1VlJM5a1BWbLVg=;
        b=eystV7JpvWtDHKlYgV7QPu/4Dg9Nd/61iZgggEC4DOyNhrJZ7uVyVNZwCkIMRxco2O
         iRHsbudfFpYRoQmnFWVcJDM0kgAgQen5T/gQpo2nAbuGosQCX0e0P7IUYxgLZUW0I1Uz
         cXwW/z0W24qgAz5l7iiQNiaFpS1Hf4jAftg7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPu5axCwTeH5uyflli+8O22q9jGct1VlJM5a1BWbLVg=;
        b=ktHgm+YX2l81Vya9O6dDqiq5T4Motf27NtIW3t0aGQUGIyZMAl2hAfSN0/Ex8ImvUn
         kaDXCbM8rUge7MMqccFJqsaYDHXk8EcsHMrBoFNRyrpHXIYMGIHJMfuGC0T6ynEL1ls4
         7E7WpmaGU6QOVVepRfEkFvIMkaVjSdcLLR5C0hoVDBTc4zn6G9kyZnqsijLqRmLnvqcP
         vP+aNCDaBz+iLwFUOpN+5JKD/503GwNWnuLpRTXwURBYN12dNCKB/B5K0WpN86nEnbOQ
         1EzSiRkeusfSQkwCQ0PRHwkhvkFcprK5dDWdYVCW7CmIcyMqfsqz2FmfemCWDT1EY/lX
         anng==
X-Gm-Message-State: AOAM533UXHufS6cQs9YP4jir7XF52T8vUQnAOU9mjRZOxg1veppUSrXK
	w0z4zvaPfkL07hpGppsGZN0RnG/heNi85Ghj
X-Google-Smtp-Source: 
 ABdhPJxlPx6uZ0clQwfrCLROX4B73i5Xv2jSnu0xuv9fxo55r6UzWhrmWIQTBfNocpu6S8h5ScBO+g==
X-Received: by 2002:adf:90e2:0:b0:1e3:f5a:553c with SMTP id
 i89-20020adf90e2000000b001e30f5a553cmr25990796wri.476.1648030800311;
        Wed, 23 Mar 2022 03:20:00 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm18171336wrw.57.2022.03.23.03.19.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:19:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/5] set_versions: Add support for setting POKYVERSION found
 in older releases
Date: Wed, 23 Mar 2022 10:19:55 +0000
Message-Id: <20220323101957.1263785-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220323101957.1263785-1-richard.purdie@linuxfoundation.org>
References: <20220323101957.1263785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 10:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2698

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 4ee28d094..96e0d3469 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -39,6 +39,13 @@ bitbake_mapping = {
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
@@ -126,6 +133,10 @@ replacements = {
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


