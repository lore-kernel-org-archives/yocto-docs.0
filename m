Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9E3CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:38:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22598.1764261481524533921
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 08:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0xKBvqJF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 741D41A1DC3
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:37:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AD1560722
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:37:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C626102F2ABC;
	Thu, 27 Nov 2025 17:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764261478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rDu+V1vYEx3/a08No3iwY9M9+kuFk2GqM12w4pc+4Eg=;
	b=0xKBvqJFLjV9PxfxyiNWAQr3gMcVcwOkWq1TviAhZThfV20fHibRPrXkcghxOeorDzjiN/
	BidCrlhQMPjceih5Ia3hF9Qb3Fm90Bv8ZL6NFR/mXgzOB/iMG7dKBRtM/LVH1R4bfwrrAp
	JLIaNNVDA5pYJZYywEVIUzy6tn4dRiYbL6gea1SU4EPi/DkvK5ALZ8e5QH3SfGApcgj0FX
	3mjQ1hdjwAvXzHO/PWcJzOPQlheNzPSmIV4ZlT1IQjkMnZpe7EPZiXEsvFmHVPun77b2E2
	EJAqJvbO+4EW0Dq6g+yFQHtKEAQEUZN6SuuvPLCeFtZr45BqycWPFg1WbJOOew==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] bitbake-setup updates
Date: Thu, 27 Nov 2025 17:37:44 +0100
Message-Id: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFl+KGkC/yXMSwoCMRBF0a00NbYgCbEFtyIO8nlqKbQhlYjQ9
 N6NOjyDe1dSVIHScVqp4iUqz2XA7iZKt7BcwZKHyRm3t9YdOEqL4QFWtF64lxwalKMx8+yz8z5
 5Gm2puMj79z2d/9Ye70jtO6Nt+wCQWel6eQAAAA==
X-Change-ID: 20251127-bitbake-setup-updates-b00664d244c4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rhadjoo68xUtXNL1zmW1w8w7zOiaHOzZFEB4g4AaXdo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKH5lGujywSO1AjJcIrYQ+2omVsTNxvzITiT0i
 bSGVC/UrGqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSh+ZQAKCRDRgEFAKaOo
 NjozD/sHwdGD+gcbUXxOPnzaV6Y/cjVYfKH5qT7ZG/lXyd9OcJ7+Wg5I/YpKVzFDKX6QjOO0Eah
 QqV5zZcnNLUnbHcsUupUvRWWPjkhhEy7vHyOY6OLm1Dq6/JbOxbP3mS7eEtW1/+orMv1kUDT5aB
 nX5lSq6IXvmzLjRyEtuzkePpP57WxkUjlLif3/5YjPKL36AduIu11O/gXeYWHvVdOs+7TSUANx/
 CmIRtTiz9/KvxMsUqqjz4CA4M+aM26imbULlctskmKB8ZcWhFMZpocK+qgYugrSHlPnUGHgUBZI
 aiIVO1aJHmumWn/16EJPyo3f7toBUk8Zi7f8sYRgfSBlc3f8sd6QKU/28vwAotHu8n2YThszHoF
 CRGOCoy7MzuW/gnlPEf3KcCPeQLu6FJTBTfH01i1tvajC6L7jNYNnf7YbBRjyFxm9jCZMD0CePE
 xd8UrN2+f5YhJbL3kWFntLQHpjIHwKMj9qUZ7QVEeW2GARL54Jfw5BJIFPsj3CjaGQ2UnHkkJ5V
 6ZH9+Z5la3BIMRUDCdFEpeRTP+ol20FlL+f0ouVvZ7bbQTceRuh34FXhtwFPW+px7JlLMPEIkDW
 4274whvRTuoiYnPd9SOZWDRLlziUTO0zsXSnGjLYoFmW73pRJHRAEwQSk5xzPzxuvcWwk++LeN3
 s7XAjk98XbuUsXA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8153

Add a commit to be able to use the release series in a numerical format,
and use that number in what's shown in the output of bitbake-setup init.

Switch the shell code-blocks to console code-blocks.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      poky.yaml.in: add DISTRO_RELEASE_SERIES
      brief-yoctoprojectqs/index.rst: update available bitbake-setup configurations
      brief-yoctoprojectqs/index.rst: switch shell block to to console lexer

 documentation/brief-yoctoprojectqs/index.rst | 41 +++++++++++++++-------------
 documentation/poky.yaml.in                   |  2 ++
 documentation/set_versions.py                |  1 +
 3 files changed, 25 insertions(+), 19 deletions(-)
---
base-commit: 79cd33b06e87c04e4f873a5afd9d53714bc5047f
change-id: 20251127-bitbake-setup-updates-b00664d244c4


