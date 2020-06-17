Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.10688.1592408667514081869
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 08:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RnZByjX7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id b6so2831982wrs.11
        for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2020 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TBs99cvzX3uauPNU86++OPz2Aby7jiHBUfaYqMTdnw4=;
        b=RnZByjX7Bz5V4dL36t9MXPvJ/FiEfDktSPuzPmg1lc1EmK1Ku5XIBizjDbQdXTbE9c
         Q17s1qg9GWVy6NFxyDpibM2modYYG2th2BlA0CEIZTZjZxfKRxzFsbsJJYXzd+hw4eSW
         LO3s3buTqeNAqNdqlRAc35pLozuVsrx4oAAj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TBs99cvzX3uauPNU86++OPz2Aby7jiHBUfaYqMTdnw4=;
        b=okSFezWESd72d21u0MlNq2/EqWaArmajDSNEJRAqJScXGsKV0rJnvo4VRmtATsO8kG
         oZh1bdA1t8Cr7TOyydzoMfdIsT2oFaqckr2sQ8ddTUVdqoa+iDA+ug5TjWYolx8BEn0w
         /x+OLMihW1+IKETJzpO+BTx7+JBVMsxdTfuwYHlZSOdAsSruLUpk4kTsVshG/CZvvTQ0
         omYGYbmeNNJu/iOuTjLA+GZTFdSE4KxpOc7t4nz8hjcTQC8KlQe8RnNP8jNyk3ieJNPT
         TX8az8SF0yq/oJ9uNuhLXwa8OchY4BI1RxvNP2Akf9dW124YF3+af2YVJb5WbBnVjIYQ
         gmMg==
X-Gm-Message-State: AOAM531K2OAOsUC9x505FQ8D4lkaE6XzsQGgyefUTfrDhbfqdEOGXAFT
	H1HWUfsQqN7ROqyLVqvZcyXBTy32/JwmUw==
X-Google-Smtp-Source: ABdhPJwXEG4JmcUzBXqm+kdmHPDSUEJDzs6AE5M+fkC5VfMkAxquQfB1Sp/xT8VX3WJm643kp/RR0g==
X-Received: by 2002:a5d:4e03:: with SMTP id p3mr9314105wrt.350.1592408665852;
        Wed, 17 Jun 2020 08:44:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s18sm41561189wra.85.2020.06.17.08.44.24
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 08:44:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/4] .gitignore: Drop unneeded eclipse directory exclusions
Date: Wed, 17 Jun 2020 16:44:20 +0100
Message-Id: <20200617154422.417466-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
References: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .gitignore | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/.gitignore b/.gitignore
index 887a0e656..e9e525e16 100644
--- a/.gitignore
+++ b/.gitignore
@@ -52,36 +52,23 @@ documentation/kernel-manual/kernel-manual.tgz
 documentation/kernel-manual/kernel-manual.pdf
 documentation/mega-manual/mega-manual.html
 documentation/mega-manual/mega-manual.tgz
-documentation/adt-manual/eclipse/
-documentation/bsp-guide/eclipse/
-documentation/dev-manual/eclipse/
-documentation/yocto-project-qs/eclipse/
-documentation/ref-manual/eclipse/
-documentation/kernel-dev/eclipse/
-documentation/profile-manual/eclipse/
 documentation/sdk-manual/sdk-manual.tgz
 documentation/sdk-manual/sdk-manual.html
 documentation/sdk-manual/sdk-manual.pdf
-documentation/sdk-manual/eclipse/
 documentation/concepts-manual/concepts-manual.tgz
 documentation/concepts-manual/concepts-manual.html
 documentation/concepts-manual/concepts-manual.pdf
-documentation/concepts-manual/eclipse/
 documentation/getting-started/getting-started.tgz
 documentation/getting-started/getting-started.html
 documentation/getting-started/getting-started.pdf
-documentation/getting-started/eclipse/
 documentation/template/1.76.1/
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.tgz
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.html
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.pdf
-documentation/brief-yoctoprojectqs/eclipse/
 documentation/overview-manual/overview-manual.tgz
 documentation/overview-manual/overview-manual.html
 documentation/overview-manual/overview-manual.pdf
-documentation/overview-manual/eclipse/
 documentation/test-manual/test-manual.tgz
 documentation/test-manual/test-manual.html
 documentation/test-manual/test-manual.pdf
-documentation/test-manual/test-manual/eclipse/
 
-- 
2.25.1

