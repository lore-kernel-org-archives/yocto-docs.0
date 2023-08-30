Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A320C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:44:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.524.1693410288908797894
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 08:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BHntOZM1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-401b0d97850so56255135e9.2
        for <docs@lists.yoctoproject.org>; Wed, 30 Aug 2023 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693410287; x=1694015087; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=azYrLULykSxdLDhED6JewZt+WUiM126YPGH7Hi1vK+Q=;
        b=BHntOZM1yaU6hnKGeL32/W4iumh/ubEjbid0xZcXIpq98W0kfriQNK6gE5Pa3BuSZ3
         e6Ic42Cr4dsdKUgAn0totIqwaNfyn7hsSN2fSRJsuZ7OEWhfN3AYdCNQbrPhZLn5g43T
         +nNOUDBeuh1TQKqm4e9WCDZeXuBIYddvr8sRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410287; x=1694015087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azYrLULykSxdLDhED6JewZt+WUiM126YPGH7Hi1vK+Q=;
        b=ClNRw5CVRLIEYnBoIMgn/FAmCrq6yS5lY48U/fVIyGsrsobBVS3Z/TvvbkyOlt6xtX
         FUzkHqcU+lpXciVtW0NJ/rGWBihe6lJJMWjPknni2Al+8GpK9U+LHXu5hlnXTTahHE02
         sej3nmCkqhL3HXAwypG94WNrYrA/GPnfqGkq03V8oBdbz4kXElFQw4vzaTgQmcmyj4rS
         FHfjgfzmgY1nfh928VF3CT/E5Yt8xq/zcuHbrSdAw6qd8sJCbieHyt1rJ7tBhVNkZIAK
         6chDJc2MCjeW3BBn7664WhQtR1BMlQqKCw01pJ/WuDRghgT4ZtBwYCqUx6DZocSfqAer
         ha2Q==
X-Gm-Message-State: AOJu0Ywt0vqeRglU+07MrRDz8QnY6tbv93GCsSup6/aJk5xKK0jcdICn
	sp6hbAdICufrLpDwDAJIykA1Gj5uDR8Yy/4H0cM=
X-Google-Smtp-Source: AGHT+IGuTbfdlmdYl+2EKFO+l16J9Fhw1/kmkwaST+12NIGKlyg7UDjQhO/U/jxDKxHR/vo6QW//BA==
X-Received: by 2002:a05:600c:2297:b0:400:2dc5:2006 with SMTP id 23-20020a05600c229700b004002dc52006mr2182000wmf.36.1693410287136;
        Wed, 30 Aug 2023 08:44:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003fbe791a0e8sm2772181wms.0.2023.08.30.08.44.46
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:44:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] README: Update to point to new contributor guide
Date: Wed, 30 Aug 2023 16:44:45 +0100
Message-Id: <20230830154445.2017109-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Aug 2023 15:44:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4179

Now we have a contributor guide combining various wiki pages, point at
that and tweak to match our other READMEs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/README b/README
index 85d8d837b..dfbf7bf0e 100644
--- a/README
+++ b/README
@@ -10,23 +10,22 @@ An online version of the documentation can be found at:
 Contributing
 ============
 
-See https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for generic guidelines for configuring Git and preparing patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+for full details on how to submit changes.
 
-Read the documentation/README and documentation/standards.md files
-for rules to follow when contributing to the documentation.
-
-Where to Send Patches
-=====================
+As a quick guide, patches should be sent to docs@lists.yoctoproject.org
+The git command to do that would be:
 
-When sending single patches, please using something like:
-'git send-email -1 --to docs@lists.yoctoproject.org
+     git send-email -M -1 --to docs@lists.yoctoproject.org
 
 The 'To' header can be set as default for this repository:
 
-$ git config sendemail.to docs@lists.yoctoproject.org
+     git config sendemail.to docs@lists.yoctoproject.org
 
 Now you can just do 'git send-email origin/master..' to send all local patches.
 
+Read the documentation/README and documentation/standards.md files
+for rules to follow when contributing to the documentation.
+
 Git repository: https://git.yoctoproject.org/yocto-docs
 Mailing list: docs@lists.yoctoproject.org
-- 
2.39.2


