Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2EDE7718D
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 08:47:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.148235.1734684418850817298
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 00:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AGlv4H9q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 225191BF205;
	Fri, 20 Dec 2024 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734684417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xnS4HhKhLhUq865WMHNBGMO79tR9rg58zIIg4x5rhV0=;
	b=AGlv4H9qR1W4p7OVlUcC9HR5gZSB0eXjWjEEX3kWaHEmNsOzIUowJMY8zm6XNTRchFU+uO
	ew3U0zEns8JVHt0zquO+1P91KhfsDWm4G82R+0LH0y3JoAeuh+ZD9ua/8O4js25OccZZ0N
	E/ecCxC+OXbxcYrJvr4RADgwUNLjFPzzk/BVWUN7pZg04130sbWnIGVT6N99i8vAT1IPRU
	4Q/IWn0URbOQgqnNfaSoM2yGfrSOP3xHtQw4YPsEXMEffA3MgZ1pfy5D2luSMgzYsKJe2+
	6wBlDIw+SgpKXAReikKniWGf9E4iQi/oZE0Ruu9YbuWxX6OCo58wM9XPNL4oBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 09:46:56 +0100
Message-Id: <D6GEAZE8D4ME.378CGTDDLBOA8@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 08:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5991

The following changes since commit 02c090718ac602f7d4760dd28dadbf0631668d49=
:

  system-requirements.rst: add dependencies for pdf builds (2024-12-16 08:5=
7:48 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 28850c974a3896895bc921c094071523218d6d07:

  set_versions.py: use backward-compatible python argument in run (2024-12-=
19 10:08:16 +0100)

----------------------------------------------------------------
Antonin Godard (2):
      Update the documentation for SRCPV
      set_versions.py: use backward-compatible python argument in run

Michael Opdenacker (3):
      dev-manual: fix styling of references to bmaptool
      dev-manual/bmaptool.rst: correct command for bmaptool-native
      dev-manual/bmaptool.rst: simplify and fix instructions

 .../contributor-guide/recipe-style-guide.rst       |  6 +--
 documentation/dev-manual/bmaptool.rst              | 29 +++++------
 documentation/dev-manual/external-scm.rst          |  9 ++--
 documentation/dev-manual/new-recipe.rst            | 10 ++--
 documentation/dev-manual/packages.rst              | 13 ++---
 documentation/dev-manual/wic.rst                   |  4 +-
 documentation/kernel-dev/common.rst                | 13 ++---
 documentation/ref-manual/variables.rst             | 59 ++++++++++--------=
----
 documentation/set_versions.py                      | 16 +++---
 9 files changed, 71 insertions(+), 88 deletions(-)

