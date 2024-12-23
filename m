Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9A1E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:03:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.10377.1734944617808063089
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Dec 2024 01:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qzgdgye+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F70FFF809;
	Mon, 23 Dec 2024 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734944615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbHeLv/H1J1PbRiYWW9c84QIXhBQE8cDCPcBJo8hTwg=;
	b=Qzgdgye+3WxxbrCMp+kBbRYLz5/ZQGIJD12asMvtN8Qymq079ry7gvwxrpMoVRRfjl2Yf3
	HdWu68wPSWiy5pYt+rFL6vCvaHXietcVHydDPhyyc/ohAEZfKUufXAJNBJFt/ni+HrXccT
	Ebg3liej5RpvlxA5P9dmP5LGhD+9FZADlSBo+a6on1Y3Xr7CxhqOunGOpeAnVorpneeoce
	GL9xROJIe/+ak0SHSSkxIY+7Bt7DDVOQeuhT0yAaV2pjkHOs1oa1c+wMHHM/14DXmIyyoZ
	MnYCBqtPX9fKAobqcFOfAhW7Tbux+l9alRHw3xKyjHuio+Ydb6TZmzcKnlRODQ==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org,
	michael.opdenacker@rootcommit.com
Cc: thomas.petazzoni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3 0/3] Improvements to "bmaptool" usage documentation
Date: Mon, 23 Dec 2024 10:02:51 +0100
Message-ID: <173494448244.70328.11266533809809817873.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
References: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Dec 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6013

From: Antonin Godard <antonin.godard@bootlin.com>


On Wed, 18 Dec 2024 14:46:58 +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> - Changes in V3:
> 
>   - Use "chmod a+w" instead of "chmod o+w",
>     and put this right before calling "oe-run-native"
>     (thanks to Antonin Godard)
> 
> [...]

Applied, thanks!

[1/3] dev-manual: fix styling of references to bmaptool
      commit: c569d840c4b6f43e10629b6f1ff45189211e27a9
[2/3] dev-manual/bmaptool.rst: correct command for bmaptool-native
      commit: 72fe904a3bbb5e2c7279ab1f119c2beca200dcf2
[3/3] dev-manual/bmaptool.rst: simplify and fix instructions
      commit: 4afa71ef6e5bf1db126c80e6d987f588d0b5a086

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

