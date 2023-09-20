Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF092C00454
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 15:00:02 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.42007.1695221997388501238
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 07:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V6y763Vt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-313e742a787so723623f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695221995; x=1695826795; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AZTVZU73LdZU5NpvPmfqtr2pM3trpAFcWA0F5vFyP1w=;
        b=V6y763VtaRG88RtumFd2JCuJNf++LYY3sXpuaTBBfb96BqlwtIUrvS9nDkIJhPNnWJ
         e8pR322fqXLp9hhD+tZ4yZ6vsQbz1d7PX09BgOA+/26XG6s9/B1FLs4C628i4AVRz4er
         toh8IruQD/3uMRh08dC37E7dsWSBCb38CtPbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695221995; x=1695826795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZTVZU73LdZU5NpvPmfqtr2pM3trpAFcWA0F5vFyP1w=;
        b=ec5mRxMCjt/cXMbyv4xC5EIKx+9nvXf5uqK+lbA4yNsNhG6AkTMRM99IojCfgRw1qA
         +b22WfuB2IyfhJdNyBtyfk7CMzvPj2XFny4NlohyJBiY++dPii7pZTr6iaV+gbt5s6ZV
         PJEYGyayFrkl+EjXmHHknoebIzn0q5rtGV6iE/q+VUdvATUNWwYlVXMYDVk1lhwXHVzN
         QdPt9uR1RWn6c347wMcTLJunq3iXkYYB/sCUoVr33r619ZW5/WQFLprvzWZKg4EJDQwn
         H+MRdRfUfBulOKH8hlqrOpBKqLV516RfSfaHKV67cs46Zmtjm/a9QwhLFa8IobuJu0NW
         y5DA==
X-Gm-Message-State: AOJu0Yw6PHvrZlXuYTUU7wWRZaOE5amSBKVHeJfIL03ETgvxb9QFZbTy
	cL2os6EjRsK2/ctI2LGTJml0mPUJQT/ZpOIUdFY=
X-Google-Smtp-Source: AGHT+IGEwaKj2JcmupwL9Oh8ZNLbohWJN22mF1UV0oZhNoXaztQsA7B37IVu9kdy5jjGyuYddB3kUw==
X-Received: by 2002:a5d:6ac2:0:b0:319:7ec8:53ba with SMTP id u2-20020a5d6ac2000000b003197ec853bamr2960899wrw.14.1695221995473;
        Wed, 20 Sep 2023 07:59:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id m12-20020a056000024c00b0031989784d96sm16660016wrz.76.2023.09.20.07.59.54
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 07:59:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] contributor-guide/style-guide: Add a note about task idempotence
Date: Wed, 20 Sep 2023 15:59:54 +0100
Message-Id: <20230920145954.1055731-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 15:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4275

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/contributor-guide/recipe-style-guide.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 1a1c1c6ee..040536058 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -257,6 +257,16 @@ Tips and Guidelines for Writing Recipes
    and ``-nativesdk`` ones, whenever possible. This avoids having to maintain multiple
    recipe files at the same time.
 
+-  Recipes should have tasks which are idempotent, i.e. that executing a given task
+   multiple times shouldn't change the end result. The build environment is built upon
+   this assumption and breaking it can cause obscure build failures.
+
+-  For idempotence when modifying files it is usually best to copy a file 'X' to
+   'X.orig' only if it already doesn't exist before copying 'X.orig' to 'X' and
+   modifying 'X'. This ensures if rerun the task always has the same end result
+   and the original file can be preserved to reuse. It also guards against an
+   interrupted build corrupting the file.
+
 Patch Upstream Status
 =====================
 
-- 
2.39.2


