Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAA0C61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:02:02 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web10.35710.1749222121150227975
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 08:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bDPfv1LpkzBtp;
	Fri,  6 Jun 2025 17:01:59 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bDPft16Rzz5Rl;
	Fri,  6 Jun 2025 17:01:58 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] ref-manual: classes: clarify native/nativesdk classes
 exclusive options
Date: Fri, 06 Jun 2025 17:01:46 +0200
Message-Id: <20250606-native-options-v1-0-2ad99a184f90@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANoCQ2gC/x2MSQqAMAwAv1JythDFVvQr4sEl1VyqNFIE6d8NH
 gdm5gWhxCQwmBcSZRY+o0JdGViPOe5keVOGBhuHHr2N882Z7HndaortW+cX6tAFbEGjK1Hg5x+
 OUykfFWzpG2AAAAA=
X-Change-ID: 20250606-native-options-9456be705f04
To: docs@lists.yoctoproject.org
Cc: Joseph Maniaci <joseph.maniaci@seagate.com>, 
 Ross Burton <ross.burton@arm.com>, Khem Raj <raj.khem@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 15:02:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7022

Someone recently misread the documentation and did both options, that
is name the recipe with -native and add BBCLASSEXTEND = "native" to it.

So this hopefully make it clearer by rewording the second item in the
bullet list.

At the same time, put the nativesdk note about the filename for the
first bullet point within the first bullet point, like for the similar
native note.

Reading through this class documentation for the first time, I had this
random thought:

What happens if I want a recipe to be native and nativesdk but not
target?

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      ref-manual: classes: reword to clarify that native/nativesdk options are exclusive
      ref-manual: classes: nativesdk: move note to appropriate section

 documentation/ref-manual/classes.rst | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)
---
base-commit: 406e8a8e30404c0538f5aa46f211540bae2b206b
change-id: 20250606-native-options-9456be705f04

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


