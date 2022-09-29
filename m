Return-Path: <johan.korsnes@remarkable.no>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106F7C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 12:11:56 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.9508.1664453510352781199
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 05:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=hGz6wr61;
 spf=pass (domain: remarkable.no, ip: 209.85.208.172,
 mailfrom: johan.korsnes@remarkable.no)
Received: by mail-lj1-f172.google.com with SMTP id c7so1289956ljm.12
        for <docs@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RQFY7iVoB0oPHLrjLpFfSdOV+ThTabXOsbLwEkr3/Nc=;
        b=hGz6wr61btdCII8rzIytsKW8/X4YzMxs+ZHWBn/IqcsjkBjp3y7fpXB3FLixmcHEXU
         vJcmpA2FNqqEqYK+HBzAT7xu/YshY+2goKunzAFhRMW5OOGBp399m+5c3doEehZx3vsd
         istbFNlGBN75iodKKELd64HShEL2wgYJl5zF8SLbuMz5T5ENqMfGCMAqBD/6FljeFdpT
         pHaotCRH0Jn/FDlMtTqe58PvZYIs3wFPe43P07gQ+sQTYyFuPlXuI4GY8R6gwVQtMjP3
         GVKYYr3zYnORenCTmj49cVPK7yDx5AyXe8+dym1D4O/xcPeSFVwSwF4P5fL27XkPjHvx
         6zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RQFY7iVoB0oPHLrjLpFfSdOV+ThTabXOsbLwEkr3/Nc=;
        b=PTaKnrZiLj8v+fxMiulwBWREW5EeFxoXhWmlQIrjYOiCaYAaet12EECv4LzKI5uWgj
         Ly2jgZV27nKTIcopz+3AKw/LmQudHuLgjkJnW0atLKgcab5embS+rlqosR4QI3h5Ry0G
         VeyR67OVxoMDqcytP+MAfCSZgWJbS97KfKlAYzsjm+VMKmn1FK3czj00H93XyOVSnelG
         88M0bALCMVpUtL+EAT+j0wOOqSpD4mB+CVvfcXFRI1RSoC+tAl93doZ/Or5XvB/X2PZA
         EhVml2hI7oKZHe6u4YNeIdvF3hxrW02DJJRi8pFHV7KPU/hRQuhYzokhX4ceSouG3guY
         6b6Q==
X-Gm-Message-State: ACrzQf0MVsIDxMsJzT8RNA3KIhZJlC6PQVJVjW0FteIBjas53DwTQTpW
	ZcQDIUfvDqPXNdojQVF9dbV5WeAGA//CrAU=
X-Google-Smtp-Source: 
 AMsMyM5r4ybxHhwiP+AG5dhF/LUNSztTy5xyQ0XSMYVCvCHhpg2DXxvTFONBsVC8fI0ZuTD5dNKc2g==
X-Received: by 2002:a2e:7a11:0:b0:26c:3ec4:45ff with SMTP id
 v17-20020a2e7a11000000b0026c3ec445ffmr1019398ljc.25.1664453508169;
        Thu, 29 Sep 2022 05:11:48 -0700 (PDT)
Received: from localhost.localdomain (217-13-24-82.dd.nextgentel.com.
 [217.13.24.82])
        by smtp.gmail.com with ESMTPSA id
 h27-20020ac2597b000000b00498f0434efdsm772695lfp.19.2022.09.29.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 05:11:47 -0700 (PDT)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: docs@lists.yoctoproject.org,
	bitbake-devel@lists.openembedded.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Ross Burton <ross.burton@arm.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] bitbake: user-manual: inform about spaces in :remove
Date: Thu, 29 Sep 2022 14:11:35 +0200
Message-Id: <20220929121135.259094-1-johan.korsnes@remarkable.no>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Sep 2022 12:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3255

Inform the reader that there should be no need for spaces in the value
when using removal override `:remove`.

Considering why spaces are used in the other override operators, it
might seem obvious that they aren't needed for the removal operator.
But, it seems like I'm not the first to be confused about this.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Ross Burton <ross.burton@arm.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
---
 .../doc/bitbake-user-manual/bitbake-user-manual-metadata.rst   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 337821612c..0cc3ba18eb 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -330,7 +330,8 @@ Removal (Override Style Syntax)
 
 You can remove values from lists using the removal override style
 syntax. Specifying a value for removal causes all occurrences of that
-value to be removed from the variable.
+value to be removed from the variable. Unlike ":append" and ":prepend",
+it should never be necessary to pre/post-fix the value with a space.
 
 When you use this syntax, BitBake expects one or more strings.
 Surrounding spaces and spacing are preserved. Here is an example::
-- 
2.37.3


