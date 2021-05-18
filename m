Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.2262.1621369709066658586
 for <docs@lists.yoctoproject.org>;
 Tue, 18 May 2021 13:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Nmt5fv9C;
 spf=pass (domain: linaro.org, ip: 209.85.221.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f43.google.com with SMTP id i17so11596630wrq.11
        for <docs@lists.yoctoproject.org>; Tue, 18 May 2021 13:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yV1sQ0JPyA0k2x3NH0thx1Ta08N/Ixd27t2nHrd6qSc=;
        b=Nmt5fv9CBszxEkwxZ4mQFuT+S4olV3PRAvV09tI5g1+CttyUQAx1Rdeo3oCLwadPZK
         imJ3fyiGfqSfzIejY2TqycZiVkcTqF90Wr1B24h8fb7/TCPysyqLvn49zZd2sedOCvSs
         IL4dUGP3oShGZdPRkF7EL7plUI/Te/ImpLCVivWUaMlaUHAgrZEAvoxrzQv/seEXjpeI
         gTubsPW4tNmj5+Rvsminbdgxz++L6ztb3z9igRf2Ye7irLZd/XvskAV4r2zuAco79DTl
         2GmDa6yRknHR5UT/3+a5eXMjks/+oP9loqqmEOjjqa0tr2e+7vdxanRWr9fnUS3jRRPY
         Q1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yV1sQ0JPyA0k2x3NH0thx1Ta08N/Ixd27t2nHrd6qSc=;
        b=U8xUxpl8EEUPoSgp6mT3t3KUc9VPM3ogC5/5lCgNytQczXBpaSQNbwA8YuPyLN1Ev2
         nKA4Z9LLTojzqq5nA3864Ko7N+AtHfPK8c7/RQ1pJrJT/ZvCFS/aUQNlFeQRoE54TLf3
         uOjqh9UFV1PIrLwyJG97TbJbFrKn1oTuFsmyLL1Beo8Fy2Vqn/E6OD34U8FDBdQTe9Dk
         az7tdXn7VwE03EexKfJg69u2LZfYq7EmJ+nSVD3bmRekmbCXdkCr+eyOo0HhpVbk6hM3
         UIrgLkz4DPSPDvnBC8U3QOs9l6fMtY09TtSIezoIpAMzShoMxlztkyMjB5K2UlzvfebR
         Gg0A==
X-Gm-Message-State: AOAM530DwlEUDJ3S0Uo4iYa4zoUSnvkwSY4pZefO25lLvwLdUBUH7pRv
	LIt67cd0yL+OCjitrnu/2Yt6b5s8weWafA==
X-Google-Smtp-Source: ABdhPJwz49mo8rvrrGK2GmRqBWwVeIMknW12iINP4B77MtnA4LhoP8/pAzXm+K+S/CWKAU0CDRzv8g==
X-Received: by 2002:a5d:4346:: with SMTP id u6mr9409901wrr.304.1621369707292;
        Tue, 18 May 2021 13:28:27 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb])
        by smtp.gmail.com with ESMTPSA id w25sm18646911wmk.25.2021.05.18.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 13:28:26 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [yocto-autobuilder-helper][PATCH] scripts/run-docs-build: add 'current' link when deploying docs
Date: Tue, 18 May 2021 22:28:08 +0200
Message-Id: <20210518202808.2147409-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure that https://docs.yoctoproject.org/current will always link
to the most recent release documentation.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/run-docs-build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 52bd567..b2828e3 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -92,6 +92,10 @@ for tag in $(git tag --list 'yocto-*'); do
     fi
 done
 
+# get current release (e.g. most recent tag), and add a 'current' link
+tag=$(git tag --list 'yocto-*' | sort --version-sort | tail -1 | cut -c7-)
+ln -s $tag $outputdir/current
+
 # Update switchers.js with the copy from master ypdocs
 cd $outputdir
 find . -name switchers.js -not -path ./_static/switchers.js -exec cp ./_static/switchers.js {} \;
-- 
2.31.1

