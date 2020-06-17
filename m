Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.10664.1592408666654831215
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 08:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QL+B4JpM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id b6so2831921wrs.11
        for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2020 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jBKm7aq7zkCFsN9RjvOI9WWgzot0g0vgDLy/FR9N+Mk=;
        b=QL+B4JpMFA82zuqwCFjMAboa3rZLBl+gjjBjZmeSg89lLOv6oy9jX4WsmKbtq8tbC6
         Asb8HEDuRzq2F/2/xeUBvdQI6tQ6sub8+z3/dh5T6gJMZlJzJLXdlsVJPE1+wsKgRa4Z
         Wpj2t7/26HnX1WGt2RJXqRFi+mfXaKeYepm7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jBKm7aq7zkCFsN9RjvOI9WWgzot0g0vgDLy/FR9N+Mk=;
        b=LJcDXQOwlE283FBehwG5QTaEgvUcTjfLwjwnedSjI8hoalZAoft5wgUtxPYJuZNxQD
         hjJ3t2BB6/4G87a8cK3jbfR5Q6im59ew1kkt4CwuZ4sB9yOTiGqLRsty0g4si1p1qtig
         OxdCXNKe777APs8HlLRGFGSoPRc/4qxMqdmDtiagKg7u7QOXfxSH5A5otdnTng24q8jI
         Z8PnsZeSuQVLXdsfhCdhiAcal5S1pM/WMAtqf1wq1WY0PCcliAvPXH56QoTJAbvPZ3HY
         EbBYRj69jssDkE0F6pbGHbFZDXEc1TX0y30yeh8HJAsdwyzl627Ee9BlsygwD/Cww4VQ
         KMOg==
X-Gm-Message-State: AOAM533ib0cwuM6u0CfPq0XC9tN5RaFJ3n1YxjmK8NjGTM3R/deS9mTk
	OqY6cZHO8E1iLN+x/+hGQUm2dntDB/40Nw==
X-Google-Smtp-Source: ABdhPJxmiO0f+7jPR7rYF0eYiFT/BxVejuExRuzwSVQvGtyvIuFREeyuoqzoa68iS64on0tjiX+qYw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr8986461wrm.70.1592408664909;
        Wed, 17 Jun 2020 08:44:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s18sm41561189wra.85.2020.06.17.08.44.23
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 08:44:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/4] .gitignore: Fix the test-manual entries
Date: Wed, 17 Jun 2020 16:44:19 +0100
Message-Id: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .gitignore | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitignore b/.gitignore
index c1e30692c..887a0e656 100644
--- a/.gitignore
+++ b/.gitignore
@@ -80,8 +80,8 @@ documentation/overview-manual/overview-manual.tgz
 documentation/overview-manual/overview-manual.html
 documentation/overview-manual/overview-manual.pdf
 documentation/overview-manual/eclipse/
-documentation/test-manual.tgz
-documentation/test-manual.html
-documentation/test-manual.pdf
-documentation/test-manual/eclipse/
+documentation/test-manual/test-manual.tgz
+documentation/test-manual/test-manual.html
+documentation/test-manual/test-manual.pdf
+documentation/test-manual/test-manual/eclipse/
 
-- 
2.25.1

