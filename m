Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F003CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 13:21:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.28774.1758460859181346526
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Sep 2025 06:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YJPWdgoy;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so5357775e9.0
        for <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758460857; x=1759065657; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk26aGyXPgVoTZO2ykGv+2QPQ6iAtcHdiB7xOkk/kEc=;
        b=YJPWdgoypfD47UoDOcrQ1kmt8cVa43WGR6cnb8ELkUy6mezxD0YYqcvN0CDaeut+1c
         opaDCowZuJNk7W1Kw4knCp8g0WsWRrDCrNZFxzcG1BsbyY1c0KH5Ea+JtQ2NyLYaUeff
         mT3wrFyYAGVzIPO5iZrglqTqYHQal3eB0jvIA15daTbAeHV19kdnphXPFoOEiThytx8W
         6+Ephhau1GdsKhn59Az1vurom3k0l9tvSgiHFDu1YU1itv2jMbKNvRZYF6fzfIhzwc1W
         rE/ig1lJYOJeV8QdT8S9Rj6lako6PSgvNFkb2x3waYRJMk4wIHZajgo6doheodwug3fR
         3E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758460857; x=1759065657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tk26aGyXPgVoTZO2ykGv+2QPQ6iAtcHdiB7xOkk/kEc=;
        b=CyoNDZucwVFVb2wHtHkErxUVwvnKwQwjbbyzlSm1/U90d1U9unIqZHJXkzuX6E3gEl
         omi+8jYLEfyw5o7N12/Pv9xqKventUK/+ivtekhzm6d2nNp6MDzWkg+g4VLkcawIx03+
         0x5k6O7eFf1HMLs7IyF5kp6ilfFbwW0RR6JtQ1NKzPxHSEQsV90xywgwLasMPWwKbwaw
         Ttln4RIjEzU4e7BywUR79rK0woRy6Uh8OtzNF1ZiSBd0CgjUK+TTxV9xynlBf+QrTH8u
         txIBuHyxSJLbk77yzeruVIAhCXdyKgZt9iYkmgowvhXMrc7HS3M1JxQkVUd3WF19pTMk
         ++Fg==
X-Gm-Message-State: AOJu0YxtQYgRYNPNVUfKND7tZGX4QKYjzZDP1euQLWgfjHinuifCezd5
	OFKAQAIXUDn6p2sAD/PG0yuWPTVihHE0UoDUGq+mRPxUhWDyTYWv3jjpnLZrHw==
X-Gm-Gg: ASbGncvVU/exzupPsk+jqLVw5DD6aLkGB+78mr7GMfVmBbWmLzIkXcE4wFGbxMUMIRO
	UsCJTjjTnkLFTvjQ1Lf/ejAdvpz27W5fa2fGL1l/Uno3shB8xUmMQgNSkqdyAdZ3M9mcHfM90Gs
	/9v6FT7w0ffa+NOJICzQMP8KbduCyUG+TM+2PIzvKXLnq2Abx94zM/+pXqzdqTpR8efFUsP3KtM
	NHbOBQzr+w9wA/X8a0YkZes8pQUFBTwSRWgVcoXf4Nf4phlaxkXzNAhhZTYTYm9Ki9wSZcG+c+9
	ET+DM1XkZQy7R+1DSEDoCDrqbf66r3GexHo1ublcerQmiVXTg78pxejl0xDCjXcpmZtT644hrZH
	nZFF6kSI/qfGATdMwKHw=
X-Google-Smtp-Source: AGHT+IF6jVZoJ9DLLSdhsgQdaAsWJkkbD26k3LBJHwOQkZO1amXk1Gbp3jrkMAQhvcUh5Q56waIpkA==
X-Received: by 2002:a05:600c:3593:b0:45d:f7df:270b with SMTP id 5b1f17b1804b1-467e697a90dmr56744825e9.0.1758460857213;
        Sun, 21 Sep 2025 06:20:57 -0700 (PDT)
Received: from techleef ([102.104.117.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm157558025e9.1.2025.09.21.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:20:56 -0700 (PDT)
From: Talel BELHAJ SALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJ SALEM <bhstalel@gmail.com>
Subject: [PATCH 2/2] dev-manual/building.rst: add note about externalsrc variables absolute paths
Date: Sun, 21 Sep 2025 14:20:33 +0100
Message-ID: <20250921132033.31644-3-bhstalel@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921132033.31644-1-bhstalel@gmail.com>
References: <20250921132033.31644-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7567

Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
---
 documentation/dev-manual/building.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 8d00d908e..de37704ad 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -764,6 +764,11 @@ to point to that directory::
 
    EXTERNALSRC_BUILD:pn-myrecipe = "path-to-your-source-tree"
 
+.. note::
+
+   The values of :term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD`
+   must be absolute paths.
+
 Replicating a Build Offline
 ===========================
 
-- 
2.51.0


