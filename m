Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE27C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 10:37:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.4644.1650969430806851603
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 03:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HAD8q33A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id i5so5767158wrc.13
        for <docs@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UmoxXBu/Hrq7vGze259g1KmPpZ5RsiGoO2jDOdnlR8=;
        b=HAD8q33AldgYKcTVW18hK0hPaVi9U57NkYi4vuSuLK46F7vY9/7yzO6/RvqQ6FCjBW
         K0TwlEcN1M5uFSJrKoKomDuzXAM4xIRFSbs/57HcW92fKayuwC4yl/JIbXoB+COd29Bo
         igRnTWkSnfkD7d/p0MfyrIvQeqsDXK/1h/PFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UmoxXBu/Hrq7vGze259g1KmPpZ5RsiGoO2jDOdnlR8=;
        b=kpH2K3JEajILq00o67l2DWyaehgTmwfTIrS5Q2rS+jzLTPqpo7QrUXJ0YIg8WkzDkG
         +ckjgSVlnRTqpJplzTNAmXG+O3w29x/hx5jDyqjNQxUFliz14DkcRX9cIhF95Lw7Ekyf
         SdeUOn01BzwUN8Sx3xNZ5G8++ohPlZyFjNX52y9QgEUEcL3EB+jWjBqPtvrdUWV5bkBk
         csWMaJmGpWDxC3+UNry/Zpu7zRHVP6jwmajVDts7K+cUHeHFvekfnDoNwJWl4xF47aem
         M5DFDZsaUm8M+PqJ8q3e5/xnfyN/9m8UlqXtrWO3R+VE6ZG5GVFoJlxfBe2gS0/Osnc2
         Sdkw==
X-Gm-Message-State: AOAM533pc8h2imn9t26vrhcMJtgndf0D1SDZDE0+NH86AC8UgKTnaS1e
	QPUtCOFqs33GoBw5WPvbhRnyXpTcSNTn3w==
X-Google-Smtp-Source: 
 ABdhPJzLc1vqiLzNfJcB7MmoECwdoFCeeesQZ5vkh2EYQqVlK9uzT6SXlACnatxfzpH5wB+mLFY3ew==
X-Received: by 2002:a05:6000:1786:b0:20a:873b:24e5 with SMTP id
 e6-20020a056000178600b0020a873b24e5mr17971619wrg.427.1650969428895;
        Tue, 26 Apr 2022 03:37:08 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8d4:bce8:ef63:7bc2])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b00393eee339a8sm3270969wmq.29.2022.04.26.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 03:37:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org
Subject: [yocto-autobuilder-helper] [PATCH] scripts/run-docs-build: Use
 set-versions.py to get the latest release branch name
Date: Tue, 26 Apr 2022 11:37:07 +0100
Message-Id: <20220426103707.2776172-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Apr 2022 10:37:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2867

The intent here is to use the latest release branch name instead of a tagged version.
For the 4.0 case, this means the full migration guide will be shown instead of
the reduced information in the 4.0 tag.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/run-docs-build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index ecc5332..f6b8ac4 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -92,7 +92,11 @@ cd $ypdocs
 first_sphinx_commit=01dd5af7954e24552aca022917669b27bb0541ed
 first_dunfell_sphinx_commit=c25fe058b88b893b0d146f3ed27320b47cdec236
 
-latest_tag=$(git tag --contains "$first_sphinx_commit" --contains "$first_dunfell_sphinx_commit" --sort="version:refname" 'yocto-*' | tail -1 | sed 's/yocto-//')
+git checkout set_versions.py
+#latest_tag=$(git tag --contains "$first_sphinx_commit" --contains "$first_dunfell_sphinx_commit" --sort="version:refname" 'yocto-*' | tail -1 | sed 's/yocto-//')
+latest_tag=$(./set_versions.py getlatest)
+git reset --hard
+git clean -f
 
 for branch in dunfell $(git branch --remote --contains "$first_sphinx_commit" --format '%(refname:lstrip=3)') $(git tag --contains "$first_sphinx_commit" --contains "$first_dunfell_sphinx_commit" 'yocto-*') transition; do
     if [ "$branch" = "HEAD" ]; then
-- 
2.32.0


