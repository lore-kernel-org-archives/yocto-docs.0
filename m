Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB665C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 10:24:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.7483.1648031073699430007
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NT5/81XW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so4996117wms.2
        for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q7ph+kLUC4UPxDj74QPQpp+/0ckl4O3NVsFc3DJO+t8=;
        b=NT5/81XW5s83h7BBfXBLLpyp7qEynUp1Pgu/wTDbbzZNZsfRSdbUzKMZfhgCvneaha
         wFHtGMRwgBRh1SFb6U+o39S4PXgn++ZHMV/zsLWBtPjwa4jvqekTEWNhHOGaXLrgcHyp
         7fKOjDyQpkSuofHuT9Dn7xSBwO5ROJxR2d/DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q7ph+kLUC4UPxDj74QPQpp+/0ckl4O3NVsFc3DJO+t8=;
        b=4lKCePEhJSwAmRKkCywwawy6p2ewEa24IOVfmu1ulvFT7po6mppXD9R7zryz+1doEm
         FucFIP5p/r9Wd6jCIFHr5ApuYzFb/v8WHvhE3hJ/ap4nQl8S7nWIpoHmhGJubyWMVqdk
         Hsr7sB7o01r60743yidIyJf3a+ZWFpMhMv1K64xB8s0I/a+LrrFbn+gvOi3YUc9OqY7M
         l51uqk8Pc3T7zWGS7OxuHJYV+kDIyaIXz2lrjmKOcWl5ceZVuCEz+hcLLx8JalqQHDCA
         Q8T6y7XLK4DTTa4rTD6pOpeHc5sIRd2hFNo7VeRTdftKMJ5871KQiiUMVUCJvKkrucKL
         9Odw==
X-Gm-Message-State: AOAM532O8RIqwyXAKLHxm3x63F6r7b4awrPRVDjcwrSgpUt6PDTBMiOq
	sA/2QpYmGg0FPwM8sQQQ2vM+Yki0+ttdxQWp
X-Google-Smtp-Source: 
 ABdhPJweVoDz9DQsIVTAHBTCV++OHAUkxZ4ZxsjTmwBweX6DabbMwjjlXBf+MBdOQblAb+4E0lAYCg==
X-Received: by 2002:a7b:c8d5:0:b0:38c:9eb9:129 with SMTP id
 f21-20020a7bc8d5000000b0038c9eb90129mr8729836wml.65.1648031071057;
        Wed, 23 Mar 2022 03:24:31 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm19985839wrs.73.2022.03.23.03.24.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:24:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] set_versions/switchers: Drop versions shown to the active
 releases
Date: Wed, 23 Mar 2022 10:24:29 +0000
Message-Id: <20220323102429.1263940-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 10:24:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2701

I believe we should only be showing the "active" versions in the switchers
base list of releases to show. Zeus and warrior are old and no longer actively
maintained and we don't suggest new users use them. gatesgarth is also
outside it's support window.

I therefore propose removing these leaving us with dev, honister, hardknott,
dunfell (LTS). In addition, any release that is selected will be shown, along
with any later release in that release series.

People can still navigate to the older docs using the releases list or by
direct URL but this highlights to users which releases we'd expect/encourage
them to be using.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 9f0d79429..af237f29e 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -23,7 +23,7 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["honister", "hardknott", "gatesgarth", "dunfell", "zeus", "warrior"]
+activereleases = ["honister", "hardknott", "dunfell"]
 #devbranch = "langdale"
 devbranch = "kirkstone"
 ltsseries = ["kirkstone", "dunfell"]
-- 
2.32.0


