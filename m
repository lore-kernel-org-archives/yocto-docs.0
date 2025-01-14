Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD5EC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 20:08:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.4051.1736885323108203142
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 12:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GpWCmhVz;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e3621518so2981984f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 12:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736885321; x=1737490121; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h69HiAb1DPNqbA11KfY9tg6cMYrctp7TvS57zryS2Qw=;
        b=GpWCmhVz019EX73p3xzKOlPB7ydDoD/mPlsoVugS0QrNkqPzsvJgCT560KbaKBEXsj
         Jmk+POsF5lOYH5S/+28KC2GjAig8XGjtYQB+vh/KebqQV9BtK/PL2ASI42qzOgz02xqZ
         15C20WZ47HKuVej4E3sDH1n+rGCWehCb7OmdZuMJZPmE/V+k1F7LV59qtt3kV7wNqhLF
         mV30coPsy920u5Ul/FjrMbg0tY3i5dPf7sr8o30Z+o3gNvcUfQrizIK8RGozwKpl/Us9
         kIh0PXgWa4qA5AwpR9VrlDgk6QCc9Tng7qPLCzD6uXJcJn6wk7o2W94yYURRvOKBfdJV
         jXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885321; x=1737490121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h69HiAb1DPNqbA11KfY9tg6cMYrctp7TvS57zryS2Qw=;
        b=jaHZUcUSSJaOfYpqFB8IGLAao4+L9+6xN/KyLOYKOpirzdItdc/xZtI83BGcZRFXs4
         tIr1GeSrqYDkuDZ7ljl0JKjb4QDSwebW3tOAehwD9ajDLQ5R2rJ9sNUTEha1L11gOAzy
         KoHkLF8dxoO+XYMXY47aOwWRlmo1aJi0gRaYBaBP1aYhtRVX1TFtQQy3M5uruEz19WmP
         JY0wgpgNQ37Kga2JIGQeCKk6dy5hgRwpqf/F87HlPtWksemmoebGkIZx0xbY/St5OfJa
         8WnV4+nWgILG7A04b9z0Z208SyONk85oZxzDD0wze7EI/CHv8wts96bw7+3UASCqBqkv
         U3Sg==
X-Gm-Message-State: AOJu0YzIbDW5+ksVivrC7tf7Ah2Vf48fvI2LN5WjQ2mrj12c1N6MekIV
	i8avEv7w8Y87u+jYfJ9v0vNBiwtn2nNjr9K8wJMheQLUDQ51G/GGB0+HiqoM
X-Gm-Gg: ASbGnctcqbeTsEiktia2x+LRCs2H3XJ9f4R+61QkaTU8+MUJy5y5dVIwSD9qoa3q3y3
	M4LdG724C5yJPFAkTbA8smfM8f3anRBZQm+3E6EG6WyeBCVpwkkD7FBygUp5c0rxH+qf+UP9YRH
	Y7llZKUc0wAK74Hb6h7j0khiGhzN+2qsXI5k4SW0D+2CqqmM+huIsnsMBwaK+qMLyonQr8WqpYB
	ORwJS0vvvaHKqwq4kiTj68U5902wYF9I4fwzgafvchWyvmeNoniOx56wNRPaVJdPaLaKGgnttZH
	ugA=
X-Google-Smtp-Source: AGHT+IHHtJ3+H+vjkqb+fV+EgM4d239MZLGo5an2a/kJ+jlAW7QQ+IrwN7SoLQ8DDzSkn2sXXU2uQQ==
X-Received: by 2002:a5d:6da6:0:b0:385:f573:1f78 with SMTP id ffacd0b85a97d-38a8730abc6mr21478579f8f.24.1736885321236;
        Tue, 14 Jan 2025 12:08:41 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c76esm15463787f8f.47.2025.01.14.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:08:40 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 3/4] sdk-manual: extensible.rst: remove confusing post-install-logging
Date: Tue, 14 Jan 2025 21:07:13 +0100
Message-ID: <20250114200734.4191354-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 20:08:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6109

From: Adrian Freihofer <adrian.freihofer@gmail.com>

This is a fix for 22dc5b3be3b1fbdb9447999b71f79db055271826, which has
completely replaced debug-tweaks. But in the context of devtool ide-sdk
and the comment in the example, the post-install-logging-image feature
doesn't really make much sense. Therefore, remove it.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 3733997fac4..1cb1bb47c2c 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -658,7 +658,6 @@ The extensible SDK supports two different development modes.
          allow-empty-password \
          allow-root-login \
          empty-root-password \
-         post-install-logging \
       "
 
       # Remote debugging needs gdbserver on the target device
-- 
2.47.1


