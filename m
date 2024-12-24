Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C45E7718D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 08:33:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.30059.1735029204380266636
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 00:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eVgI7y1i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ADF31BF203;
	Tue, 24 Dec 2024 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735029202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ct8qH0pjDqoYElt9jUUXBaUlw1mah3r8hh3WqkH2kmY=;
	b=eVgI7y1iurjxnAORb4c1NPfAWd8Spa4+Q6TnR6rw98L2KJ81QyrJKEYcdmCMA2zyu7VntL
	gjI/4E1im9epUQUkNaCJL6vNP1XRz1CJspzQYTJWPVdGCiqgrFBCxyH3m6ShD+pQh/a4FQ
	cxjNq54A8U8ZNPBQatVgAw+pnc3NHN2h5tUPxOzcE3k79LstIUttsr/f5p4IkwRJGLBoEA
	jgAaV1+2tS5zwE7OJyoPs9PxEf11H6WhNMTDO/h4VcpVdU1C3ChNDMK/iYWjuYwoefYC2U
	2pYq12HRA/0QM/RV3+jPKt7oFwcRpgICqJ1MpiZ2ZLwTomlrN0Ohtnw1MSqB5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Move devtool doc from extensible to dev manual
Date: Tue, 24 Dec 2024 09:33:01 +0100
Message-Id: <20241224-devtool-dev-manual-v1-0-0cc4fb584018@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1xamcC/23MQQ6DIBCF4asY1iWRQVS8SuMCZLAkKhbRtDHev
 VgX3XQ1+Sd5304WDA4X0mQ7Cbi5xfkpBbtlpHuoqUfqTGoCORQMgFODW/R+OC8d1bSqgWrN6wo
 Es1IjScM5oHWvL3pvrw74XJMdr+ePbrI/8Dz4N40q9BgpVEbaEmsFIm82dvJaLUg7P44uNlmhZ
 V4ILk0urFEdA45Glh2XAkrGrdZYMkhJ2uP4AGLL/6TtAAAA
X-Change-ID: 20241223-devtool-dev-manual-bb387251f9be
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Paul Eggleton <bluelightning@bluelightning.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hzNl9UHXNbJtemONUXeGdknAkUDgrs3Fm+WwXuDBxGc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnanHRvg2tUTwBupGidmhJ84g7fdLyEYWq0NVC2
 V8TMTi5wqWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2px0QAKCRDRgEFAKaOo
 NoHMD/sGumjiNibJfWhYRwTcM78/9UL+ADCarZiDqBEg7z26rTYmKB6AgEmRRu/FlNZx7TA3iGz
 it88caVNZ78gL9qd5YTcQKDO+MUvGRLr33y6cur7nO1Z3Sb3dyHrdX/3tqTBHmY6aCPBd5kI9oJ
 MI6vYYVgdI7wAkgDSXRJc5Wfk3kIVtRpaX416tHG0ABuVlEFtROX/PfAz/19eplc526OCaZnVAC
 78qLrFD1xbe3d5wLsH8+7bgY+HrIpBhwhEo6UymIJM17jjnc3Pe9t7OgaaABGPAj4wICy/xRkpM
 31WrKVFJR9YAzDz6F5D+sR4SxPTTyRxFtpQ0esMQS9vhLQGWc4pX2+JK47CR8dDsim0P3uv1hsd
 qTlTmeKDXGZbwed9tDpt7wUy34RxDubzdRtLYpgiuKYyKoQfBEvBImLq1g93bZLyRAp7WIJIJCo
 ZYgwil0IKgjbuMtjK9xl1F1xmcrWNF1DpDJRFbs3pAs3JuaEiXzthHf0vJpPhT9kTYBuLxZo1NG
 7jzirk2s0LE/PAmOzGsLl6isPC2g2QM3mkcfTApisMwxLGazKfzIaE1UIghybh3hY1WTtxek36X
 Glp+/jNqrV1q4WSQ9ps0039gagaJZ3wVzQA7mLYVJhwtXzqV+IIetPM1v+9yilSSCvXWKwPUKW0
 EKj+evhkXOvh6nw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 08:33:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6016

[ YOCTO #13417 ]

As described in https://bugzilla.yoctoproject.org/show_bug.cgi?id=13417,
the devtool documentation is not really coupled to the extensible SDK,
and so documentation for it could be part of its own manual in the
dev-manual.

The first patch of the series moves the documentation from
sdk-manual/extensible.rst to dev-manual/index.rst. The second patch
removes some reference to the eSDK in the manual which no longer apply
within this new context.

This series depends on:
https://lore.kernel.org/r/20241223-devtool-deploy-target-v1-1-ee00beb47691@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      Move devtool doc from extensible to dev manual
      dev-manual/devtool: remove reference to the extensible SDK

 documentation/dev-manual/devtool.rst               | 954 ++++++++++++++++++++
 .../figures/devtool-add-flow.png}                  | Bin
 .../figures/devtool-modify-flow.png}               | Bin
 .../figures/devtool-upgrade-flow.png}              | Bin
 documentation/dev-manual/index.rst                 |   1 +
 documentation/sdk-manual/extensible.rst            | 959 +--------------------
 6 files changed, 960 insertions(+), 954 deletions(-)
---
base-commit: 4b904539d05fdac123ed96c3952613fbbe612c39
change-id: 20241223-devtool-dev-manual-bb387251f9be
prerequisite-change-id: 20241223-devtool-deploy-target-27d9f6e8a250:v1
prerequisite-patch-id: d3a98c5a92ce8ed4945595df218769028f552057

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


