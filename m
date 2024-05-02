Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1980C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 16:06:57 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.9746.1714666010124281678
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 09:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f0ZHJz8D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso52416891fa.2
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714666008; x=1715270808; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6LFEmWiXnDtRxQ+BbGp2aTTgYFVPtc0izgXDRv9BHA=;
        b=f0ZHJz8DFpxNEUUJfJRKBHAmlJGeHPKmlFMfpKfSQI3jfLOqjrkf1llL/DiucYahJC
         JGEyjh/luEJXU/eCUt8MJVYSgTS10SBPMzTWFQ+i3ag3ggBlcRKhyC4NR6nnjWwfvikP
         QGBnfEc8WGvJNQrR0Jjass192B1SkPYS7mvwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714666008; x=1715270808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6LFEmWiXnDtRxQ+BbGp2aTTgYFVPtc0izgXDRv9BHA=;
        b=WkELdrjJ66unl7YNZfSBMlO3Tkli1FNPdfGTb320fPJpJbnVIVFbu8IVtk/HV6dW+w
         iV/BIZK1qnWiTO+8K4KKPuJ2wdSuU+TbxuvgrPDgjzsnKc/xpIt4udAzKKsZaHIY8S4e
         lwOlsncG6GU9/ov57h3HGBRJvIKJk/BdVREWk6yHYwI7oDGM6Uv45yb7mDodLRPiGfMX
         gjuZZe2EVqrSOwz1yqiZ+mZlHe/8pQd9emo94zDE679IqVH+bcXbZDiGMASxHyf8DCNM
         IEhT0K0KC0IVqMlwspUVZPbDZdHsoQWmYWl/AlKZSJGJMFEUUwuRLDYiNCVTesO6VO36
         cI7g==
X-Gm-Message-State: AOJu0YwPGdx6H2QvlBj5BVUFdDvnlAWpCOWHI/zNyf6Xyp0dVcVRpIHp
	YO7WmNzU+bD6BHZw8KpVPAVds2WK+cDY9yK31X9pKQUuIyobNj9a0L6AjS7XMwlVOAADfK5dlZa
	nAcA=
X-Google-Smtp-Source: AGHT+IGfVPvwwi8tGhEzmKi+2UIFlYeqQPnJU/1VQhjaMwDl30yfFBLCv/YofKN0ldeWZm8Anrz1lw==
X-Received: by 2002:a05:651c:10a2:b0:2da:9ed:9b43 with SMTP id k2-20020a05651c10a200b002da09ed9b43mr124232ljn.31.1714666007443;
        Thu, 02 May 2024 09:06:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e92c:f8cd:59ee:48e5])
        by smtp.gmail.com with ESMTPSA id be11-20020a05600c1e8b00b00418f7605249sm2396377wmb.24.2024.05.02.09.06.46
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 09:06:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] brief-yoctoprojectqs: Update to the correct hash equivalence server address
Date: Thu,  2 May 2024 17:06:46 +0100
Message-Id: <20240502160646.3474131-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 16:06:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5201

Also add a note about needing python websockets installed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/brief-yoctoprojectqs/index.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 61c5cbec3..4301bfd97 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -251,11 +251,14 @@ an entire Linux distribution, including the toolchain, from source.
       To use such mirrors, uncomment the below lines in your ``conf/local.conf``
       file in the :term:`Build Directory`::
 
-         BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
+         BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
          SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
          BB_HASHSERVE = "auto"
          BB_SIGNATURE_HANDLER = "OEEquivHash"
 
+      The hash equivalence server needs a recent version of python
+      websockets installed to work correctly.
+
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
 
-- 
2.40.1


