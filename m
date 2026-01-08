Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78ABD185ED
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 12:36:01 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5410.1767875758621520537
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 04:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=jOMeo/dj;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=If2NK6r6;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DC2B37A0106;
	Thu,  8 Jan 2026 07:35:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 08 Jan 2026 07:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767875757; x=1767962157; bh=nT
	nH7W6lmgj5GV+xAOmB+4BsZHQ8KPCkxTqqcNgAolI=; b=jOMeo/djAV5vZVpeGt
	FdgqD6dV7IGV54cufJpmyq2jIb6c2Tq6WEluo3rAYCexxgpn/YWZahE3MnteFfdd
	EuwMSCf5izKJU5iTM2Q2LfY+Lc/2x2A8h+qyOnKwJdXhCLU9gOJHCuNwaUfpAoOl
	CqwZeQELjV5SKwWVbi0uq29NJVgVz8Vx5P7lDdYji1tDr4PF4ZuLLBhwu9htKoHJ
	j+F6H01AYVL1647r8fW/vnzX9jovNZhsHWzbc77OR+cAtQ4SHoRBm77CgcgodVY+
	XjXMOw2UXpvmbIJ/kTPXQhP5wJ0HwhfUhjn6Y0BY5rfwNmLgPMS4xoq2NfA8cxDd
	YGHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767875757; x=1767962157; bh=nTnH7W6lmgj5GV+xAOmB+4BsZHQ8
	KPCkxTqqcNgAolI=; b=If2NK6r6eEawYB5vDU3LgCM63bq8o3BE54oYh4EF87Yp
	BKWGJO+d+NDbEiB1XEwsQgErBiiYhhhEhjJ0IZEVUcwJ92Dc+HJeZnArC4Qesr9p
	bF7LAEweCbgo3QrQnjp2CVS9+CRyJ5U3z3dF0ec1osOTbwtJsQMoWXswcIzI+fg4
	f7GMy16fMbjcPs/BGhplaIPMg+6faAc+BEOWCc8x+CvuWkoKueKN0wMk3OzDodnM
	NpXRqU/hIToeTDzNkx9zFoMCxtR1Tkjf77Xs+6ljHKGDRxdrBWmtSB5uUXVc6Xhv
	+jr1Hj8/uR225AxreZE3U6XESwENzbRSWvfbG9OvfA==
X-ME-Sender: <xms:raRfab5JeiYUA6n1nqz4Ecl7zNgnWMgy0o3mi08s791DdnY8sYq2fw>
    <xme:raRfaW65DdjLzR1z4jhkNK3zQkfV1rPc73WZLTtwuTRsWJe3Do47BtSoD9neLhs3x
    9bd8t2lXc2wXvsx_g0oGJaOLwEoBmn2-0Kqc6ThENqESjNNAUaarA>
X-ME-Received: <xmr:raRfaQG-IdyJmnrn86wR2JoUpzG3KimM4wN5m82cQo_7hTv_6ib6UPVtNSjqLbVBmflnzsb1rxj75HEtyJMuLoyNrXvkj6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdehleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepjeelteefleetkeduueefteffgeeltdeguefgve
    etteekveetieektdfftedtkefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguohgtsheslhhishhtshdr
    hihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepphgruhhlsehpsggrrhhkvg
    hrrdguvghv
X-ME-Proxy: <xmx:raRfaXQV2TmCXptv7eaUUJV_Y8_tp9jMCQDl_azdksvRVjZp-hIiog>
    <xmx:raRfaRvYavP4i_IysiF7e_fNsxzikCWUJVfS_-An_VgGmhZ3cmrCJA>
    <xmx:raRfaewwIuNME7XYIsg0fe-et2gGERK_Yk-UHqycwwWlTUy_IO1TTQ>
    <xmx:raRfaT6PpwpkwtGbZbMhwAci-B6_DjiR3IMsKUuJ2571S0A4grW5ew>
    <xmx:raRfaedJzoHVmzvV5-vgctGOmJ8iCIIh9NKe8hR6lC7annllZmhivKm1>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 07:35:56 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 08 Jan 2026 12:35:55 +0000
Subject: [PATCH] Fix bitbake version mapping for whinlatter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-whinlatter-bitbake-version-v1-1-e6007fed5099@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAKqkX2kC/x3MTQqEMAxA4atI1hNoxZ86VxlcVE01KHVIiwri3
 a0uv8V7JwQSpgDf7AShjQOvPkF/Mugn60dCHpIhV3mltDK4T+wXGyMJdhw7OxNuJE+GujSNs70
 ZitpBGvyFHB/v/Nde1w2Yq+CcbAAAAA==
X-Change-ID: 20260108-whinlatter-bitbake-version-1589fac8d47f
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=vum40rE8reSWdVK40G97159cVyMNrjFhOffrZqXPiMQ=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTGL1mz517xoQDNHE+3svU/2yVut9ab3Sp/ufZwxyH9Y
 kuvgPxZHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZjI6lhGhu0Zj9TNPiaKTTzX
 /uHfe+71CQVzV+9/vKXjqcDJN9pCDQcZGU5/YWRd6q5/9nSKT/e71ItL1183meIZqbbZ1PE5773
 W6wwA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 12:36:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8421

The correct bitbake version for Yocto 5.3 "whinlatter" is 2.16. This can
be seen in the poky-whinlatter bitbake-setup configuration in the
bitbake repo.

The 2.14 branch has been removed from the bitbake git repository to
avoid confusion.

This means that the next release, Yocto 6.0 "wrynose", will use bitbake
version 2.18.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/migration-guides/release-notes-5.3.rst | 2 +-
 documentation/set_versions.py                        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 87277ba6d013..0ba0fbe98ff1 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -2500,7 +2500,7 @@ meta-mingw
 bitbake
 
 -  Repository Location: :oe_git:`/bitbake`
--  Branch: :oe_git:`2.14 </bitbake/log/?h=2.14>`
+-  Branch: :oe_git:`2.16 </bitbake/log/?h=2.16>`
 -  Tag:  :oe_git:`yocto-5.3 </bitbake/log/?h=yocto-5.3>`
 -  Git Revision: :oe_git:`720df1a53452983c1c832f624490e255cf389204 </bitbake/commit/?id=720df1a53452983c1c832f624490e255cf389204>`
 -  Release Artefact: bitbake-720df1a53452983c1c832f624490e255cf389204
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 91aa2bdf2a6f..dc2f83fd1112 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -72,8 +72,8 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
-    "wrynose" : "2.16",
-    "whinlatter" : "2.14",
+    "wrynose" : "2.18",
+    "whinlatter" : "2.16",
     "walnascar" : "2.12",
     "styhead" : "2.10",
     "scarthgap" : "2.8",

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20260108-whinlatter-bitbake-version-1589fac8d47f

Best regards,
-- 
Paul Barker


