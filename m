Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF78FE674A0
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79090.1766406488941637828
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ud+TntNb;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D8B3C1AE05;
	Mon, 22 Dec 2025 12:27:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44508606C1;
	Mon, 22 Dec 2025 12:28:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9E8C10AB0263;
	Mon, 22 Dec 2025 13:28:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DER6VYnmU31m2vrIFVLAhqj2Lrpkk6IHcqWz8FaFL/U=;
	b=ud+TntNbMdFudomt41uWbigVubES/mkzlPY1efFUwtSWRUNjrd2ml7pjjMVDszfOlvzKJM
	SXXWsr+bf38vccK87m6m6PTkxVSqsXw6AUXN3e7OjdopKAbKMsY/+6Jucdi91bBji6u3Ls
	FayIjzaoIFUjNsHrSqmp04qxUqAMzCNqL2l5r4Oy0xCQGEcE2d5y4lvdHveV6+T1AzxZn8
	aKAb7xS9xe2dDOTIcNZ4/PYFNqPMunqPSZMoTD0w1Xjwox3URAx2noq1/jWDUV8zTKnWzo
	VeZ5nsahVFZ60wE+7TqEkbVOIPoUUCsuZ0y1b7RipbOF1s0Ft2gURoUyuWym+Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/8] Parallel docs build improvements
Date: Mon, 22 Dec 2025 13:27:46 +0100
Message-Id: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEI5SWkC/yXMQQ6CMBBG4auQWdOEFjTCVQiLWn90WBQyU4yGc
 HcLLr/FexsphKHUFRsJ3qw8xwxbFhRePj5h+JFNrnIX6+zNhDmGVQQxGfUj0teg9ta7um2qa0O
 5WwQjf85nP/yt631CSMeI9v0HywaIMnUAAAA=
X-Change-ID: 20251218-concurrent-safety-e3a1a2394064
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OkNC1/jwKvCt8mm43JfdS0dK8aCfFxkHugerIPXjttY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlRf11E/8H5cEDm9u9Kg0LOkBNHmwaFy97zk
 QoOQzksZWqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UQAKCRDRgEFAKaOo
 Nq3hD/9iK9odlh9KDrQRk1MPN65d96MCsZARUPTxgJhyeHUNRWHnM6WH8GNd5GxRqAR0vTQ0wch
 j57kFm1HfEVBAWwPjofmb4PodLKUdGCafZTPD3sOFIpg+RWdTdLQecE6dXLzg7KlXO8VGOV4fwg
 yiNOY66spMmiqW+EjokkakPlW82Cto3GFoOy1TKxQ60sKzfSZEvYlhm1f8ixqWl+SqPnYQVQIf4
 Br7uKMVn0scxJitRLlr6YvfzUUA13jG9P1m5jFuLQtqYz/iv3LmIExs3a9CO86UaAmC5mI0hQlK
 57X1Ups9v9j4ZBRXekpFg70zQ3t1jzncIqyEw7wMDC6jVfQxcyu0b038XcbLJBhVZ3q/bJcZbo4
 kpIpsiBABrv9AghxQ6rPMj6PvAQAQsVogX8xfG7qZXeetEfXomYKHJWuQT1gaEpHOgjzP0zVyqT
 4W43DWRqvguHzs1V1WyiF/Ps8ZQAOzzYmKe4QANLFnRaImVmb9khamfj5YZRQJ8fIg7HSqOMoUh
 R0TgAcNBpEIwFUnQ2TBgMceWMYz3jVx3g3uuKQiLQ/2fDHlEF3/JtmleorjfX9pxecRy3RORlRf
 Ujg/eOTiH/CO9aSlWoXkaD3GDEAiAlQaKi4+bec4V3xBhCIzVYQ64TuczVi5akOEPSd7HKMEbqV
 g3dFjgG0YWmPXmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8309

The aim of this series is to take the work of Quentin[1] and with
additional commit that improve the concurrent safety of the docs build,
and some general improvements to the build-docs-container script.

This allows building the docs on all supported distros with this bash
snippet:

```
declare -a distros=( $(./documentation/tools/build-docs-container supported_distros) )

for distro in "${distros[@]}"; do
  ./documentation/tools/build-docs-container $distro "$target" >/tmp/docs-build-"$distro".log 2>&1 &
done

wait
```

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (6):
      tools/build-docs-container: build in separate directory for each distro
      tools/build-docs-container: create symlink to latest build output
      Makefile: wrap set_versions.py with flock
      tools/build-docs-container: allow running non-interactively
      tools/build-docs-container: allow passing extra args to $OCI run
      tools/build-docs-container: make it possible to print the distro list

Quentin Schulz (2):
      tools/build-docs-container: guarantee the image to run matches the just-built image
      Makefile: allow to specify build directory

 documentation/.gitignore                 |  1 +
 documentation/Makefile                   | 10 ++--
 documentation/tools/build-docs-container | 90 +++++++++++++++++++++++---------
 3 files changed, 71 insertions(+), 30 deletions(-)
---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20251218-concurrent-safety-e3a1a2394064


