Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78699C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 09:01:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.38936.1737536462791739671
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 01:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eY57ioMQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E6341BF209;
	Wed, 22 Jan 2025 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737536460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ5f7xcaIcb8I9GOZOxUksl2o/nsIYv2N+4r3zJcHNg=;
	b=eY57ioMQuIHKfyN4wQg4iDShbF3VHY/OW1fKUQdKBvBd4cL/yha3gsw4tkJmvzowYtIO9k
	a+SxspQ6+HvDxrBurUEN6V/Wq1Tf+ZdOtPjUXGNf8FuDAfodn1vq5g835WBEHm0CPfgsAs
	JPwtOB9Vx9IOwD5731zubGfcdDyPke2LTa1lZKkICEKadDklNsatnEtDojFyZLXwiAGSHR
	P2ILWtFONzP6NSfYwhWfheYzRbAHfyw5zrnc0yDFOy5t9gH0xoU//qKs4zgxYVci1xIajQ
	bOsARw1s8VXoVIZisEJTM85RqZXMNes8Noa4PVwM25nTb7NFvH2x4CLPILZmeA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH v4 0/4] Cover systemd.bbclass and devtool ide-sdk changes
Date: Wed, 22 Jan 2025 10:00:06 +0100
Message-ID: <173753638979.2772552.9299853565325085997.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0.dirty
In-Reply-To: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jan 2025 09:01:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6155


On Tue, 14 Jan 2025 21:07:10 +0100, Adrian Freihofer wrote:
> Changes of v4 in comparison to v3:
> - Suggestions from https://lists.yoctoproject.org/g/docs/message/6091
> - Release notes: cover devtool modify --debug-build
> 
> Adrian Freihofer (4):
>   migration-guides: systemd.bbclass do not add Also services for 5.2
>   sdk-manual: extensible.rst: update devtool ide-sdk
>   sdk-manual: extensible.rst: remove confusing post-install-logging
>   release-notes-5.2: cover devtool modify --debug-build
> 
> [...]

Applied, thanks!

[1/4] migration-guides: systemd.bbclass do not add Also services for 5.2
      commit: 71acf03e02d1e21a4dbe081e75d1e4383ac2f3ac
[2/4] sdk-manual: extensible.rst: update devtool ide-sdk
      commit: e2b6a4c6c633e79d0e4975ba2e1a27a8c1b8c1c5
[3/4] sdk-manual: extensible.rst: remove confusing post-install-logging
      commit: 148191460627241cbd0c42583140f114c78cc94c
[4/4] release-notes-5.2: cover devtool modify --debug-build
      commit: ef5f35e6da2dcdfad6290ab4d5bfa3010a600caf

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

