Return-Path: <tom.isaacson@teknique.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558F1C77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 03:06:31 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.42166.1685329590108010948
 for <docs@lists.yoctoproject.org>;
 Sun, 28 May 2023 20:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@teknique-com.20221208.gappssmtp.com header.s=20221208 header.b=d+XyO/u2;
 spf=none, err=SPF record not found (domain: teknique.com, ip: 209.85.214.169, mailfrom: tom.isaacson@teknique.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b0478487c3so1566765ad.1
        for <docs@lists.yoctoproject.org>; Sun, 28 May 2023 20:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teknique-com.20221208.gappssmtp.com; s=20221208; t=1685329589; x=1687921589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUYQzEBS9A34gBlIlWY7WtNp6sqNixzbv+qtk+kZyvA=;
        b=d+XyO/u2eWT28D17o8kQLhfN4HvtghBy0/0Xwtw6E/4ejWfLiOZwCHu6NkMuepIab8
         Exl4rXoeGl7/CCm9PuKWfNWx4+/3DE2DSYoFqly1Ba+w1Z6VLLlcOkoRDMs+8pPPAi0s
         aos5s+C96xeOQJS/mJgnsRgdBUqvhz+SvrszjAvSTEoHiBBT4b2V44fimqw+V6wfrFdx
         De+wuY3gvsN/DESsvB2cMhyWseLpbcJ51t3QDIsvVtplcAiDSrzadC8uldgICi3eoXEE
         npsFR8d8wceRSWEUvRZa+R0JALInmJ8iTvJ+5nje9/Pv03Ns/grks40zC91R5KwXwVoM
         hM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685329589; x=1687921589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUYQzEBS9A34gBlIlWY7WtNp6sqNixzbv+qtk+kZyvA=;
        b=CuJieKhHd1J9cQtfJL/r2wdJ+6J/83qplzobFSd2J/n/IQ9H0oRFoID6+ppdwK+77j
         t1b0rPqJZ3idFOUM560z7b4YyMxanDyXC9PGE3MQe+1TTfyuJK87tNBjppbXbyMF7ucH
         cC9gemesYccssE5zgCfjrJcMgllb+9ZlZ0uebFAKBYauzp9u/P5rT6RoXUd27gbGxj2f
         ctoTRBY4ySaJWJRvyadnJfXVZrh6pfKhKfcR2TYGTL0DZ7MhtGVR34Aq7+UA2FHgzsFi
         Xi7pRgHGTIu7DoEkNsbyMyLQFuzY+pfplX7fyb+x8nWgvKFiL5PuYy5FAgJ9KXxGM0ud
         gHfw==
X-Gm-Message-State: AC+VfDxBtHajd79ExqlFu3gIhphx9Fm8a1J2itKnh02ePQPziYHeVM4W
	BCNM8DaJL01RZiwAqs936rnLcB7gN6WBbEwMnOA=
X-Google-Smtp-Source: ACHHUZ4zzwx3TO0EqpVsGCTxj8PJUMkBCpjNnWF3v+VV5fiiqzklKajmcF8HNI/QLkpTdJNNe9IhxA==
X-Received: by 2002:a17:903:2350:b0:1b0:45e:fb02 with SMTP id c16-20020a170903235000b001b0045efb02mr10528600plh.35.1685329589275;
        Sun, 28 May 2023 20:06:29 -0700 (PDT)
Received: from localhost.localdomain ([2406:e003:15cd:a701:a561:42e4:bee6:1f53])
        by smtp.gmail.com with ESMTPSA id jj18-20020a170903049200b0019e5fc21663sm3385000plb.218.2023.05.28.20.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 20:06:28 -0700 (PDT)
From: Tom Isaacson <tom.isaacson@teknique.com>
To: docs@lists.yoctoproject.org
Cc: Tom Isaacson <tom.isaacson@teknique.com>
Subject: [PATCH] Fix makefile.
Date: Mon, 29 May 2023 15:06:12 +1200
Message-Id: <20230529030612.663-1-tom.isaacson@teknique.com>
X-Mailer: git-send-email 2.40.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 May 2023 03:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3971

Signed-off-by: Tom Isaacson <tom.isaacson@teknique.com>
---
 documentation/sdk-manual/working-projects.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 9a0db0099..b49a4cdca 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -296,8 +296,8 @@ example:
       	${CC} main.o module.o -o target_bin
       main.o: main.c module.h
       	${CC} -I . -c main.c
-      module.o: module.c
-      	module.h ${CC} -I . -c module.c
+      module.o: module.c module.h
+         ${CC} -I . -c module.c
       clean:
       	rm -rf *.o
       	rm target_bin
-- 
2.40.0.windows.1


