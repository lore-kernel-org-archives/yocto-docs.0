Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D876C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 17:22:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.70.1667928152545409803
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 09:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IFHcS41q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6363E1BF20A;
	Tue,  8 Nov 2022 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667928150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bLdYilS2CTqbri+DgE5+9NksgEYa8J3MVDJszUnfzZk=;
	b=IFHcS41qFZPXNtm+TzsJBXjcjvltm9aPNOj+ep7/yzfZvcSUKsPmrP6F7at5/3aGArZZxG
	+T4cDt0fvrMjZDdQk39617mvYtlCI8kUPwhu9UzMXDh4nWqAmStOmvpKVGNsISXrL21Ms2
	/Y0mC/N32FyVnFKbiifybEmJho0mk7FGwtS3ryGm9yp0ukyY/cISmDEPavZCh8xBUW6+wT
	NSnWICDmzjJVw/d5wPkZ4QeLnuNXUVwXDojCIu2SuAZTjUWVslFk/aYXXRblWGMa4VSc1Q
	gHRtiY+g75S6zOuls1MjwSRIBp2g4EnreEn88L9VjiWk9dfNCV/Yv6r9UoE5yw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] release-notes: use oe_git and yocto_git macros
Date: Tue,  8 Nov 2022 18:22:28 +0100
Message-Id: <20221108172228.481536-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 17:22:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3474

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As in the rest of the manuals; this is more future proof than using
hard coded URLs.

While doing this, also replacing https://git.yoctoproject.org/git/<repo>
links (used by mistake instead of https://git.yoctoproject.org/<repo>)
by :yocto_git:`/repo`.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-notes-3.4.1.rst         |  8 ++++----
 .../migration-guides/release-notes-3.4.2.rst         | 10 +++++-----
 .../migration-guides/release-notes-3.4.3.rst         | 10 +++++-----
 .../migration-guides/release-notes-3.4.4.rst         | 10 +++++-----
 documentation/migration-guides/release-notes-3.4.rst | 10 +++++-----
 .../migration-guides/release-notes-4.0.1.rst         |  8 ++++----
 .../migration-guides/release-notes-4.0.2.rst         | 12 ++++++------
 .../migration-guides/release-notes-4.0.3.rst         | 12 ++++++------
 .../migration-guides/release-notes-4.0.4.rst         | 12 ++++++------
 .../migration-guides/release-notes-4.0.5.rst         | 12 ++++++------
 documentation/migration-guides/release-notes-4.0.rst |  8 ++++----
 documentation/migration-guides/release-notes-4.1.rst | 10 +++++-----
 12 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/documentation/migration-guides/release-notes-3.4.1.rst b/documentation/migration-guides/release-notes-3.4.1.rst
index 0503f29b2c..d15a8a8fbd 100644
--- a/documentation/migration-guides/release-notes-3.4.1.rst
+++ b/documentation/migration-guides/release-notes-3.4.1.rst
@@ -198,7 +198,7 @@ Repositories / Downloads for 3.4.1
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/poky/
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`honister </poky/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.1 </poky/tag/?h=yocto-3.4.1>`
 -  Git Revision: :yocto_git:`b53230c08d9f02ecaf35b4f0b70512abbf10ae11 </poky/commit/?id=b53230c08d9f02ecaf35b4f0b70512abbf10ae11>`
@@ -210,7 +210,7 @@ poky
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.1 </meta-mingw/tag/?h=yocto-3.4.1>`
 -  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
@@ -222,7 +222,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`honister </meta-gplv2/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.1 </meta-gplv2/tag/?h=yocto-3.4.1>`
 -  Git Revision: :yocto_git:`f04e4369bf9dd3385165281b9fa2ed1043b0e400 </meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`
@@ -246,7 +246,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.1 </yocto-docs/tag/?h=yocto-3.4.1>`
 -  Git Revision: :yocto_git:`b250eda5a0beba8acc9641c55a5b0e30594b5178 </yocto-docs/commit/?b250eda5a0beba8acc9641c55a5b0e30594b5178>`
diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
index 2812b725c4..ddf25ef1bd 100644
--- a/documentation/migration-guides/release-notes-3.4.2.rst
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -174,9 +174,9 @@ Repositories / Downloads for 3.4.2
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/poky/
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`honister </poky/log/?h=honister>`
--  Tag: `yocto-3.4.2 <https://git.yoctoproject.org/poky/tag/?h=yocto-3.4.2>`__
+-  Tag: :yocto_git:`yocto-3.4.2 </poky/tag/?h=yocto-3.4.2>`
 -  Git Revision: :yocto_git:`e0ab08bb6a32916b457d221021e7f402ffa36b1a </poky/commit/?id=e0ab08bb6a32916b457d221021e7f402ffa36b1a>`
 -  Release Artefact: poky-e0ab08bb6a32916b457d221021e7f402ffa36b1a
 -  sha: 8580dc5067ee426fe347a0d0f7a74c29ba539120bbe8438332339a9c8bce00fd
@@ -198,7 +198,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/meta-mingw
+-  Repository Location: :yocto_git:`meta-mingw`
 -  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.2 </meta-mingw/tag/?h=yocto-3.4.2>`
 -  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
@@ -210,7 +210,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`honister </meta-gplv2/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.2 </meta-gplv2/tag/?h=yocto-3.4.2>`
 -  Git Revision: :yocto_git:`f04e4369bf9dd3385165281b9fa2ed1043b0e400 </meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`
@@ -234,7 +234,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.2 </yocto-docs/tag/?h=yocto-3.4.2>`
 -  Git Revision: :yocto_git:`3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2` </yocto-docs/commit/?3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2>`
diff --git a/documentation/migration-guides/release-notes-3.4.3.rst b/documentation/migration-guides/release-notes-3.4.3.rst
index 2673abbbb9..9db53d71df 100644
--- a/documentation/migration-guides/release-notes-3.4.3.rst
+++ b/documentation/migration-guides/release-notes-3.4.3.rst
@@ -131,9 +131,9 @@ Repositories / Downloads for 3.4.3
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/poky/
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`honister </poky/log/?h=honister>`
--  Tag: `yocto-3.4.3 <https://git.yoctoproject.org/poky/tag/?h=yocto-3.4.3>`__
+-  Tag: :yocto_git:`yocto-3.4.3 </poky/tag/?h=yocto-3.4.3>`
 -  Git Revision: :yocto_git:`ee68ae307fd951b9de6b31dc6713ea29186b7749 </poky/commit/?id=ee68ae307fd951b9de6b31dc6713ea29186b7749>`
 -  Release Artefact: poky-ee68ae307fd951b9de6b31dc6713ea29186b7749
 -  sha: 92c3d73c3e74f0e1d5c2ab2836ce3a3accbe47772cea70df3755845e0db1379b
@@ -155,7 +155,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.3 </meta-mingw/tag/?h=yocto-3.4.3>`
 -  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
@@ -167,7 +167,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`honister </meta-gplv2/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.3 </meta-gplv2/tag/?h=yocto-3.4.3>`
 -  Git Revision: :yocto_git:`f04e4369bf9dd3385165281b9fa2ed1043b0e400 </meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`
@@ -191,7 +191,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.3 </yocto-docs/tag/?h=yocto-3.4.3>`
 -  Git Revision: :yocto_git:`15f46f97d9cad558c19fc1dc19cfbe3720271d04 </yocto-docs/commit/?15f46f97d9cad558c19fc1dc19cfbe3720271d04>`
diff --git a/documentation/migration-guides/release-notes-3.4.4.rst b/documentation/migration-guides/release-notes-3.4.4.rst
index 38e3965169..55a4583b29 100644
--- a/documentation/migration-guides/release-notes-3.4.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.4.rst
@@ -89,9 +89,9 @@ Repositories / Downloads for 3.4.4
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/poky/
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`honister </poky/log/?h=honister>`
--  Tag: `yocto-3.4.4 <https://git.yoctoproject.org/poky/tag/?h=yocto-3.4.4>`__
+-  Tag: :yocto_git:`yocto-3.4.4 </poky/tag/?h=yocto-3.4.4>`
 -  Git Revision: :yocto_git:`780eeec8851950ee6ac07a2a398ba937206bd2e4 </poky/commit/?id=780eeec8851950ee6ac07a2a398ba937206bd2e4>`
 -  Release Artefact: poky-780eeec8851950ee6ac07a2a398ba937206bd2e4
 -  sha: 09558927064454ec2492da376156b716d9fd14aae57196435d742db7bfdb4b95
@@ -113,7 +113,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.4 </meta-mingw/tag/?h=yocto-3.4.4>`
 -  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
@@ -125,7 +125,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`honister </meta-gplv2/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.4 </meta-gplv2/tag/?h=yocto-3.4.4>`
 -  Git Revision: :yocto_git:`f04e4369bf9dd3385165281b9fa2ed1043b0e400 </meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`
@@ -149,7 +149,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.4 </yocto-docs/tag/?h=yocto-3.4.4>`
 -  Git Revision: :yocto_git:`5ead7d39aaf9044078dff27f462e29a8e31d89e4 </yocto-docs/commit/?5ead7d39aaf9044078dff27f462e29a8e31d89e4>`
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index de1d209682..62683b4a5c 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -721,7 +721,7 @@ Repositories / Downloads for 3.4
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/poky/
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`honister </poky/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4 </poky/tag/?h=yocto-3.4>`
 -  Git Revision: :yocto_git:`f6d1126fff213460dc6954a5d5fc168606d76b66 </poky/commit/?id=f6d1126fff213460dc6954a5d5fc168606d76b66>`
@@ -745,7 +745,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4 </meta-mingw/tag/?h=yocto-3.4>`
 -  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
@@ -757,7 +757,7 @@ meta-mingw
 
 meta-intel
 
--  Repository Location: https://git.yoctoproject.org/meta-intel
+-  Repository Location: :yocto_git:`/meta-intel`
 -  Branch: :yocto_git:`honister </meta-intel/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4 </meta-intel/tag/?h=yocto-3.4>`
 -  Git Revision: :yocto_git:`90170cf85fe35b4e8dc00eee50053c0205276b63 </meta-intel/commit/?id=90170cf85fe35b4e8dc00eee50053c0205276b63>`
@@ -769,7 +769,7 @@ meta-intel
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`honister </meta-gplv2/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4 </meta-gplv2/tag/?h=yocto-3.4>`
 -  Git Revision: :yocto_git:`f04e4369bf9dd3385165281b9fa2ed1043b0e400 </meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`
@@ -793,7 +793,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4 </yocto-docs/tag/?h=yocto-3.4>`
 -  Git Revision: :yocto_git:`d75c5450ecf56c8ac799a633ee9ac459e88f91fc </yocto-docs/commit/?id=d75c5450ecf56c8ac799a633ee9ac459e88f91fc>`
diff --git a/documentation/migration-guides/release-notes-4.0.1.rst b/documentation/migration-guides/release-notes-4.0.1.rst
index e4bfd5bb3d..28d1d71dcf 100644
--- a/documentation/migration-guides/release-notes-4.0.1.rst
+++ b/documentation/migration-guides/release-notes-4.0.1.rst
@@ -182,7 +182,7 @@ Repositories / Downloads for 4.0.1
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.1 </poky/tag/?h=yocto-4.0.1>`
 -  Git Revision: :yocto_git:`8c489602f218bcf21de0d3c9f8cf620ea5f06430 </poky/commit/?id=8c489602f218bcf21de0d3c9f8cf620ea5f06430>`
@@ -206,7 +206,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.1 </meta-mingw/tag/?h=yocto-4.0.1>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -218,7 +218,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.1 </meta-gplv2/tag/?h=yocto-4.0.1>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-mingw/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -242,7 +242,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.1 </yocto-docs/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`4ec9df3336a425719a9a35532504731ce56984ca </yocto-docs/commit/?id=4ec9df3336a425719a9a35532504731ce56984ca>`
diff --git a/documentation/migration-guides/release-notes-4.0.2.rst b/documentation/migration-guides/release-notes-4.0.2.rst
index 632af11297..2c79969f4d 100644
--- a/documentation/migration-guides/release-notes-4.0.2.rst
+++ b/documentation/migration-guides/release-notes-4.0.2.rst
@@ -230,7 +230,7 @@ Repositories / Downloads for Yocto-4.0.2
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.2 </poky/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`a5ea426b1da472fc8549459fff3c1b8c6e02f4b5 </poky/commit/?id=a5ea426b1da472fc8549459fff3c1b8c6e02f4b5>`
@@ -242,7 +242,7 @@ poky
 
 openembedded-core
 
--  Repository Location: https://git.openembedded.org/openembedded-core
+-  Repository Location: :oe_git:`/openembedded-core`
 -  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
 -  Tag:  :oe_git:`yocto-4.0.2 </openembedded-core/log/?h=yocto-4.0.2>`
 -  Git Revision: :oe_git:`eea52e0c3d24c79464f4afdbc3c397e1cb982231 </openembedded-core/commit/?id=eea52e0c3d24c79464f4afdbc3c397e1cb982231>`
@@ -254,7 +254,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.2 </meta-mingw/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -266,7 +266,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.2 </meta-gplv2/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -278,7 +278,7 @@ meta-gplv2
 
 bitbake
 
--  Repository Location: https://git.openembedded.org/bitbake
+-  Repository Location: :oe_git:`/bitbake`
 -  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
 -  Tag:  :oe_git:`yocto-4.0.2 </bitbake/log/?h=yocto-4.0.2>`
 -  Git Revision: :oe_git:`b8fd6f5d9959d27176ea016c249cf6d35ac8ba03 </bitbake/commit/?id=b8fd6f5d9959d27176ea016c249cf6d35ac8ba03>`
@@ -290,7 +290,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.2 </yocto-docs/log/?h=yocto-4.0.2>`
 -  Git Revision: :yocto_git:`662294dccd028828d5c7e9fd8f5c8e14df53df4b </yocto-docs/commit/?id=662294dccd028828d5c7e9fd8f5c8e14df53df4b>`
diff --git a/documentation/migration-guides/release-notes-4.0.3.rst b/documentation/migration-guides/release-notes-4.0.3.rst
index 83e12a64ef..9f51ff9b3e 100644
--- a/documentation/migration-guides/release-notes-4.0.3.rst
+++ b/documentation/migration-guides/release-notes-4.0.3.rst
@@ -247,7 +247,7 @@ Repositories / Downloads for Yocto-4.0.3
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.3 </poky/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`387ab5f18b17c3af3e9e30dc58584641a70f359f </poky/commit/?id=387ab5f18b17c3af3e9e30dc58584641a70f359f>`
@@ -259,7 +259,7 @@ poky
 
 openembedded-core
 
--  Repository Location: https://git.openembedded.org/openembedded-core
+-  Repository Location: :oe_git:`/openembedded-core`
 -  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
 -  Tag:  :oe_git:`yocto-4.0.3 </openembedded-core/log/?h=yocto-4.0.3>`
 -  Git Revision: :oe_git:`2cafa6ed5f0aa9df5a120b6353755d56c7c7800d </openembedded-core/commit/?id=2cafa6ed5f0aa9df5a120b6353755d56c7c7800d>`
@@ -271,7 +271,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.3 </meta-mingw/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -283,7 +283,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.3 </meta-gplv2/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -295,7 +295,7 @@ meta-gplv2
 
 bitbake
 
--  Repository Location: https://git.openembedded.org/bitbake
+-  Repository Location: :oe_git:`/bitbake`
 -  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
 -  Tag:  :oe_git:`yocto-4.0.3 </bitbake/log/?h=yocto-4.0.3>`
 -  Git Revision: :oe_git:`b8fd6f5d9959d27176ea016c249cf6d35ac8ba03 </bitbake/commit/?id=b8fd6f5d9959d27176ea016c249cf6d35ac8ba03>`
@@ -307,7 +307,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.3 </yocto-docs/log/?h=yocto-4.0.3>`
 -  Git Revision: :yocto_git:`d9b3dcf65ef25c06f552482aba460dd16862bf96 </yocto-docs/commit/?id=d9b3dcf65ef25c06f552482aba460dd16862bf96>`
diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index 43f92cae84..9068841783 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -233,7 +233,7 @@ Repositories / Downloads for Yocto-4.0.4
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.4 </poky/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`d64bef1c7d713b92a51228e5ade945835e5a94a4 </poky/commit/?id=d64bef1c7d713b92a51228e5ade945835e5a94a4>`
@@ -245,7 +245,7 @@ poky
 
 openembedded-core
 
--  Repository Location: https://git.openembedded.org/openembedded-core
+-  Repository Location: oe_git:`/openembedded-core`
 -  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
 -  Tag:  :oe_git:`yocto-4.0.4 </openembedded-core/log/?h=yocto-4.0.4>`
 -  Git Revision: :oe_git:`f7766da462905ec67bf549d46b8017be36cd5b2a </openembedded-core/commit/?id=f7766da462905ec67bf549d46b8017be36cd5b2a>`
@@ -257,7 +257,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.4 </meta-mingw/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -269,7 +269,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.4 </meta-gplv2/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -281,7 +281,7 @@ meta-gplv2
 
 bitbake
 
--  Repository Location: https://git.openembedded.org/bitbake
+-  Repository Location: :oe_git:`/bitbake`
 -  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
 -  Tag:  :oe_git:`yocto-4.0.4 </bitbake/log/?h=yocto-4.0.4>`
 -  Git Revision: :oe_git:`ac576d6fad6bba0cfea931883f25264ea83747ca </bitbake/commit/?id=ac576d6fad6bba0cfea931883f25264ea83747ca>`
@@ -293,7 +293,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.4 </yocto-docs/log/?h=yocto-4.0.4>`
 -  Git Revision: :yocto_git:`f632dad24c39778f948014029e74db3c871d9d21 </yocto-docs/commit/?id=f632dad24c39778f948014029e74db3c871d9d21>`
diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
index d742b697e6..ea0280b03c 100644
--- a/documentation/migration-guides/release-notes-4.0.5.rst
+++ b/documentation/migration-guides/release-notes-4.0.5.rst
@@ -129,7 +129,7 @@ Repositories / Downloads for Yocto-4.0.5
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/poky
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.5 </poky/log/?h=yocto-4.0.5>`
 -  Git Revision: :yocto_git:`2e79b199114b25d81bfaa029ccfb17676946d20d </poky/commit/?id=2e79b199114b25d81bfaa029ccfb17676946d20d>`
@@ -141,7 +141,7 @@ poky
 
 openembedded-core
 
--  Repository Location: https://git.openembedded.org/openembedded-core
+-  Repository Location: :oe_git:`/openembedded-core`
 -  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
 -  Tag:  :oe_git:`yocto-4.0.5 </openembedded-core/log/?h=yocto-4.0.5>`
 -  Git Revision: :oe_git:`fbdf93f43ff4b876487e1f26752598ec8abcb46e </openembedded-core/commit/?id=fbdf93f43ff4b876487e1f26752598ec8abcb46e>`
@@ -153,7 +153,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.5 </meta-mingw/log/?h=yocto-4.0.5>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -165,7 +165,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag:  :yocto_git:`yocto-4.0.5 </meta-gplv2/log/?h=yocto-4.0.5>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -177,7 +177,7 @@ meta-gplv2
 
 bitbake
 
--  Repository Location: https://git.openembedded.org/bitbake
+-  Repository Location: :oe_git:`/bitbake`
 -  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
 -  Tag:  :oe_git:`yocto-4.0.5 </bitbake/log/?h=yocto-4.0.5>`
 -  Git Revision: :oe_git:`c90d57497b9bcd237c3ae810ee8edb5b0d2d575a </bitbake/commit/?id=c90d57497b9bcd237c3ae810ee8edb5b0d2d575a>`
@@ -189,7 +189,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0.5 </yocto-docs/log/?h=yocto-4.0.5>`
 -  Git Revision: :yocto_git:`8c2f9f54e29781f4ee72e81eeaa12ceaa82dc2d3 </yocto-docs/commit/?id=8c2f9f54e29781f4ee72e81eeaa12ceaa82dc2d3>`
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 02cde0e3f3..d57227502e 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -866,7 +866,7 @@ Repositories / Downloads for 4.0
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </poky/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`00cfdde791a0176c134f31e5a09eff725e75b905 </poky/commit/?id=00cfdde791a0176c134f31e5a09eff725e75b905>`
@@ -890,7 +890,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </meta-mingw/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
@@ -902,7 +902,7 @@ meta-mingw
 
 meta-gplv2
 
--  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Repository Location: :yocto_git:`/meta-gplv2`
 -  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </meta-gplv2/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-mingw/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
@@ -926,7 +926,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
 -  Tag: :yocto_git:`yocto-4.0 </yocto-docs/tag/?h=yocto-4.0>`
 -  Git Revision: :yocto_git:`a6f571ad5b087385cad8765ed455c4b4eaeebca6 </yocto-docs/commit/?id=a6f571ad5b087385cad8765ed455c4b4eaeebca6>`
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index d4ed23f63d..119cc4fd2e 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -704,7 +704,7 @@ Repositories / Downloads for 4.1
 
 poky
 
--  Repository Location: https://git.yoctoproject.org/git/poky
+-  Repository Location: :yocto_git:`/poky`
 -  Branch: :yocto_git:`langdale </poky/log/?h=langdale>`
 -  Tag:  :yocto_git:`yocto-4.1 </poky/log/?h=yocto-4.1>`
 -  Git Revision: :yocto_git:`5200799866b92259e855051112520006e1aaaac0 </poky/commit/?id=5200799866b92259e855051112520006e1aaaac0>`
@@ -716,7 +716,7 @@ poky
 
 openembedded-core
 
--  Repository Location: https://git.openembedded.org/openembedded-core
+-  Repository Location: :oe_git:`/openembedded-core`
 -  Branch: :oe_git:`langdale </openembedded-core/log/?h=langdale>`
 -  Tag:  :oe_git:`yocto-4.1 </openembedded-core/log/?h=yocto-4.1>`
 -  Git Revision: :oe_git:`744a2277844ec9a384a9ca7dae2a634d5a0d3590 </openembedded-core/commit/?id=744a2277844ec9a384a9ca7dae2a634d5a0d3590>`
@@ -728,7 +728,7 @@ openembedded-core
 
 meta-mingw
 
--  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Repository Location: :yocto_git:`/meta-mingw`
 -  Branch: :yocto_git:`langdale </meta-mingw/log/?h=langdale>`
 -  Tag:  :yocto_git:`yocto-4.1 </meta-mingw/log/?h=yocto-4.1>`
 -  Git Revision: :yocto_git:`b0067202db8573df3d23d199f82987cebe1bee2c </meta-mingw/commit/?id=b0067202db8573df3d23d199f82987cebe1bee2c>`
@@ -740,7 +740,7 @@ meta-mingw
 
 bitbake
 
--  Repository Location: https://git.openembedded.org/bitbake
+-  Repository Location: :oe_git:`/bitbake`
 -  Branch: :oe_git:`2.2 </bitbake/log/?h=2.2>`
 -  Tag:  :oe_git:`yocto-4.1 </bitbake/log/?h=yocto-4.1>`
 -  Git Revision: :oe_git:`074da4c469d1f4177a1c5be72b9f3ccdfd379d67 </bitbake/commit/?id=074da4c469d1f4177a1c5be72b9f3ccdfd379d67>`
@@ -752,7 +752,7 @@ bitbake
 
 yocto-docs
 
--  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
 -  Tag: :yocto_git:`yocto-4.1 </yocto-docs/log/?h=yocto-4.1>`
 -  Git Revision: :yocto_git:`42d3e26a0d04bc5951e640b471686f347dc9b74a </yocto-docs/commit/?id=42d3e26a0d04bc5951e640b471686f347dc9b74a>`
-- 
2.34.1


