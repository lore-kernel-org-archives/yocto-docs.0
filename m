Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9E4C7EE30
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:43:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.18667.1750682586098172440
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 05:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hz0w3SNu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453643020bdso24401075e9.1
        for <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 05:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682584; x=1751287384; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQYoPjM7qpFPDzfFL1pg/tW5E+XFyfLskZc4eKlwwMU=;
        b=hz0w3SNu+Gz6U+G2jeABknJTACWeBvxBkyd8E2t7TYWya7u6kBl5+kE4wePSaZLJaK
         BvymQ+oBi01Boxmz9OqImsFgovslPVkjR8mrhneKemQxZwlYgeVAbZBw/F0QOiss6ECy
         SN7ALnEwIJMfiBG+HD9xKFz/MgM+/7IC9nM5sX8ddIL1+RxmNwkqLQlRp1stHR6sFM9e
         cD9jHM8IfqMtZQnVJGLL40z8JD4pupHWXY04P2qHIw2+T0LEIIhbNfF2bTPJZDrzIddh
         MyhqOeDvA4GVbymTJrjlBeuDPerz3XsjmrfnbR50gVCA8w0B7MDw4LdOgsz79zi97hLI
         IQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682584; x=1751287384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQYoPjM7qpFPDzfFL1pg/tW5E+XFyfLskZc4eKlwwMU=;
        b=bvYf+eaa/j/Q8Aq+MqMVb7gExWC7x+u80a/8/95JdGwzrPsXjfk6SJL/h7oIrOjG4t
         Tp8PpJikQvdDX5TDI3GVNrtA1oQyMuAk3FjPhYj2si6tgSrPgwBc9RC8lwSa/8xS6J+v
         EHZgth+uZPBCiMfplN5DY+zrhb263BNPlS74LW/DJjx6Xum2hSP2hvzIoP+ma3AEHPoE
         Z/OkMO2W4lMrjm2xvRiIbZz3+R/uWWcWmTzisNN42i2LP9ffvzgc6K8/h43VmH/7jFpV
         IbOTjDksqDnNrOgvlmEb/QKjEmQgaf7AT87gmJ+WTnl4LyOEOzybIafWZgiUghahqQmV
         5jlw==
X-Gm-Message-State: AOJu0Yz9ctZMnMfvXHp7l1k5gSxZlfStKzjgK2Hum4seN5dVZQxDaRzY
	37CRv/4F+GzQ1NJV2OcWUgG+/lq9EFoUZ5WYnyTcVXfCel1+XqRgw+auxJ48gA==
X-Gm-Gg: ASbGnctBZRcnUTE/oCSa91uSKQPQ3lELZewqJ+37lNMjlwij75IQhhr3hl1/Byam0/8
	V6nBTyLsdHW6Bgs3Kv+z6AfA+hHy7gtFC+5UM2MSbdeokU4w+fC6ogECHqiZmpWLtLwxvQ0TtDZ
	6DUyfEVQwYM3beqSK33azEgklpZogduV1q1XZStYmRKBxR5TcJsfLdpA1UAGY9UX5HCNM3F85qG
	zu3ON95EJvcNrLRaExqRTzVy/MNblfKV7RXu5GUNBOIM5Mbp08CRclz3SonGVx/M/nRdZhzAUJ1
	LK+6P1wTCf8AfST0qKuUhsVjqYHobNFRtvWtLeGg10hROmKc7csro900LwsBYZcrc1BG2qLYCMC
	wn2X72MCGk4v1n+4IJNbnyJ1jjrYuHarVZQ==
X-Google-Smtp-Source: AGHT+IFjSBMiD74lCDw6KY/laiMniLuBkVdr1YexqkPFLzM4rlvYJiKvl0pG7f5oXB/J7tO01UUSsg==
X-Received: by 2002:a05:6000:288f:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3a6d1322c16mr9399433f8f.32.1750682584252;
        Mon, 23 Jun 2025 05:43:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b00sm9157170f8f.87.2025.06.23.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:43:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] ref-manual: drop a sentence about a 'legacy way' to specify UNPACKDIR
Date: Mon, 23 Jun 2025 14:42:53 +0200
Message-Id: <20250623124257.1544615-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623124257.1544615-1-alex.kanavin@gmail.com>
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 12:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7146

From: Alexander Kanavin <alex@linutronix.de>

This wasn't specific, and is obsolete: UNPACKDIR should not be
set by recipes at all, except in very special circumstances
(e.g. gcc/clang unpacking into work-shared).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/tasks.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index d85d1151f0c..e379c424d87 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -412,8 +412,7 @@ them. You can learn more by looking at the
 -------------
 
 Unpacks the source code into a working directory pointed to by
-``${``\ :term:`UNPACKDIR`\ ``}``. A legacy way to specify
-this directory is through the :term:`S` and :term:`WORKDIR` variables.
+``${``\ :term:`UNPACKDIR`\ ``}``.
 For more information on how source files are unpacked, see the
 ":ref:`overview-manual/concepts:source fetching`"
 section in the Yocto Project Overview and Concepts Manual.
-- 
2.39.5


