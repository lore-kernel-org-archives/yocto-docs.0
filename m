Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E59C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:51:38 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.15429.1738770693119129122
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 07:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=Pxnl5idD;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tfhgZ-00006N-4x; Wed, 05 Feb 2025 10:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=MrMbQ4NVS7upRwjqEzRNgZMfd5QaU4Pc9AU9OxLHzX0=; b=Pxnl5idDCzTDjX
	oOzVtTlH0M1L1mA6QfaJ7bDyIMkiqmZ3cA4GBTPwHAJjKXXnSq+s22BQolqfIJHSHZdkdaj3KyUOu
	59EOSYniAcmqSLvgqunqgtPw1YfjoZf62e6PoOLUwJk3MSxHqG1NyIXOu9sroj1Xkp8xmG2ob6e6P
	LGehW0Z/xdn+Bv8zlmhvvx58+OkWak1CjGHdGgROwPDYmDoFoZ3jh6EJcOE/5DlX6nus+t11afvDr
	dyvhHW4w90OrT6SUjE28kc9NbBI4+S0Js9LBZ0oaSiftBeZznMG1J8wjQYRv24FmfUFvu7P+V5YiP
	vvIv6SiqQroOpybdnuIw==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v2 0/2] debugging: Document how to get backtraces on target
Date: Wed,  5 Feb 2025 16:49:55 +0100
Message-ID: <20250205154957.24148-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 15:51:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6252

Hello,

That series is introducing a PACKAGE_KEEP_SECTIONS variable that can be used
to keep some specific ELF sections when stripping packages.

It is then building upon that to present how to get human-readable backtraces
on target, possibly also relying on the minidebuginfo mechanism.

Thanks,

Mathieu

v1: https://lists.yoctoproject.org/g/docs/message/6243
core commit: https://lists.openembedded.org/g/openembedded-core/message/210762

Mathieu Othacehe (2):
  profile-manual: Document the PACKAGE_KEEP_SECTIONS variable.
  dev-manual/debugging: Add a "Backtraces or target" section

 documentation/dev-manual/debugging.rst | 54 ++++++++++++++++++++++++++
 documentation/profile-manual/intro.rst |  6 +++
 documentation/ref-manual/variables.rst | 12 ++++++
 3 files changed, 72 insertions(+)

-- 
2.47.1


