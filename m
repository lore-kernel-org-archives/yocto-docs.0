Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177DDCF648C
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 22:01:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.2647.1727474457062424571
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 15:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TgvH34UM;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37cdbdbbb1cso474621f8f.3
        for <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727474455; x=1728079255; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cc7kLal0iNOFrvUR0JNim/y2gKr458spKJ+YBtAXwk0=;
        b=TgvH34UMrwREnZkgxEt45A/H7r54IVVIQb7ITvEaYYEB+wNwcH2qN9uMRfo7MvRoat
         GoD89e4L/OPKAol33Cnesdg9w5eyufDQfUJe9Zo58RiJdMij1D0dUV9SnsY7nsXpmpgJ
         DgzkZhEcTUia3Rg9YBaQFZ9veP09ZILLDP9EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727474455; x=1728079255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cc7kLal0iNOFrvUR0JNim/y2gKr458spKJ+YBtAXwk0=;
        b=RwWOMoBQnS6/e+maxcZ2GeE5icnwGo/ApZDc++zvXP5l0+/A2exfi1m67Jb6gUqMYB
         K5alJp9u5/6lVE9DtYPdS+2eNfWIqi3oC37PSa7J6Ps724qWt+AD+IdKWk0CsLvSvUw4
         NZOyb+K/cvpi732BYaM+eHH3Ab2lcVtrqLrfmYqhcXsACkASWVOfoTPb5+dUkXai0vt9
         27fMLgTPIB0cSKBMC0jK9jGTdrJey9/1/aFFgHbjZK3IMhga/N8oKzGXPDwMuKF7KwlO
         KbRqXAlC7FYgLO5/HM2n9QTjSDMhc9+JifkH7FaZW7mC5fZlm3rHeoTI6HEqLIqXETjY
         AGGQ==
X-Gm-Message-State: AOJu0YyfEbWn0sml/uGy3qmYBbQ+1lGYQ9npHTh7heHwVYesXeb96aJL
	TRYi9jzzXevQzTOpAbTJfo2BATz1oGPsKQO4rEFYzZM0zeLonM149Qpo4klWck00vhWs+nrBqJm
	t
X-Google-Smtp-Source: AGHT+IHliYfxngykvPPoJMAMgq2QPerleWluoDUyR+g5JQWICSlEK21CKBwmAcRloIek0M4dwN6iFg==
X-Received: by 2002:a05:6000:10f:b0:37c:cd71:2ba2 with SMTP id ffacd0b85a97d-37cd5af2435mr2876779f8f.38.1727474455314;
        Fri, 27 Sep 2024 15:00:55 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm3490712f8f.3.2024.09.27.15.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:00:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 3/4] release-notes-5.1: document fixed _test_devtool_add_git_url test
Date: Sat, 28 Sep 2024 00:00:32 +0200
Message-Id: <20240927220033.3941455-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927220033.3941455-1-yoann.congal@smile.fr>
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 22:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5379

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits:
3c05286fa10 (oeqa/selftest/devtool: fix _test_devtool_add_git_url, 2024-04-26)
268dfbd9491 (Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2", 2024-04-26)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Added RST markup
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 3d5a885d3..75e57ea1f 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -36,6 +36,8 @@ New Features / Enhancements in 5.1
 
 -  devtool improvements:
 
+   - Fix ``_test_devtool_add_git_url`` test
+
 -  recipetool improvements:
 
 -  Packaging changes:

