Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C1BD767CF
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 14:15:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.13519.1730384115662257080
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 07:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HpPLVYKi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43155afca99so13073155e9.1
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730384114; x=1730988914; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ty2ogSwUTSkUe2Kezo80CjN9yFuRab+33lFNtqXzEbM=;
        b=HpPLVYKi1a3OQqZ4e+vwZWySkgKZ6GjvRGiZUChXQNpC/wAdCmxOKPk/XBRxXvSk14
         yhiDAV0MS3etfATepyIkt2qwApjmlmZDrkNiWITmx/yuiT7D/KWz9iWwN7X80JrBkCAd
         +/rK8V1bkeQL4xxgy7aOhqnebVlxRRyt5UrJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384114; x=1730988914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ty2ogSwUTSkUe2Kezo80CjN9yFuRab+33lFNtqXzEbM=;
        b=Llrb56mevOlkcpRvHAEUZP1spPTPKo4ots8v8ntUC7SBEO2LYCxkMz7ZwM8Co1BWEu
         eWK6ncXDs8EJM9H+a4LF4l3DhqWlsV31367I9S6r1uEFtpT9fCDm5p1zgMmzpXofOXUn
         JS6TqeVxH+az83ybqbqHz4ltw9mTn1OFoBQcIl6U6PcTb0lUiJfBhODfOh4x94h93R47
         KZNxL53LMEtBk2iuAqOSimoI6ipPUX/F7ygNjwuyWe67xde9gNkJ4rOTU+uD/c0qyFKV
         fNPkQLl3DqKNrLHmb5Y8z0cwUJKADufjXEQ2WVNlZtmKzp1abuOPAuOXQpkBvG7dCxGX
         orxg==
X-Gm-Message-State: AOJu0YwAC99fAZveq5oapBxZSx8D7oFO/gWcRzBELUWU8GhzNnJzQr/b
	YjlqkE1S1esTHl71X8uZsbqM4728Kv7ImyzLj+PafipeChS9Q5crqZCXA5Iik3MgoJSscNLI8J3
	7Rj0=
X-Google-Smtp-Source: AGHT+IHB9i3eQ2ehoxWa5I0ZlFpivxTSnLa/B47D+ACfj/gcfUYOG0phsN3oc6dg1CUGduWO5q3Tjg==
X-Received: by 2002:a05:600c:198d:b0:431:55af:a220 with SMTP id 5b1f17b1804b1-4327dac12d0mr22621905e9.12.1730384113762;
        Thu, 31 Oct 2024 07:15:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3ee1:1135:b938:d59c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9180f2sm57248485e9.19.2024.10.31.07.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:15:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto-patches@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org
Subject: [yocto-autobuilder-helper] [PATCH 1/2] scripts/run-docs-build: Add latexmk to tex install
Date: Thu, 31 Oct 2024 14:15:11 +0000
Message-ID: <20241031141512.544354-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5632

Tweak the tex install command to include latexmk which is needed
by the docs build process.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/run-docs-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 4ba759c..bf1d261 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -57,7 +57,7 @@ if [ -e /srv/autobuilder/valkyrie.yocto.io/ ]; then
         zcat < install-tl-unx.tar.gz | tar xf -
         cd install-tl-*/
         ./install-tl --scheme=small --texdir=${textooldir} --no-interaction
-        PATH=$PATH:${textooldir}/bin/x86_64-linux tlmgr install titlesec varwidth tabulary needspace upquote framed capt-of wrapfig fncychap gnu-freefont ctex
+        PATH=$PATH:${textooldir}/bin/x86_64-linux tlmgr install titlesec varwidth tabulary needspace upquote framed capt-of wrapfig fncychap gnu-freefont ctex latexmk
         popd
     fi
     PATH=$PATH:${textooldir}/bin/x86_64-linux

