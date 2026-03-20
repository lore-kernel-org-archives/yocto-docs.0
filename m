Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F990108B8F1
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9822.1774003590309858017
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TdnV0/W/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FB49C415B3
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF8EE600E0;
	Fri, 20 Mar 2026 10:46:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 817ED10450B97;
	Fri, 20 Mar 2026 11:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=z0uIU242Xoo0S7FNua+rYBq4ZfQUCDabF8U/IggKf2s=;
	b=TdnV0/W/2kbCPG08q6Cy3jbdfenTJh9qNKAG9TwaPX416RB/DfO7Kzgg3WwIJgvPBcJCUT
	rt+13EvwXT+0a5vE6BXEmLDaHxW8v7mbRwfUj3kXOTWdV0l2a/2kb/zJWyuAW0jBoVrtId
	TVlavaJlXsHkGsscPNKukr3G4pWWBLL+SlGhFQ1IB7treYiwWwlI0TelSxMZd3/M/NDV/J
	LTCEj/yk3gGe0tnVWpmcxCP5mZqAeUQbY9ugVs6XrJHDdYu0BK1rpELoMCP9eYLAVkc+/7
	Ib5CwbCnxie1NgF6K3yRgjmgoCJ5lePHTeCYblXFBHaDOUrdxsOaUTMN3Hlc/w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/8] Update the documentation for 6.0 (Wrynose)
Date: Fri, 20 Mar 2026 11:46:18 +0100
Message-Id: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2po+oKIr/8Ow4DHIGGxNpxIN4
 d8tsHVzk5Pce+4MjIGQ4ZLNEHAiJu8S6EMG7VC7OwrqEoOW2kqtjAg4Ys0onI/IwgopTsY0uSy
 tzbse0u4VsKfP5rxVO/O7eWAbV9HaGIijD9/tdFJrb/cbqf/4J5XibK3uEIuyOKtr430cyR1b/
 4RqWZYf08H8esYAAAA=
X-Change-ID: 20260213-release-notes-6-0-733b408664df
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=biW6+vVX2nnvnN3iaCC+Bh+6/KQot9g6c1e4dYSoSyw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWAro1uKXstWiPCrf6az9NwhvAXP4t3Xx4eW
 7rYOuYuF1uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgAAKCRDRgEFAKaOo
 NpppD/9cZL0ga/uyNX5JHAsC6ztaiGV1hdpcRjKhkaS9cUxgOIIUO5W+gs+spR0SfX2CTx+RkS3
 niFyTr9EXT/3cF8MPe56HZH3nrxmKnUzlJDSMtOlyGUPsTBXGAi505gyQ8KdVGTkoPre9XiW97Y
 NFrLvTAR7ZV8g8qhF2G+Ucj2uAlgIN8WUktuE6ntHyHG0TO7Km8Vm8No931DIazLDN5Qy0GsmuJ
 dTKFXv4Sut9n38cB96SyPir/9CgSAoEToT8t5Q+w0ScbQthlF6LZv5fzTby5WyxY6fOo86cSyz9
 hPzBlXzEDyS8hPU+M7Dw6e8/3juy+DEmuHIEdsY3h+wqYl5OROBn7wHGnGE6p7ieobv32R7niIm
 jnX3ulUHw8pvFbSIXpaILpeONy6a4c4X1xOcKlrzd6AovZ75wQHhD/HFgcsTeoLBdol5SmLKWK0
 oZomg4l0SjH2AhS2gKpqMGsNhh/A31KFos4o1pJzuz3eClHYTPNdcnqLq2W1Ebnla/GA6jPkfBn
 +NQ1Pl5TaivanMlqQ3pof8EApOjlGH+G6nBquGx8QByzM+gkLnFa8EuBIAiqBLjhcS7ekVgesJF
 oodV4ovBqjKaCZBV7ACKpHkAOb3oR+MqPD1E4c7SY9+ub7UHPLgurApdsHUz+U5GVxfBY4gCEi4
 t1339rKhsW1JOPg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9101

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestion of Quentin in v1 (thanks!)
- Link to v1: https://patch.msgid.link/20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com

---
Antonin Godard (8):
      conf.py: define new {oecore,bitbake,meta_yocto}_rev roles
      ref-manual/variables.rst: document qemuboot variables
      ref-manual/variables.rst: SPDX_PACKAGE_URL: add missing parenthesis
      ref-manual/variables.rst: document the LTO variable
      ref-manual/variables.rst: document the SPDX_CONCLUDED_LICENSE variable
      migration-guides: update 6.0 (Wrynose) release notes
      docs-wide: add warning on disabled NPM fetcher
      ref-manual/faq.rst: remove the CVS proxy note

 documentation/conf.py                              |  16 +-
 documentation/dev-manual/devtool.rst               |   5 +
 documentation/dev-manual/packages.rst              |  10 +-
 documentation/migration-guides/migration-6.0.rst   | 191 +++++++++-
 .../migration-guides/release-notes-6.0.rst         | 414 ++++++++++++++++++++-
 documentation/ref-manual/classes.rst               |   5 +
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/variables.rst             | 172 ++++++++-
 8 files changed, 790 insertions(+), 25 deletions(-)
---
base-commit: ca057a6b477b72698409d7b6c6ec49100f73d05d
change-id: 20260213-release-notes-6-0-733b408664df


