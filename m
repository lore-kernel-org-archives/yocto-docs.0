Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDE1C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:31:30 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.8377.1709105484486021206
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 23:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h87Qwnet;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: geoffhp@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so4240889b3a.1
        for <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 23:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709105484; x=1709710284; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPC7ZLzIKCBf/4ENkEqdoxlIZGzbnUwRMIXcoDliekw=;
        b=h87QwnetbiWTg5geCuOgRe/wpU7E2OMg1nuWN4Zh4OW5hSprvMSIy4825mDBCiTImz
         8obDEiM37WQSLgmiA9UBOJ8ZDRL7C6Pe7Lt/fYi3XIIWefHEDTt8bjWHazDfSnzRHxQq
         leDMSNhhFhiy+Fgy0MTgnnjwGbEKFdgP1xQestLyxC8Kki+K4K96tw0PeVqT27u1Usco
         WU6W1xNBJyvhBWYFpdtD61khZowdHLehpT6VPUiiHlT/RCwEO6yNVPCGXcSH6yfWK9Cw
         lH5P9wcBuL1XS79894vwLZYY/xPSOu8kvU4Z13kByV151+qAWYwpxZXlP47O9yJ3mdUD
         7FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709105484; x=1709710284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPC7ZLzIKCBf/4ENkEqdoxlIZGzbnUwRMIXcoDliekw=;
        b=qSa9l0/YVmMi+tg4rmdjv0/bq0GM1fzt7GX4Rj3Tm+NFX+9KIjSwg9pGVr13lzqc4+
         f+cH8ipO5l+L2ntTXQkEwWjlQw81tt+ql16Jo+5CnnaYFJH5n3r5l8VgdItQSZemAWWh
         C8io8X+Tz2hABDPkK9dJctYf9rPkfqD7L8omEOLEoF8UJL6ZkNJWkhTXJVTz5Vj1alqt
         gDgSZxw5PomxkOum3Xj7KPQM8rSYPcT0fyrKgJiNu45mIzXbzdRLNrg0yPdZUJBpjxjn
         2iXAlnlouqdE11DgrILM62LLOn9275cKfrIk53cv/SfPMiqcua8Uja4s5y9t7CcFWgUQ
         TOvA==
X-Gm-Message-State: AOJu0Yw0r1D6nHvNmArxA/6FyDfm5GlQVlj7EaQUMipKdUeIq0yS7r2N
	wzk6a6/4PDcyXb/O2wfDRgLxuTGNxC7cFPptoXJfvBJnvyNdDD7TxZCGQ/MO
X-Google-Smtp-Source: AGHT+IGcqehkryBZPXaFRQ/8vaqxxFxc5fZtl6dAThIPpkip9kjUhaIaolqUIbavrBMoukAY3mcbEQ==
X-Received: by 2002:aa7:9891:0:b0:6e4:6484:1a40 with SMTP id r17-20020aa79891000000b006e464841a40mr10802945pfl.33.1709105483585;
        Tue, 27 Feb 2024 23:31:23 -0800 (PST)
Received: from spock.lan (107-185-048-203.res.spectrum.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id fn23-20020a056a002fd700b006e4f644dafbsm7006048pfb.129.2024.02.27.23.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 23:31:23 -0800 (PST)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: docs@lists.yoctoproject.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] ref-manual: variables.rst: adding multiple groups in GROUPADD_PARAM
Date: Tue, 27 Feb 2024 23:24:55 -0800
Message-Id: <20240228072455.1452176-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Feb 2024 07:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4910

From: Geoff Parker <geoffrey.parker@arthrex.com>

Add missing documentation on how to add multiple groups with a single
GROUPADD_PARAM:${PN}

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a0187a6d47..fdebcc9ba4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3234,6 +3234,14 @@ system and gives an overview of their function and contents.
 
          GROUPADD_PARAM:${PN} = "-r netdev"
 
+      More than one group can be added by separating each set of different
+      groups' parameters with a semicolon.
+
+      Here is an example adding multiple groups from the ``useradd-example.bb``
+      file in the ``meta-skeleton`` layer::
+
+         GROUPADD_PARAM:${PN} = "-g 880 group1; -g 890 group2"
+
       For information on the standard Linux shell command
       ``groupadd``, see https://linux.die.net/man/8/groupadd.
 
-- 
2.30.2


