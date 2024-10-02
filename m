Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1579CF31AA
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:38:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2683.1727858324811721988
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 01:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WFzUxbB3;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ce8458ae3so2781934f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727858323; x=1728463123; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjwdVabV9dtO3JjeFAI4f2l7Uu9g0NFKDxf/EFtJbhY=;
        b=WFzUxbB3sbjsozz7XpFbSATwQWpCd/bNALMHNsAKBoPU7u+QjHvPybxrblkq2MS3lc
         bKJOUTqLUu4ROXmR7r5hzJ30wQzzpkA8DZcwT53x8HBcKIv4Lz9PUGHURfa3NHmstKKs
         Kpbc3bxcPzvm9SbvYfzYcTGVraFXPvmoJgPyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858323; x=1728463123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjwdVabV9dtO3JjeFAI4f2l7Uu9g0NFKDxf/EFtJbhY=;
        b=dGMhuGIIpSOn5DYK5SWToAwRjS7cVr31zDh8s7BjBWXCChAsmB1JXooffVqiPQ290k
         DNlsZQjaDnCTLRonYpgdnYeCVGwGSEXfqqhf+KqJ3/OAhUL+FNgb7jRmrjKvKIAqzDC4
         o4onVJnZfFF4GrgFCEXQrKGsAW5GK49iiT5qaIPlAqO4kTPGUvZFwOuhg7OjZaDouqWL
         B58ZJPBeySsso9BQCTu0OShDig6ZEtqJCFUXK/xSjvi1buwoqLZRrpJ4jK/bi/Z/kIEH
         e1TUn/wTMOzKcKqd/30IOnJRGKaENo62+UC6n2rab29XX7W3tO6FNPjFgyFWUvVg6gAy
         23fA==
X-Gm-Message-State: AOJu0YxCn4gf06aNSdaEATj5mE62rJQm0gNzMkQnAX/xCYlgQvtTP4sH
	oxUtOAPFzbGZYjjYDYlANxYnkgGp+ukvfKd4jh26isxl7JTMahQe1IeSG1AN+XW3yJnEq8KPtR6
	S
X-Google-Smtp-Source: AGHT+IFvamWWkui3fbWvwD6kf0I9jONuH6Uuk1CRn+4Oocp2u9a2NAMZ06eblOcg8tHmdDVyYqCOvQ==
X-Received: by 2002:a05:6000:156b:b0:368:3f6a:1dea with SMTP id ffacd0b85a97d-37cfb8b5451mr2586056f8f.6.1727858323039;
        Wed, 02 Oct 2024 01:38:43 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e94c4sm13433204f8f.62.2024.10.02.01.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:38:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 3/4] release-notes-5.1: document fixed _test_devtool_add_git_url test
Date: Wed,  2 Oct 2024 10:38:23 +0200
Message-Id: <20241002083824.933981-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002083824.933981-1-yoann.congal@smile.fr>
References: <20241002083824.933981-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:38:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5398

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits:
3c05286fa10 (oeqa/selftest/devtool: fix _test_devtool_add_git_url, 2024-04-26)
268dfbd9491 (Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2", 2024-04-26)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
v1->v2: Added RST markup
v2->v3:
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
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

