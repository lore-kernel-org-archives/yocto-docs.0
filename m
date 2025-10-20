Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177AFCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 09:58:06 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by mx.groups.io with SMTP id smtpd.web11.14608.1760954285464680552
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 02:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=BbySyPK/;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=P+1C1Fsr;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8F1D41D000C7;
	Mon, 20 Oct 2025 05:58:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 20 Oct 2025 05:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1760954284; x=1761040684; bh=pF
	sRXKBUf7ji+Z3sYOWv0vgsnR/W6sYK98BT8f2qxao=; b=BbySyPK/NghjFk56O/
	/tPjJM8H4lIKzRl8F4QLBkOWy6kOMDjjI2oavppBksScsfTmNtzuj6fcxHrnvGm+
	+lRJuXR4v5zAUpdPHdyPy+o49GvVB6Xa4MzH/LvsgVSJGSOk2uVnldrSe13dHnev
	5OkHI2DOgiAJmq8Y50xdgCCwk7lKJXa5PCXHUawwj/YdPZCPzWz7MfUOyORAmnIy
	t+pf3U5CGjAkzo9DJKsFboJTKEAQ2i9jBIqFdX5WAx/MIF9MAYXk5ckYNjSEYqy0
	BJbt+2JjIXdB3Xr9lNe23eE0rCbfKy8ZObuPMwCEB3OPM1LsMTYzbWT3QupmKk46
	RfEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1760954284; x=1761040684; bh=pFsRXKBUf7ji+Z3sYOWv0vgsnR/W
	6sYK98BT8f2qxao=; b=P+1C1Fsr7VOWjcKSaUiggPg8hwurKgfK/tq3x77Hhnr1
	RwkcxF9wsdINVgMrY/LjZfpQTClCUE7htSPPsRmIPss6Ss9Mkfbxt6rbsmXdo4Uy
	kccO/BMWnMuHlxtdG1K/K5CPCTFZaTcSJKlrpFfpmvwegoU1zzEDdLAVbVXoX0tk
	X+hXwp8jeug720gkE6nuHlL/rn46bajFSG5MheEGkk6IA/TyEXeaOsuqx/yhbdNo
	jWFjM+gc+XOMbwP6Rc6rZen+iVyuLtbiA5vbMdhTEKL2+PdCd9/d8tq55UtYSeiC
	X9J6QKm5zQ/OJvaIxZiW2FQVr6wSp1Al9FnTkRmtLw==
X-ME-Sender: <xms:rAf2aHEA-QfFziEHzxuYRplMZWGv6lKaINpG_-g_PcriGUdmLtTDUg>
    <xme:rAf2aKVVKlr82C6uszPKMi6lTMTLZ79lDPI61BPmyxKXsTdLYo9KNd6qDHFl4ZuXe
    0txQaguu64j5umadOYS0oV5Dmh9rlIp4GxgGnAx6MJbiLdA0syOQw>
X-ME-Received: <xmr:rAf2aGyrXasn21qeZ1feVwivqLzakm2Lj_iAIfB3wFeEYh7fHJzqggQgg573gd3Hh7hAsXaeDr6BitfEJANeHRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddufeejhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepudektdffiedthfegffekhfdtgeeuhfelhffhie
    fggedvudfgveelfeehtdegtedtnecuffhomhgrihhnpeihohgtthhordhiohenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtohepughotghsse
    hlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:rAf2aANOT_YHnmIbP0JwpdcyU_KFhEGArfr6Fi20NS1H4hmDKKyWmg>
    <xmx:rAf2aP5mZY6stfy_VU84AhyUeBT-Iydv3g6c1lTXjRLKZQrZAytdmA>
    <xmx:rAf2aJP5dI_UaQRf0o3RPQ9MVZrbzF-BEmBoxn-P-5itzwh3y5D9GQ>
    <xmx:rAf2aFkIIZYSv2m2FlT3IsRexf9NEW9aiYibiUwWposQxK_9o0RCeg>
    <xmx:rAf2aEoGYZPwrOdY82_64TSgwcQmrrQb3hh4qtzCRCPcHtFzrZu5_jn->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Oct 2025 05:58:03 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 20 Oct 2025 10:57:45 +0100
Subject: [PATCH] dev-manual, test-manual: Update autobuilder output links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-valkyrie-links-v1-1-38ab330b3a92@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAJgH9mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMD3bLEnOxKoBbdnMy87GJdy8RkQ2MLA2NLk2QzJaCmgqLUtMwKsIH
 RsbW1AM3I4rpgAAAA
X-Change-ID: 20251020-valkyrie-links-9ac1380394c6
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=V+7Gff99YTosmYRqpZwoaGWXNUZMvgXIEDV+nfQ6LnQ=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWR8Y19dJRYeJ7Nta3lrodq8e1PDmXyss53nOz7dbGkSL
 Lciq529o5SFQYyLQVZMkWVzz9f7T3sdeTNCbinAzGFlAhnCwMUpABOp8mP4H+5tpVC+svfM4Qrd
 oCc8OW4czMvuT7Nja967asKGwx80SxgZDlU6VmWpnJw8RWPyl501s7v3R5mcfHHqvqx7dU5O99H
 jfAA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 09:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7759

The current autobuilder cluster is at valkyrie.yocto.io, published files
on autobuilder.yocto.io will be missing or out-of-date.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/dev-manual/vulnerabilities.rst      | 2 +-
 documentation/test-manual/reproducible-builds.rst | 2 +-
 documentation/test-manual/test-process.rst        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 6cc7f049441c..3a83a40f313d 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -12,7 +12,7 @@ known security vulnerabilities, as tracked by the public
 database.
 
 The Yocto Project maintains a `list of known vulnerabilities
-<https://autobuilder.yocto.io/pub/non-release/patchmetrics/>`__
+<https://valkyrie.yocto.io/pub/non-release/patchmetrics/>`__
 for packages in Poky and OE-Core, tracking the evolution of the number of
 unpatched CVEs and the status of patches. Such information is available for
 the current development version and for each supported release.
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index b913aa4eaf21..336bb7f26a24 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -113,7 +113,7 @@ If ``OEQA_DEBUGGING_SAVED_OUTPUT`` is set, any differing packages will be saved
 here. The test is also able to run the ``diffoscope`` command on the output to
 generate HTML files showing the differences between the packages, to aid
 debugging. On the Autobuilder, these appear under
-https://autobuilder.yocto.io/pub/repro-fail/ in the form ``oe-reproducible +
+https://valkyrie.yocto.io/pub/repro-fail/ in the form ``oe-reproducible +
 <date> + <random ID>``, e.g. ``oe-reproducible-20200202-1lm8o1th``.
 
 The project's current reproducibility status can be seen at
diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 945b56830fc3..00215385bb4b 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -69,7 +69,7 @@ box to "generate an email to QA" is also checked.
 When the build completes, an email is sent out using the ``send-qa-email``
 script in the :yocto_git:`yocto-autobuilder-helper </yocto-autobuilder-helper>`
 repository to the list of people configured for that release. Release builds
-are placed into a directory in https://autobuilder.yocto.io/pub/releases on the
+are placed into a directory in https://valkyrie.yocto.io/pub/releases on the
 Autobuilder which is included in the email. The process from here is
 more manual and control is effectively passed to release engineering.
 The next steps include:

---
base-commit: 8b85245490ae0b19a9c3880ec31e55b42e19d094
change-id: 20251020-valkyrie-links-9ac1380394c6

Best regards,
-- 
Paul Barker


