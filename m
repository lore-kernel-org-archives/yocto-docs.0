Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ECAD6ED2F
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:30:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.10630.1732195831679586882
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bU30kmwy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4316cce103dso10432895e9.3
        for <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 05:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732195830; x=1732800630; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94Iqo34t19W8INK+44P9w1gcK06IqP+HvhPLSgSDIL8=;
        b=bU30kmwy9Fhp+1rPIGw2BjXjw7W18cbRpIS+RL3eFLngAR2y03G8XwoqOoqswPSTLA
         TDEUch7oE89/AEG/eSZC994/RRVLX18Az//D7hVuDjzwG1MG4dbX2x74Gz99TZcRAD62
         PD8J9He0FTX/b/A6UuhMRgD0IsCtbY86J/v8yt2F7Tic7KybE6VJDMzLLnEG8jPcj5Vm
         QdqdMBpQ7DQmEeqb+uFAdal1G2gh2FoE4hz/uw23n8PYx9+x5/UfY14mkAPHoABXpEIN
         dHsYDakJUfRsps33P8H1KrmlBEfx3rfMgGrb+u+mNi4N1/rvjGTeS3sX13qmqBWCPyOX
         +ZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732195830; x=1732800630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94Iqo34t19W8INK+44P9w1gcK06IqP+HvhPLSgSDIL8=;
        b=NPjknFMcYb2MNTKHRq5gxyZeDvowl2TrPP+zfN07628FvHLnx81avfRJCW38g9HPtD
         ktFkm8AVqXungsSWSuhcfPEnPMzjaHmxmhpSKhcDoC+oyyEBSiTr4w8+c2KY4PEnMCB6
         dhfDOi652rQNSFZc/7Q0c8ZlBJ7cJncPO350O94cQCtmRBJiU+EX58/+rarb1iuit8Lj
         USblJnCUwnGQ3n9N7NQP5EkwvulXZmGnGaJc8QJpIGZotWzVhUqVoAuvBLrUKvh6crXs
         ujlA27wM+wEvruNdTAdFyAqpznlLkLk0Cj1ZYJB6Jqwod+zA1N+pLcv6QvUF8qcRPDxd
         IFIQ==
X-Gm-Message-State: AOJu0Ywx9OUcGiamoY6mHVzOqV58am72+kfdSvEPyZ5/IM69rcHXFz5X
	MZETzb3dJOvz5mZvnLMY23XW0y6k7FhaA3+Iq1OWqdSstabqv0OBZJxvBA==
X-Gm-Gg: ASbGncv5UUei79YiSAfqKrmTMmTlzQ+stwPvG0Ssr6o4HspT4X+m6nBR67xD8dBpH1S
	vayN+u9eziUOx6FaHTZ1pyfmmvp18vqanVI36DNrOCGAH1D6GQ8u8Qt1nVuLZOpMJX2UmJc1A0H
	KJQgiKyt1EMGB5Wft2dh0aFChf+WngStjXHFEpRPSIlAqHdB9eTLdYyO7xv0KBtGJdZLcHWEyCC
	qu4A2FpMSb2s7qx3C70FrkgDSSI/8Q1BXijQ1olD9C95BMxEst8rKjmpaO79ME/84rnW2ToPIaT
	RkmQNt8fDtI=
X-Google-Smtp-Source: AGHT+IGPPvuJTYVui+5o009pJpNM3T9Mm3/Ntaa++miYvoJpQhlzn02wY/urQIniphKIz8Cwwwx4fQ==
X-Received: by 2002:a05:6000:18a3:b0:382:4978:2a93 with SMTP id ffacd0b85a97d-38254ade397mr6691159f8f.12.1732195829699;
        Thu, 21 Nov 2024 05:30:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493e975sm5189415f8f.88.2024.11.21.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:30:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 3/3] migration-guides: document ZSTD_COMPRESSION_LEVEL change
Date: Thu, 21 Nov 2024 14:30:25 +0100
Message-Id: <20241121133025.1064006-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121133025.1064006-1-alex@linutronix.de>
References: <20241121133025.1064006-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5788

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/migration-guides/migration-5.2.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 73d52460f..7b35e7721 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -57,3 +57,6 @@ The following classes have been removed in this release:
 
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
+
+-  :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead of a dash-prefixed
+   command-line option (e.g. it should be set to ``3`` rather than ``-3``).
-- 
2.39.5


