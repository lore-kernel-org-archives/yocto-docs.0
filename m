Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.7531.1603885761847914064
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YmDxTLQ+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id w23so4257476wmi.4
        for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2020 04:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT7TRr3YnyxvxwlrDLkzUJCcwcGJo07ubPHaFnm27rY=;
        b=YmDxTLQ+yI0k6r7HTE1dfmx8ptEV7gv6sfBiGna+x8xmQOau+bePHesKXcnC11qdot
         6Ngswz+/1TOwSsT8EiYC4Y7Qgsap0Pbo0yqFxcJz8cmTa85bDIiKNspiTSUtS+Y+f2wu
         qMYcUvuUrnoBszolOAcdYevNG/mtqzVro/UF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT7TRr3YnyxvxwlrDLkzUJCcwcGJo07ubPHaFnm27rY=;
        b=pjRnT55DB4hpBUi7updF9jYn/fXryTU5OweiCvERzCgXBfHdgnA/HHEWw5qXWCfm/B
         JpruAwIQ5s26Rxa5xonPQ7R7tAXaJPts+10RhWixqU58r4ciZkW8qTvGGwgN2vZWVtNH
         virptv8XK81HxOZCrJyA7oEmGj+twDZlyY97Q8FmF/Xk74mUZ5yDHVXskM3IRL2hmvIw
         A/DOXg4tSvuvg24etjHzAR8WjhC5Xk1I/eP7rD5hpYdPR2mSDB25IwfTBCO/lNlIxbHY
         4op+BZUtvu11rCXThSP3G/1UpaJfwmrPS3tk5YIu9D+nY2gRY2r4X7BFRpMuvt+Hh7DP
         P3vw==
X-Gm-Message-State: AOAM532rllodDbNymu6/tqRLO+CSlHyB7hVc/lgbvYMFupvoMcEEoDyN
	orvEY3I+mkyDN3NBp97hB8gM/IHLWnsGNg==
X-Google-Smtp-Source: ABdhPJw6JnqFVVVyGaKzl2AUtBixSKmvE4ii3AqqJPU/o6qEe9pDOoIN9+3bpjg61elUXVwy41eQ1g==
X-Received: by 2002:a1c:c30a:: with SMTP id t10mr2403610wmf.183.1603885759254;
        Wed, 28 Oct 2020 04:49:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id z6sm7025504wrm.33.2020.10.28.04.49.18
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:49:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] dev-manual: Add a note about prelink changing prebuild binaries
Date: Wed, 28 Oct 2020 11:49:18 +0000
Message-Id: <20201028114918.176888-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 0630040e6..27aacde60 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -2602,6 +2602,13 @@ doing the following:
    where you have installed them and whether those files are in
    different locations than the defaults.
 
+.. note::
+
+  If image prelinking is enabled (e.g. "image-prelink" is in :term:`USER_CLASSES`
+  which it is by default), prelink will change the binaries in the generated images
+  and this often catches people out. Remove that class to ensure binaries are
+  preserved exactly if that is necessary.
+
 Following Recipe Style Guidelines
 ---------------------------------
 
-- 
2.25.1

