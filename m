Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7844CCA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 13:10:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10890.1790860186556844538
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 06:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=G2Pw4Ak4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C79AA1A2671
	for <docs@lists.yoctoproject.org>; Thu,  1 Oct 2026 13:09:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D70A60341;
	Thu,  1 Oct 2026 13:09:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC4C2103280FE;
	Thu,  1 Oct 2026 15:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790860184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W/8NWdCaqpNN2Rvv8qmVreTseU4Zvv7yZqxcnq2Ufew=;
	b=G2Pw4Ak4yQxeX7DY3q2RiwBOdc7YDiU5PlSVMjKJZB6jhDbcuXK1VyQkShGJfPsB2rXQ5b
	sJOhTlvpQSt88NnTzuVUtRaJzP6HuDqEUVLVIrf+L18uUuzun3T3BCarCxOMcRIyrFEOQ1
	Dr8CNeNE+x9PaGRBbe1VnL0YzCeIRXqpHK83rgivc2ULh8+yrKOwKspsdeFyxTiuNO2MYN
	oit00DifG6mN95HBsr+MxZHHLW1WcMX5VCde+ZVBXVQwaUZ3kLfTJuKLJRA47doQGNwQ6R
	nW2w18DYYPPm/+NtDgC6hFqnDcBlHAtX76jQXZEQ+5OkB+xijxUVDxnHN4l0/g==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	antonin.godard@bootlin.com,
	paul@pbarker.dev,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 3/4] migration-guides/release-notes-6.1.rst: update contributors
Date: Thu,  1 Oct 2026 15:09:03 +0200
Message-ID: <20261001130904.2061644-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
References: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 13:10:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10651

Add latest contributors to the list.

Some of the author names are followed by a company name. Remove those, as
requested by the own company.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-6.1.rst | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/docum=
entation/migration-guides/release-notes-6.1.rst
index d048a245c..d6f992fe0 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -2048,12 +2048,14 @@ Thanks to the following people who contributed to=
 this release:
 -  Adarsh Jagadish Kamini
 -  Aditya GS
 -  Adrian Freihofer
+-  Aksh Garg
 -  Alejandro Hernandez Samaniego
 -  Alejandro Mery
 -  Alessandro Zini
 -  Alexander Kanavin
 -  Alexander Stein
 -  Alex Kiernan
+-  Alper Ak
 -  Amaury Couderc
 -  Anders Heimer
 -  Andreas M=C3=BCtzel
@@ -2073,6 +2075,7 @@ Thanks to the following people who contributed to t=
his release:
 -  Baban
 -  Babanpreet Singh
 -  Benjamin Robin
+-  Bhavikkumar Girishbhai Ronvelia
 -  Bin Cao
 -  Bruce Ashfield
 -  Changqing Li
@@ -2084,6 +2087,7 @@ Thanks to the following people who contributed to t=
his release:
 -  Daniel Dragomir
 -  Daniel McGregor
 -  Daniel Turull
+-  Daniel Wagenknecht
 -  David Nystr=C3=B6m
 -  David Reyna
 -  Dawid Bijak
@@ -2101,6 +2105,7 @@ Thanks to the following people who contributed to t=
his release:
 -  Ernest Van Hoecke
 -  Esa Jaaskela
 -  Etienne Cordonnier
+-  Fabian Pfitzner
 -  Fabian Pflug
 -  Fabien Lehoussel
 -  Fabio Estevam
@@ -2140,6 +2145,7 @@ Thanks to the following people who contributed to t=
his release:
 -  Jinwang Li
 -  Joao Marcos Costa
 -  Jo=C3=A3o Marcos Costa
+-  Joerg Vehlow
 -  Johan Anderholm
 -  John Ripple
 -  Jonas Juffinger
@@ -2176,6 +2182,7 @@ Thanks to the following people who contributed to t=
his release:
 -  Mathieu Dubois-Briand
 -  Matt Madison
 -  Mengshi Wu
+-  Metz, Josiah
 -  Michael Halstead
 -  Michael Opdenacker
 -  Michael Tretter
@@ -2207,6 +2214,7 @@ Thanks to the following people who contributed to t=
his release:
 -  Quentin Schulz
 -  Rasmus Villemoes
 -  Ricardo Salveti
+-  Ricardo Simoes
 -  Richard Purdie
 -  Robert P. J. Day
 -  Robert Yang
@@ -2233,11 +2241,12 @@ Thanks to the following people who contributed to=
 this release:
 -  Tan Siewert
 -  Taruntej Kanakamalla
 -  Tejas Kanfade
--  Theo Gaige (Schneider Electric)
+-  Theo Gaige
 -  Thomas Perrot
 -  Thorsten Schmelzer
 -  Thune Tran
 -  Tim Orling
+-  Tobias Pistora
 -  Trevor Gamblin
 -  Trevor Woerner
 -  T, Sai Sireesha
@@ -2264,6 +2273,7 @@ Thanks to the following people who contributed to t=
his release:
 -  Zheng Ruoqin
 -  Zhixiong Chi
 -  Zk47T
+-  Zoltan Boszormenyi
 -  Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
=20
 Repositories / Downloads for Yocto-|yocto-ver|
--=20
2.55.0


