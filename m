Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D84D6ED19
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:32:43 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9603.1732192354189022170
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 04:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iYiES0Kw;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38241435528so541198f8f.2
        for <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732192352; x=1732797152; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/1Lgxf2BYvCj1VUOhrvY+liZM6E8743J3WIGO7tuPs=;
        b=iYiES0KwSdDlThtdrIF71OZVMQVM41zCinc3/0hmvXCn7gxT6v+8Fq+saLLU4nnZAT
         PNWUzTaBdb/s5RSfCAqEmXhiR9Tf07SN6pS8RJixkfBptnYWXLEKM8yHlf1gvTo3rqUB
         NmHRprMpXQirYVSf6KGO0WVCnSegg0XT0KE7PVKSnZSMsFLVomf75/JXWpRzu7a7tkEa
         RoejkRcqhWFkTd6cp8IPSlttvbWeg9x9UMNBNPEyFGAoXkzmEnua19wLO5FkAmYnbnw3
         fo1nyH3KiWw00I/TvySf8GP8gBxZgZphCVQMndgq2NBQbRbtKQTdJYPq7rxXdqNvX9kv
         4tUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732192352; x=1732797152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/1Lgxf2BYvCj1VUOhrvY+liZM6E8743J3WIGO7tuPs=;
        b=eJV29nf9YYeiuaklvy+jFACB8MssgAsiwXZbLqqZtOVd/s0Lo04+otRRYqn41pKEKi
         ThaC26xmzlgNwpvppRGoYzSmBs0rbPefSuBED8RQu5G6s6MuwWCqGqRz7H1tQART+Zlp
         7lmwfXPwE4yLZglbGjyQzbQ9adumwzRyl/8AMA2GMsWQtrzeQtJWkFY+YPU++yrz2NM5
         eLoY5EaOn7PeMRhdZaJEHZXTpmafTHGTfNbCsNtPep8Nbvpu2RPJqkXagZIpvfpL72y/
         ZEPXELdw2Ei3uhpJhKPCHxsi1RmbNdw/Vp7dtV1KqQzwtZrBLtCY4CmtNyMDwRYTwNtE
         v1LA==
X-Gm-Message-State: AOJu0Yy2d+ege+fEkktzbJTbxEf3Xk4oRSt1h0nPGyiAniz8FLo8U3uJ
	8WVLuCRURtrugXVUrgUZBrmdicwfO5FMIBtyTqMk4TR+8x+ASoylvbpTbQ==
X-Google-Smtp-Source: AGHT+IGR+pyJF4+VXB43s/5Ow+yLbvIesbsKjY6OeQk62glc2PJyrtmLtDVTgyrf75KLKBAneT8eBA==
X-Received: by 2002:a05:6000:418a:b0:382:4aa0:e728 with SMTP id ffacd0b85a97d-38254ade742mr4203823f8f.1.1732192352104;
        Thu, 21 Nov 2024 04:32:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493eee6sm4869213f8f.101.2024.11.21.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 04:32:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] migration-guides: document ZSTD_COMPRESSION_LEVEL change
Date: Thu, 21 Nov 2024 13:32:27 +0100
Message-Id: <20241121123227.681233-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121123227.681233-1-alex@linutronix.de>
References: <20241121123227.681233-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 12:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5782

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/migration-guides/migration-5.2.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 73d52460f..99330a0b9 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -57,3 +57,6 @@ The following classes have been removed in this release:
 
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
+
+- :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead of a dash-prefixed 
+command-line option (e.g. it should be set to ``3`` rather than ``-3``). 
-- 
2.39.5


