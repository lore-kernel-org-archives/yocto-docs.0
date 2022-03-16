Return-Path: <yocto@opensource.nslick.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692A5C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 16:29:02 +0000 (UTC)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by mx.groups.io with SMTP id smtpd.web09.27562.1647448140839735880
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 09:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nslick.com header.s=fm1 header.b=hJS5+BWX;
 spf=none, err=permanent DNS error (domain: opensource.nslick.com,
 ip: 66.111.4.230, mailfrom: yocto@opensource.nslick.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 00E33580241;
	Wed, 16 Mar 2022 12:29:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 16 Mar 2022 12:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nslick.com; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; bh=Kg1SQGoAUNKt5NEzHvN8cCuJrsNxmRCwnpXGGFN7SA4=; b=hJS5+
	BWXw9YaYgBiwVOMAGyo3FgE1fkIWCtvEclPY2jD2eBrdO7LeRSHoLv4UK1Ap2+94
	ZIMjlDOWkdkW93Ly/PlxcRrNGNUnF0ALZDyFPjBrdUbc8ix7Zq+C+Y8yuNhtO0Q1
	wkMjInWcwMJpZtg+27rVrCinWbudq4pbf5RqnhfPXpfjCZ8rmRvXurJGMpXcSFox
	HkjQZDWuMlZd7qXzq/xNisGMzwrXbcFZXF0qYmlWeDoIyVFB8yjLh8jOWsz8Rbtu
	9yKUpeJHQrtTZbYN1ULTSvwKW/tn1C9z0OHr+Fpi9Ac6FzM970iiD/jo40TdF6t5
	qaUHO5bNu/FV4jgiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=Kg1SQGoAUNKt5NEzHvN8cCuJrsNxm
	RCwnpXGGFN7SA4=; b=db7wTRQYE1UEt6/eB5x2lsFle/yTIM/6+uwNuXZbvkt1s
	di9qJ/qJYKieeMritJBJXHi0G34G9ElTWYovDLAhAO1PuWkfHk1wuHYaXQZP/bL8
	i+vYxN7yL7/yuazEREZx+E9d5ABbB3ZV+Hm5Y/BK5aecrPQGgk/8dQ14KExp81Uc
	v+Z6dDL45oDd36LbuOdZC41kC6gF+k+sNomXlRh73FsmU9cqhzr2E9vDiXpFjy9w
	HnkQFhn0/3fBXf/r+uM0cD+Ckk1ZyTPw65n4TQlbiHaS8xO7yAK3XZ5t4AOlSXUB
	P7OhMvaGiq/cL8nLkJzGqfX0Hpg1yCjPpPocwtcZQ==
X-ME-Sender: <xms:SxAyYlwIW0YFFTBU7GXIDRexDoMqhDRR5_ZCUORprvJ6SBLIVnMdew>
    <xme:SxAyYlRTC4OmB_BRG1zN6MtbMti0bmh-anjv9YrG0thoQN2W3yT6ADvuQ2GfPy29K
    tUC-Yht_SaHXBl8dMs>
X-ME-Received: 
 <xmr:SxAyYvVKgJlJrd53V-xjyxtUY0gAOTbsfS8h1rmaFxlILp5e4Mlvu3DRpiw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrudefvddgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheppfhitghhohhlrghsucfuihgvlhhitghkihcuoeihohgtthhoseho
    phgvnhhsohhurhgtvgdrnhhslhhitghkrdgtohhmqeenucggtffrrghtthgvrhhnpeffte
    dtieduffdtfeeiveekteefleetjeelteejiefhffelleffudevjeegieduhfenucffohhm
    rghinhepshhtrggtkhhovhgvrhhflhhofidrtghomhdphihotghtohhprhhojhgvtghtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    hihotghtohesohhpvghnshhouhhrtggvrdhnshhlihgtkhdrtghomh
X-ME-Proxy: <xmx:SxAyYnh0t3P1MxqdIed3FvnUdSUBPQMoBFDcZZUqy9klbgefWHKITw>
    <xmx:SxAyYnArpMIDCqZqAY-1b4Iql_3CstllamEPbxtde4_NiF470Af0Gw>
    <xmx:SxAyYgK7EwvhOi2Iv2G6QnthGRktU2gnVSejPtIFBTvMOacqNxOS6A>
    <xmx:SxAyYq8cH5Tye9fTFLJIrAfVNIu8y0XB9QNtQG4D6k_sJGgSHFLdrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Mar 2022 12:28:59 -0400 (EDT)
From: Nicholas Sielicki <yocto@opensource.nslick.com>
To: docs@lists.yoctoproject.org
Cc: Nicholas Sielicki <nicholas.sielicki@legrand.com>
Subject: [PATCH 1/1] dev-manual: note on using journald without syslog
Date: Wed, 16 Mar 2022 11:28:57 -0500
Message-Id: <20220316162857.1226591-1-yocto@opensource.nslick.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 16:29:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2612

From: Nicholas Sielicki <nicholas.sielicki@legrand.com>

journald is not a syslog provider, so using journald exclusively amounts
to just preventing a syslog provider from being specified on a system
where journald is active.

Various spots where this has popped up:
* https://stackoverflow.com/q/48746397
* https://lists.yoctoproject.org/g/yocto/topic/82883035#53548

Signed-off-by: Nicholas Sielicki <nicholas.sielicki@legrand.com>
---
 documentation/dev-manual/common-tasks.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ca3fbc856..4e9c2c04e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7910,6 +7910,20 @@ image cannot use this package group. However, it can install SysVinit
 and the appropriate packages will have support for both systemd and
 SysVinit.
 
+Using systemd-journald without a traditional syslog daemon
+------------------------------------------------------------------------
+
+Counter-intuitively, ``systemd-journald`` is not a syslog runtime or provider,
+and the proper way to use systemd-journald as your sole logging mechanism is to
+effectively disable syslog entirely by set these variables in your distribution
+configuration file::
+
+   VIRTUAL-RUNTIME_syslog = ""
+   VIRTUAL-RUNTIME_base-utils-syslog = ""
+
+Doing so will prevent ``rsyslog`` / ``busybox-syslog`` from being pulled in by
+default, leaving only ``journald``.
+
 Selecting a Device Manager
 ==========================
 
-- 
2.25.1


