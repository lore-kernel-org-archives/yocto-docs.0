Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF22C5AE59
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 20:06:46 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.13627.1748117198465960505
 for <docs@lists.yoctoproject.org>;
 Sat, 24 May 2025 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k4VbUe/I;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7cad6a4fae4so154213285a.2
        for <docs@lists.yoctoproject.org>; Sat, 24 May 2025 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748117197; x=1748721997; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Kyz27BnTuRro2H1Mazx+syw7fQHjyTjxsJoRVJ8D84=;
        b=k4VbUe/IWtJff3F08xaIhr+R1+OQspdGI534sWbTdUOaKwfGuMpQwIHnpR3JiXLHHz
         yTcLc4DNpxvSnsayquAm8RSmlDADsmb911u/eQ24GmoVGeZf06jwgzQzzNxDQA/I+vKF
         hxsdpghNhBqe2fRFPXtoj7w5B1OEuOGP7D2T3BELQeIJLtb2zTugNhoPrTjAleLYUt1o
         Ju2Qzu+NxtH2HT50/K++QFiekpNZIkZsUWuA1dCtVuVKmOkJ9oamtNYkpz1D/7jbMn27
         OqDlidu7YkN2tr+GsmmYjqOQUzunVo4Yz8yJxAAai+wTsuJC7zL5yfCZAX6e2QO9H4yl
         WXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748117197; x=1748721997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Kyz27BnTuRro2H1Mazx+syw7fQHjyTjxsJoRVJ8D84=;
        b=nQVcNPMT606CYoGo3P7uQD4Z9rIiWkIMvUXvJ9nkTmJ9MJB0s4m0opjjxQzxkpWue+
         4+Ie4nf4hHCmassUwzHPdl1hYLvMDiH4o8rCuPbBE4sXMtTu6F5yvpcEsM2kz4csizr5
         xhIDFE1KvD25Juh6pXL8ERZnChDIxIp6ziaGVV5Ea0R49mTahIQ9DZkZy8KoHTqqJn0A
         UaSLShk4GAA/7gFhdYh7Zfi71PoIcxOlzzgdoa8p8TKbUmzyi0QDn0Ow4ickfYFwupvz
         GZUrkHh4aRxjN8p4V7BbbGkTegsy/MicdgZpl5y/EaG3iQFK080x8cfXKOlznWFuBV5T
         Qs6A==
X-Gm-Message-State: AOJu0Yy9GXWWPCphQXZY0XjVMee4hi+WQMkd/smUpfJQ9ANtAd+h5hJ1
	9XvQK8NzScRNbQ87N00+7E6ALLs/IZVmtvPc9xSqjF4oaVMMcwwc3xBuM1aV4g==
X-Gm-Gg: ASbGncta6b6/y9ce0DT6KhO/rWZnudj7/VhspouAFpqlGeiNmbEJ1NWgpXuomGDO1uE
	PQvAoZEaAKXpGHY4cIo6X0F6sZ8/9xcotxaGOVG5FxZp7N7OUE6WGLzUlCo4VNmZCfUY3fUrOLY
	hRgCSklFAvilWUxVMkRdXp9aqIDWP3FdZ00gVXkXcs16In6odTnFEaRr0+nNhAM15Vl9tIUKbUX
	fNjyjkNYYgBuHSzsRGPFo9617fPiZCfrvavhLkVv84Fxt5e6wBFcgbrkt/V3+KOdQACYO5oSQLs
	UniHNE4fer3ZM0WVPKBWdnE9m4qMvVPMsu1Xg+XrSB0qffjF0oU1LWnG+GDUWiQX0ScFLS7i795
	yPmQdxwsmun5E9odFutM=
X-Google-Smtp-Source: AGHT+IFU88CI8RQwk7Bz6jSQ/4MBesnm9LSdcPKuINSssCR/C7MQsjWIy8IM5SG7CGaBRigRFk5cMg==
X-Received: by 2002:a05:620a:4712:b0:7c5:4c49:769c with SMTP id af79cd13be357-7ceecbad715mr651620085a.6.1748117196669;
        Sat, 24 May 2025 13:06:36 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467edc16sm1364274685a.50.2025.05.24.13.06.35
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 13:06:35 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH][kirkstone 1/3] sphinx-lint: trailing whitespace
Date: Sat, 24 May 2025 16:06:28 -0400
Message-ID: <20250524200630.4299-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 20:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6899

Fix all instances of trailing-whitespace as reported by 'make sphinx-lint'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/migration-guides/migration-4.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 5e240457c072..34fdda907695 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -143,7 +143,7 @@ Python changes
   The new Python packaging classes that should be used are
   :ref:`python_flit_core <ref-classes-python_flit_core>`,
   :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>`
-  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.  
+  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.
 
 - The :ref:`setuptools3 <ref-classes-setuptools3>` class ``do_install()`` task now
   installs the ``wheel`` binary archive. In current versions of ``setuptools`` the
-- 
2.44.0.501.g19981daefd7c


