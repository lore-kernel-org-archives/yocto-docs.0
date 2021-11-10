Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126F4C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 17:08:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.1119.1636564136756337773
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Axc9Dndr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id n8so3569649plf.4
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MJ9rTt6+kwNmE2WKqE0z4LOnmoAteXDocvY/lZDTMQw=;
        b=Axc9Dndrjw9I0SuOobHZ+J2PBuDgnF5wqeM9JQAL8D6bja6CNFtdQ/N6B9Q+frhz0y
         G3WVak/MgPloYJZGYzSCig0/rvlmQ6u12pYUy1dJJ8vQhbAXnOm3rI8Ain340ycqeGQJ
         NNDknxFmfqCciFtq5OCpmD40G7LcW8cELXrLpXsbn+NzIjZRFurTVx/qQJCUhPZMz0DP
         S4fy5sUrk+/t5NUtFMK92CHyTbCTbRmfFWOe6us1BrfXedUJkLiaeD6Ud2xRf+4eGRjj
         M6+KuXtpaOQnqbEB5scJ/5gcv3yFFQiV8dMWz7yeVlu5eEPC4FU9f+/rEntbFPoDRvCF
         vdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MJ9rTt6+kwNmE2WKqE0z4LOnmoAteXDocvY/lZDTMQw=;
        b=gOTb+ZILoHqum+R7MxGBhGYbH3SWEXf3npoy9vhd1Z/LXHhyGN0C4gkhIdnTTCCHHS
         fw7npe3tMyZfQ7c7c1OtnkJwhdFYpULKDELV8yWbGteigI7cxIYKsA/Y8IhFAMfXxGtE
         ra6OH+kiduYfCFCKQqb5I7tKv4vizXKWZ3FGDE8Grx6c484u1grA4pNm3kdWO/PcPIGE
         EWjUQFNiZMlbZfnjRmewEWqCl8Km2q4RgZF33gI0D1wV+C3Ins+u2KN6Om//wHMyy7k7
         Tbg5CMpuSblsfK+5r2ci/4adRWJEDaXLhzrAR1Scs1U8FjdKWLuZZlRljnnyuXsS5vkA
         fdFg==
X-Gm-Message-State: AOAM533SDrp+uOmSPXVtpdeh6tJEYhtkLaxrfr34C5Q3o8FWGWGk7BvK
	bjCJiniqxvd68XKtsEb+SDdi9c90EgFo+XiZ8dY=
X-Google-Smtp-Source: 
 ABdhPJwpVyKhGslsoY0I8kS0pnrPP169tlB8QsoolYFp/lfc5LOPEP7pj91ObtW65sxBP77S4BLwlw==
X-Received: by 2002:a17:90b:1d09:: with SMTP id
 on9mr364271pjb.191.1636564135638;
        Wed, 10 Nov 2021 09:08:55 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m6sm164595pgc.17.2021.11.10.09.08.54
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 09:08:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/3] ref-system-requirements.rst: Add Debian 11
 to list of supported distros
Date: Wed, 10 Nov 2021 07:08:37 -1000
Message-Id: 
 <1e32fbf2a24dfbbffb0450db97bac76ac7440da4.1636564016.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636564016.git.steve@sakoman.com>
References: <cover.1636564016.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 17:08:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2116

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index d238dc454..4c4a7cf0a 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -65,6 +65,8 @@ distributions:
 
 -  Debian GNU/Linux 10.x (Buster)
 
+-  Debian GNU/Linux 11.x (Bullseye)
+
 -  OpenSUSE Leap 15.1
 
 -  OpenSUSE Leap 15.2
-- 
2.25.1


