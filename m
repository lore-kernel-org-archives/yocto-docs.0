Return-Path: <aurelien@hackers.camp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E894D39436
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:42:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17378.1775140945066494312
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 07:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: aurelien.desbrieres@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836fc075d2so1181365e9.0
        for <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 07:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775140943; x=1775745743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZnLkn2V/gQGALgGjQbEJ/m95PVfUufoRWjM4PrzMi8=;
        b=IxeMfWfEsxdbilDSQ64Qc2G3MAxeYmU4Lpb5fLtmFVrifnLGolp/fGgvfhruNW9HCq
         LXKaA0zBe666ypp/sMwhW4O+Cj2Kovm3urxj1YfBlI/XISXzMHeI9S4aCM8951hj5svw
         rsJYVfWfR8/A7nuKlm8cHSxJPKtYQtuQGd1SprPKqOTxvgaJD+lGJQ/UxTO9JVrTxwmh
         xtcddubhldJuWew5Xvrmm3b5ofUoG+s+J9iMs3w1xQyRLI2I8F8NYqn7dObVEJZ9A5wx
         2Rwe+A88H30oRQGntkZuK5qR7orTQVkVkDVScBtMAS9nLWpsDFdAjjlo7zLaVs79PsJj
         lfow==
X-Gm-Message-State: AOJu0YzcXAqM0YUlLBdUVhOaqB4KSSIR2pSu3nvEfm+qQ/UUR3jFkxpd
	RXTBNbGDSl68J1fnPSRIGJXoLXIjGS6Go/TKBcNIf1eTHQhr0YGfUk0+U/hlSwcx
X-Gm-Gg: ATEYQzxAdNXqBFnE0vsvTY4v3YgwmyI4zghX5Paxo7x6b8kYu85CQ3pf0V99bS2XTfm
	1C9U5lkf8qcEvEjTvI4Xd0nNHvq6UdMlbXCbsrswUtBWyQqSqsl76YmKUOFJfuwmCNCgoOPj0TD
	KlHrD5HnBFpMYvy9VAuVZIGzsfq6RoqeleMQZ15CocbnJAwzTxHaUIjDpYNxuvVgeCXM2zIwNlC
	qPwYMiuKi+BOTFTZshj8vBa/5rFCKP8PUAdf83pqUktUjfr4e+J8FiOgZjzFKi23FQmYDbZWINY
	ljqVRgN1UjYKw5tCPbUUhPmWp3WwCAFsDxXLysIkz0MLgg13d7rMTOaF6YnvxT9K9sI8+YitG3q
	aSDBuMXs7Je7Li+7um+bxyYEjmcoFOHL790xMARecKPmOUZj4l0mgsSzlhBbOVuxz4G1JTa5SCI
	pHxIOaJiNTpK0s3LiaBeIvjA3DNwdodmsvPdEdGmRhjdVMWgvk+g84QOFt4KC/yMWE
X-Received: by 2002:a05:600c:3550:b0:487:1826:e138 with SMTP id 5b1f17b1804b1-488835633d9mr80656655e9.1.1775140942979;
        Thu, 02 Apr 2026 07:42:22 -0700 (PDT)
Received: from device-64.home ([2a01:cb1c:784:2f00:604:f02e:5d85:348b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm8065653f8f.37.2026.04.02.07.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:42:22 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: docs@lists.yoctoproject.org
Cc: Aurelien DESBRIERES <aurelien@hackers.camp>
Subject: [PATCH 0/1] ref-manual: add Gentoo package list for build host setup
Date: Thu,  2 Apr 2026 18:42:17 +0200
Message-ID: <20260402164218.210974-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 14:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9170

The documentation currently has no Gentoo section under 'Required
Packages for the Build Host'. Third-party guides commonly reference
incorrect Gentoo package atoms (dev-util/chrpath, app-text/chrpath,
dev-util/cpio) which do not exist in the Portage tree, causing
confusion for Gentoo users trying to set up a Yocto build host.

This patch adds a Gentoo-specific section with verified package atoms
and notes on the common naming mistakes, along with a reminder about
Python version compatibility for Scarthgap/Nanbield.

Verified on Gentoo Linux (OpenRC, amd64) against the Portage tree
as of April 2026.

Aurelien DESBRIERES (1):
  ref-manual: system-requirements: add Gentoo package list

 .../ref-manual/system-requirements.rst        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

-- 
2.52.0


