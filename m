Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23033.1792676305672374060
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 06:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kDrcNM9+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F4474E4126B
	for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A2CD60360
	for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A18AE10328E5A;
	Thu, 22 Oct 2026 15:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792676302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rwFyR6JH4KkePJnhBkpTkAkisVO3vVBfmnTDLyB98nU=;
	b=kDrcNM9+ELnFJk61EFwJA9Hk/6jTv5rMxjLVQtg86qrVz2fNgz5lSx5ZUmwSVyFh0nkY25
	VF48F10QX4nHuR8Ql87UeC8Wmvg1iLK9ytxcb+ObDlyUIl91KKHG7KHTHJW47ekUVyRohN
	hZfnIbjMdWoFiADqVcEjNaaJ1Hjog1Sgo/pSyQJhb5TFycDVm9LRXv14zWK3szDVpaeF51
	RvXGJ15WxHKZP8RhM33zeGKeakjaVG4FD6GozkV20djwvVKgptzsqTHsR6/TcxMerZyNSB
	J87QVbFRUvp7d/oAiwJAgkL1Sgmafit0Ipn5bTZQcPdJD40Stn6uu3/ZneWMsw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Convert releases.svg to an auto-generated diagram
Date: Thu, 22 Oct 2026 15:37:50 +0200
Message-Id: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrm3ClODCqxgXw8wP1jhoWjEmh
 Ls7yvJbvLeSwxROp2Ylw1tdH3NFODSUrnGewJqrSVo5hlaEC6xEzWy4Izo4a5wsFkbqkYcu9F0
 QqvXTMOrnfz5fdvsy3JBevx1t2xfisQcaewAAAA==
X-Change-ID: 20261022-mermaid-release-diagram-ec5edb315312
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=606;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vtlQmnQUWJWfkQuNBhC036CgJVZaEzKQ+1EhjRtJh9w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq2hHJf4TiKgY9hZnZce0EOKDel9ZCsHpfkSbBw
 nUvq73pdViJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCatoRyQAKCRDRgEFAKaOo
 NnG3D/9BI4qudwhEso6ZxZDLEFYTX0UrgpOKYYBAVqGj5GyMISSyhBn7gcXil0U3/IaKH1M6OzE
 +/dTLdk5Dbya+1kgsx13oiSPgF0UBqYuUE9tdSedzo959PWf1MBkNUF33Lty/7uIKIVEcAog295
 TRNAEYBEJraEzy3Jdm+lFz1rLvgAjXpI3QOJzHGxQ5QMkSLspVnnp5/t8iXtj0aScrQKigfgYCn
 WU1PrBtESiNaOsbRPVP1ZT/6K/Elb3Ox1DBgSJ8fO+nOahyBbe3BsQuM+6em2Dah4Rs3M1rgQzH
 rksFrBRm4HxYL9FVcLK003X/Yrmc2WIiGHCbQGtd+XlsqeCrKxa3Y2Oh65J6ShASqXHd+N64qlF
 IfmH6sB5BJx3QU47ry9TvG75dzPUQHvE7ctKfMxnlMzvva7VCcuv3wlcDSY22ECpFhZagAhuf6G
 2KuMEIioopE4zQP85IKXYRUTtZsABnpg5Jvy9FrnufUCJqaU3izioLj7IuXxvzOPaB2cZjJYEIO
 KFLWVPSE43/CeRMcxtGzKO5EHqLdAjEi2Bv62FT5eYFB0oONhoYvyV3geaZCPcPpjrR+BL0BoQM
 WafCXHC4328mtA27jFSzg4+MOST6yAA1j+aRYJmJl4x0+qLbo3kwh+jfy3F5WwtpvLP4XkWykZM
 Dd8oAGeRWWKmgSg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10714

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      tools/gen-releases-svg: add script
      ref-manual/svg/releases.svg: update diagram
      ref-manual/release-process.rst: add textual legend

 documentation/ref-manual/release-process.rst |    3 +
 documentation/ref-manual/svg/releases.svg    | 1899 +-------------------------
 documentation/tools/gen-releases-svg         |   95 ++
 3 files changed, 99 insertions(+), 1898 deletions(-)
---
base-commit: ebb7e45b41f6a58d1940038e5027f57f628a22c2
change-id: 20261022-mermaid-release-diagram-ec5edb315312

