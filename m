Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C8EC78834
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 12:40:39 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.16981.1726836038094755126
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 05:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M9/IDXkH;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: simon.eu@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a843bef98so244604566b.2
        for <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726836036; x=1727440836; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mepI1EvQ3lYlIWg7ce+7aoKTY3bWi7YPZEUKXVzpLw=;
        b=M9/IDXkHSNeYqMMGIYVTmeH1Q6wRhi0Yr6maoTZEbM1fdhax/luupg7qgdblqdk9yR
         Gcjqw3741YWtJ2Xp07O5FA5gXm3kx0CbPDQ5IFbsXtQhBUJKpRkN4iNEDEab0/kjgnYB
         f6qf6ScCpPT6wANCW8Q4X6Juv2Lx35DzUmmt1EIQ/2ra0IVrTWN089dbHoKTBeT7RMzD
         Pn9vekgM97TGjTP63sL4Kdv/xxDM2lSDiDffaiXGV6jK21L+Zp/BPxhPfndrjS7Pr/4a
         ixwGJSfU63zM1KZU0kwslsU+mrFL91ZSuSG7/PUgkacQ2r9IkXn7hetukTd/o8dqPbOW
         0WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726836036; x=1727440836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mepI1EvQ3lYlIWg7ce+7aoKTY3bWi7YPZEUKXVzpLw=;
        b=ZqjU5pH7dE8+Ggn/oNtIS0BWP1kuXC6bYpNVxR4cjDK8SxLI1CoASbQFkTykwQJ80x
         KyrApP8/qssayDhn0bVSz+qEm1Mr6UP2HgyRpeqbayrn9y10oDrnsjbheO1gyV2rqxpB
         oa0ZhDgmbFgp0bZNm0AbqY+dmFq4jNdzDJT2aq6XMeVkYbVqBZbHqiKzUvq3T3IlL77R
         kaC3xrDMdTZ2MZhGKiSO9f3vog9pJM9CU9ceTLwfUzHksgPf/uNaoKjJ07mf+vIFGQ6V
         GDH2fTTVEXj7FJQ54lHsiJtO7x0E7WtujNHdWX1JGLzNHHQ4KbielgegU0LjAB+b/FL5
         U5fw==
X-Gm-Message-State: AOJu0Yy5a15ZyngpRMv/jT8air7GQmcOBO0jJWr9LoGqXM2Eb45QoVX5
	8nZJue4zO7DrcBz6quLlOMWegv618b24bR+t/Td6Swo9fmgkW1c8
X-Google-Smtp-Source: AGHT+IEvJ9lwpmwbQOLUavkkilLjZgGR+9oSVZIpPwbrK4I4hHMswfngUMHPw80H8v8wJCc1UgvmQw==
X-Received: by 2002:a17:907:f792:b0:a90:c411:24e0 with SMTP id a640c23a62f3a-a90d4ffe8e7mr238495966b.23.1726836036141;
        Fri, 20 Sep 2024 05:40:36 -0700 (PDT)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a90613303b4sm839002566b.213.2024.09.20.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:40:35 -0700 (PDT)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	"Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH 1/1] bitbake: doc: suffix for BBFILE_PRIORITY
Date: Fri, 20 Sep 2024 14:40:20 +0200
Message-ID: <20240920124020.2894006-2-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920124020.2894006-1-simon.eu@gmail.com>
References: <20240920124020.2894006-1-simon.eu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 12:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5362

Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
---
 .../bitbake-user-manual-ref-variables.rst                   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 899e584f91..c203531f51 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -766,6 +766,10 @@ overview of their function and contents.
    :term:`BBFILE_PRIORITY`
       Assigns the priority for recipe files in each layer.
 
+      This variable is used in the ``conf/layer.conf`` file and must be
+      suffixed with a `_` followed by the name of the specific layer (e.g.
+      ``BBFILE_PRIORITY_emenlow``). Colon as separator is not supported.
+
       This variable is useful in situations where the same recipe appears
       in more than one layer. Setting this variable allows you to
       prioritize a layer against other layers that contain the same recipe
@@ -780,7 +784,7 @@ overview of their function and contents.
       higher precedence. For example, the value 6 has a higher precedence
       than the value 5. If not specified, the :term:`BBFILE_PRIORITY` variable
       is set based on layer dependencies (see the :term:`LAYERDEPENDS` variable
-      for more information. The default priority, if unspecified for a
+      for more information). The default priority, if unspecified for a
       layer with no dependencies, is the lowest defined priority + 1 (or 1
       if no priorities are defined).
 
-- 
2.43.0


